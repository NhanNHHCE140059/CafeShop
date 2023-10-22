/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import model.Cart;

/**
 *
 * @author Aquarius
 */
public class DeleteOrder extends HttpServlet {

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
            out.println("<title>Servlet DeleteOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteOrder at " + request.getContextPath() + "</h1>");
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
            response.sendRedirect(request.getContextPath() + "/customer/cart");
        }
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

    private void action(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie[] = request.getCookies();
        String cart = "";
        for (Cookie o : cookie) {
            if (o.getName().equals("cart")) {
                cart = o.getValue();
            }
        }
        String id = request.getParameter("id");
        ArrayList<String> ids = new ArrayList<>(Arrays.asList(cart.split("_")));
        while (ids.contains(id)) {
            ids.remove(id);
        }
        cart = "";
        for (String i : ids) {
            if (cart.isEmpty()) {
                cart = i;
            } else {
                cart += "_" + i;
            }
        }
        Cookie c = new Cookie("cart", cart);
        response.addCookie(c);
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
