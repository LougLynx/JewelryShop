/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

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
        try {
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDAO pdao = new ProductDAO();
            List<Category> categories = categoryDAO.getAllCategory();
            String txtSearch = request.getParameter("txtSearch") == null ? "" : request.getParameter("txtSearch");
            String cID = request.getParameter("cID") == null ? "" : request.getParameter("cID");
            String sort = request.getParameter("sort") == null ? "" : request.getParameter("sort");
            String priceRange = request.getParameter("priceRange") == null ? "" : request.getParameter("priceRange");

            int pageSize = getPageSize(6, pdao.getProductsWithPaging(txtSearch, null, 6, cID, sort, priceRange).size());
            String index = request.getParameter("pageIndex");
            int pageIndex = 1;
            if (index != null) {
                pageIndex = Integer.parseInt(index);
            }

            List<Product> ls = pdao.getProductsWithPaging(txtSearch, pageIndex, 6, cID, sort, priceRange);

            request.setAttribute("totalPage", pageSize);
            request.setAttribute("numberProduct", 6);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("searchValue", txtSearch);
            request.setAttribute("cID", cID);
            request.setAttribute("listP", ls);
            request.setAttribute("sort", sort);
            request.setAttribute("priceRange", priceRange);

            request.setAttribute("listC", categories);

            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int getPageSize(int numberProduct, int allProduct) {
        int pageSize = allProduct / numberProduct;
        if (allProduct % numberProduct != 0) {
            pageSize = (allProduct / numberProduct) + 1;
        }
        return pageSize;

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
