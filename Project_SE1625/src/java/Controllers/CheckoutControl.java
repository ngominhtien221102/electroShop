/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Model.Cart;
import Model.User;
import Utility.Ultilities;
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
public class CheckoutControl extends HttpServlet {

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
            DAO dao = new DAO();
            Ultilities u = new Ultilities();
            Cart cart = new Cart();
            //Gio hang
            HttpSession ses = request.getSession();
            User us = (User) ses.getAttribute("Account");
            if (us != null) {
                String userName = us.getUserName();
                Cookie[] arr = request.getCookies();
                String txt = "";
                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("cart" + userName)) {
                            txt = o.getValue();
                        }
                    }
                }
                 cart = new Cart(txt);
                request.setAttribute("cart", cart);
            }
            //Gio hang
            User user =  u.getUserByID(us.getID());
            request.setAttribute("User", u.getUserByID(us.getID()));


            request.getRequestDispatcher("Checkout.jsp").forward(request, response);
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
        DAO dao = new DAO();
            Ultilities u = new Ultilities();
            Cart cart = new Cart();
            //Gio hang
            HttpSession ses = request.getSession();
            User us = (User) ses.getAttribute("Account");
            if (us != null) {
                String userName = us.getUserName();
                Cookie[] arr = request.getCookies();
                String txt = "";
                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("cart" + userName)) {
                            txt = o.getValue();
                        }
                    }
                }
                 cart = new Cart(txt);
                request.setAttribute("cart", cart);
            }
            //Gio hang
            
            String note = request.getParameter("Note");
            if(note.isEmpty())
            {
                note = "";
            }
            User user =  u.getUserByID(us.getID());
            request.setAttribute("User", u.getUserByID(us.getID()));
            if(us == null)
            {
                response.sendRedirect("HomeControl");
            }
            else
            {
                dao.addOrder(us, cart, note);
                Cookie c = new Cookie("cart"+user.getUserName(), "");
                c.setMaxAge(0);
                response.addCookie(c);
                 response.sendRedirect("HomeControl");
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
