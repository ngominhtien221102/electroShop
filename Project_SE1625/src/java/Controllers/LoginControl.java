/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Utility.Ultilities;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class LoginControl extends HttpServlet {

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
            String User = request.getParameter("Username");
            String Password = request.getParameter("Password");
            String remember = request.getParameter("rem");
            DAO dao = new DAO();
            Ultilities u = new Ultilities();
            User user = u.checkExistAccount(User, Password);
            if (user == null) {
                request.setAttribute("Alert", "Account is not exist please retype!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                
                HttpSession ses = request.getSession();
                ses.setAttribute("Account", user);
                ses.setMaxInactiveInterval(60*10);
                if(!user.isStatus())
                {
                    request.getRequestDispatcher("Verify.jsp").forward(request, response);
                }
                
                //de luu username, pass
                Cookie cu = new Cookie("user", user.getUserName());
                Cookie cp = new Cookie("pass", user.getPassword());
                Cookie cr = new Cookie("remember", remember);

                //check xem co tich vao remember me khong
                if (remember == null) {
                    cu.setMaxAge(0);    // set thoi gian hoat dong cho cookie = 0
                    cp.setMaxAge(0);
                    cr.setMaxAge(0);
                } else {
                    cu.setMaxAge(60 * 60 * 24); // set thoi gian hoat dong cho cookie = 1 ngay
                    cp.setMaxAge(60 * 60 * 24);
                    cr.setMaxAge(60 * 60 * 24);
                }
                response.addCookie(cu); //add cookie
                response.addCookie(cp);
                response.addCookie(cr);
                request.getRequestDispatcher("HomeControl").forward(request, response);

            }

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
