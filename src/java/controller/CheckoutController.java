/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import entity.Account;
import entity.Cart;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Khởi tạo các đối tượng DAO cần thiết để thao tác với dữ liệu
            OrderDAO odao = new OrderDAO();
            OrderDetailDAO oddao = new OrderDetailDAO();
            ProductDAO pdao = new ProductDAO();
            HttpSession session = request.getSession();
// Kiểm tra xem người dùng đã đăng nhập chưa
            Account a = (Account) session.getAttribute("acc");
            if (a != null) {
                // Lấy thông tin từ form checkout
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                // Lấy giỏ hàng từ session và tính tổng tiền
                Cart c = (Cart) session.getAttribute("cart");
                double totalPrice = 0;
                if (c != null) {
                    totalPrice = c.getAmount();// Lấy tổng giá trị giỏ hàng
                }
                // Kiểm tra giỏ hàng có rỗng không, nếu rỗng chuyển hướng về trang shop
                if (totalPrice == 0.0) {
                    response.sendRedirect("shop");
                    return;
                }
                // Tạo đối tượng Order mới với thông tin lấy từ form và tổng giá trị
                Order o = new Order(a.getId(), address, phone, name, totalPrice);
                // Lưu đơn hàng và lấy ID của đơn hàng mới
                int orderID = odao.insertOrder(o);
                // Lưu từng chi tiết của đơn hàng (mỗi sản phẩm trong giỏ)
                for (Product product : c.getItems()) {
                    OrderDetails od = new OrderDetails(orderID, product.getId(), product.getPrice(), product.getNumberInCart());
                    oddao.insertOrderDetails(od); // Thêm chi tiết đơn hàng vào DB
                }
                // Cập nhật số lượng sản phẩm còn lại trong kho
                for (Product product : c.getItems()) {
                    int reduceAmount = product.getAmount() - product.getNumberInCart();
                    pdao.updateAmounProduct(reduceAmount, product.getId());
                }
                // Xóa giỏ hàng khỏi session sau khi đặt hàng thành công
                session.removeAttribute("cart");
                request.setAttribute("message", "Order successfull!");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                // Chuyển hướng về trang login nếu người dùng chưa đăng nhập
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Order fail!");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
