/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Model.Cart;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class EditCart extends HttpServlet {

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
           
           HttpSession ses = request.getSession();
            User us = (User) ses.getAttribute("Account");
            if(us != null)
            {    
            String userName = us.getUserName();
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o :arr) {
                    if (o.getName().equals("cart"+userName)) {
                        txt = o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt);
            
            
            
                request.setAttribute("cart", cart);

            }
            
            
            
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
            
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
            
            HttpSession ses = request.getSession();
            User us = (User) ses.getAttribute("Account");
            if(us != null)
            {    
            int id = 0 ;
            int num = 1;
            try {
                 id = Integer.parseInt(request.getParameter("id"));
                 num = Integer.parseInt(request.getParameter("num"));
            } catch (NumberFormatException e) {
            }
            String userName = us.getUserName();
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o :arr) {
                    if (o.getName().equals("cart"+userName)) {
                        txt = o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt);
            cart.reduceItem(id, num);
            Cookie c = new Cookie("cart"+userName, cart.toCookie());
                c.setMaxAge(2 * 24 * 60 * 60);
                response.addCookie(c);
                
                
                Cart cartNew = new Cart(cart.toCookie());
                request.setAttribute("cart", cartNew);
             }
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        
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
