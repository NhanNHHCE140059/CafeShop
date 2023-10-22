/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import db.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Cart;
import model.Product;

/**
 *
 * @author Aquarius
 */
public class ShowCart extends HttpServlet {

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
            out.println("<title>Servlet ShowCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowCart at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookie = request.getCookies();
        String phone = "";
        for (Cookie o : cookie) {
            if (o.getName().equals("phone")) {
                phone = o.getValue();
            }
        }
        if (phone.equals("")) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            action(request, response);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

    }

    private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookie[] = request.getCookies();
        String cart = "";
        for (Cookie o : cookie) {
            if (o.getName().equals("cart")) {
                cart = o.getValue();
            }
        }
        CategoryDAO c = new CategoryDAO();
        ArrayList<Cart> cartList = new ArrayList<>();
        Product product;
        int quantity;
        String ids[] = cart.split("_");
        //  for (int i = 0; i < ids.length; i++) {//
        int i = 0;
        while (i < ids.length && !ids[0].equals("")) {
            int id = Integer.parseInt(ids[i]);
            boolean isExisted = false;
            for (Cart o : cartList) {
                if (o.getProduct().getId() == id) {
                    o.setQuantity(o.getQuantity() + 1);
                    isExisted = true;
                    break;
                }
            }
            if (!isExisted) {
                Cart ca = new Cart();
                ca.setProduct(c.getProducts(id));
                ca.setQuantity(1);
                cartList.add(ca);
            }
            i++;
        }

        request.setAttribute("food", cartList);

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
