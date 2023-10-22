/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import db.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Aquarius
 */
public class UpdateFood extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateFood</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateFood at " + request.getContextPath() + "</h1>");
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
        if (getUser(request, response) == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            CategoryDAO c = new CategoryDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = c.getProducts(id);
            request.setAttribute("name", product.getName());
            request.setAttribute("price", product.getPrice());
            request.setAttribute("sale", product.getSalePercent());
            request.setAttribute("category", product.getCategory());
            request.setAttribute("description", product.getDescription());

            request.setAttribute("id", id);
            request.getRequestDispatcher("updatefood.jsp").forward(request, response);
        }
    }

    private String getUser(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie[] = request.getCookies();
        for (Cookie o : cookie) {
            if (o.getName().equals("admin")) {
                return o.getValue();
            }
        }
        return null;
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price_raw = request.getParameter("price");
        String sale_raw = request.getParameter("sale");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(price_raw);
        double sale = Double.parseDouble(sale_raw);
        CategoryDAO c = new CategoryDAO();
        c.updateFood(Integer.parseInt(id), name, price, sale, category, description);
        response.sendRedirect("foodList");
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
