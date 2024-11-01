/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
        HttpSession session = request.getSession(true); // Khởi tạo session để lưu trữ giỏ hàng
        // Lấy id và action từ request (id sản phẩm và hành động)
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        // Tạo ProductDAO để tương tác với dữ liệu sản phẩm
        ProductDAO pdao = new ProductDAO();
        // Kiểm tra xem id và action có hợp lệ không
        if (!(id == null && action == null)) {
            // Nếu action là "add" (thêm sản phẩm)
            if (action != null && action.equalsIgnoreCase("add")) {
                // Kiểm tra xem session có giỏ hàng chưa, nếu chưa thì tạo mới
                if (session.getAttribute("cart") == null) {
                    List<Product> lst = new ArrayList<>();
                    session.setAttribute("cart", new Cart(lst));
                }
                // Thêm sản phẩm vào giỏ hàng
                Product p = pdao.getProductByID(id);
                Cart c = (Cart) session.getAttribute("cart");
                c.add(new Product(p.getId(), p.getName(), p.getImage(), p.getPrice(),
                        p.getTitle(), p.getDescription(), p.getCateID(),
                        p.getAmount(), 1, p.getIsDeleted()));
                session.setAttribute("cart", c);
            }
            // Nếu action là "minus" (giảm số lượng sản phẩm)
            if (action != null && action.equalsIgnoreCase("minus")) {
                Product p = pdao.getProductByID(id);
                Cart c = (Cart) session.getAttribute("cart");
                c.minus(new Product(p.getId(), p.getName(), p.getImage(), p.getPrice(),
                        p.getTitle(), p.getDescription(), p.getCateID(),
                        p.getAmount(), p.getIsDeleted()));
                session.setAttribute("cart", c);
            } else if (action != null && action.equalsIgnoreCase("delete")) { // Nếu action là "delete" (xoá sản phẩm)
                Cart c = (Cart) session.getAttribute("cart");
                c.remove(Integer.parseInt(id));
                session.setAttribute("cart", c);
            }
        }
        // Chuyển hướng người dùng đến trang cart.jsp
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        processRequest(request, response);
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
