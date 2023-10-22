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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import model.OrderStatus;
import model.Product;

/**
 *
 * @author Aquarius
 */
public class SaveOrder extends HttpServlet {

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
            out.println("<title>Servlet SaveOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveOrder at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        CategoryDAO c = new CategoryDAO();
        Hashtable<Product, Integer> a = (Hashtable<Product, Integer>) session.getAttribute("a");
        String address = request.getParameter("address");
        double total = Double.parseDouble(request.getParameter("total"));
        String phone = getPhone(request, response);
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatterHour = DateTimeFormatter.ofPattern("HH:mm:ss");
        DateTimeFormatter formatterDateHour = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String date = currentDateTime.format(formatterDate);
        String hour = currentDateTime.format(formatterHour);
        String dateHour = currentDateTime.format(formatterDateHour);

        c.setOrder(phone, dateHour, total, date, hour, address);

        for (Product product : a.keySet()) {
            c.setOrderStatus(dateHour, product.getName(), product.getRealPrice(), a.get(product), (product.getRealPrice() * a.get(product)));
        }
        request.setAttribute("date", date);
        request.setAttribute("time", hour);
        request.setAttribute("total", total);
        request.setAttribute("orderId", dateHour);
        request.setAttribute("address", address);
        ArrayList<OrderStatus> orderstatus = c.getOrderStatus(dateHour);
        request.setAttribute("food", orderstatus);

        session.invalidate();
        removeCart(request, response);
        request.getRequestDispatcher("finishOrder.jsp").forward(request, response);

    }

    private String getPhone(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie[] = request.getCookies();
        for (Cookie o : cookie) {
            if (o.getName().equals("phone")) {
                return o.getValue();
            }
        }
        return null;
    }

    private void removeCart(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = new Cookie("cart", "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
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
