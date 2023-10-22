/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import model.Product;
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
import java.util.Hashtable;

/**
 *
 * @author Aquarius
 */
public class OrderFood extends HttpServlet {

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
            out.println("<title>Servlet OrderFood</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderFood at " + request.getContextPath() + "</h1>");
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
            request.getRequestDispatcher("orderfood.jsp").forward(request, response);
        }

    }

    private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO c = new CategoryDAO();
        ArrayList<Product> product = c.getAllProducts();
        ArrayList<Product> food = new ArrayList<>();
        ArrayList<Product> beverage = new ArrayList<>();
        ArrayList<Product> dessert = new ArrayList<>();
        int i = 0;
        for (i = 0; i < product.size(); i++) {
            if (product.get(i).getCategory().equals("Food")) {
                food.add(product.get(i));
            } else {
                break;
            }
        }
        for (i = i; i < product.size(); i++) {
            if (product.get(i).getCategory().equals("Dessert")) {
                dessert.add(product.get(i));
            } else {
                break;
            }
        }
        for (i = i; i < product.size(); i++) {
            if (product.get(i).getCategory().equals("Beverage")) {
                beverage.add(product.get(i));
            } else {
                break;
            }
        }
        request.setAttribute("food", food);
        request.setAttribute("dessert", dessert);
        request.setAttribute("beverage", beverage);

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
