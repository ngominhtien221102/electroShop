/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.*;
import Utility.Ultilities;
/**
 *
 * @author Lenovo
 */
public class ChangePass extends HttpServlet {

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
        String newPass = request.getParameter("newPass");
        String repeatPass = request.getParameter("repeatPass");
        String OTP = request.getParameter("OTP");
        HttpSession ses = request.getSession();
        User user =(User)ses.getAttribute("userForgot");
        String OTPmail =(String)ses.getAttribute("code");
        Ultilities u = new Ultilities();
        if(!u.validPass(newPass))
        {
            request.setAttribute("error1", "Password must be between 4 and 12 characters");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            
        }
        if(!u.checkRepeatPass(newPass, repeatPass))
        {
            request.setAttribute("error2", "Please repeat password!");
            request.setAttribute("newPass", newPass);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
         
        }
        if(!OTP.equals(OTPmail))
        {   request.setAttribute("newPass", newPass);
        request.setAttribute("repeatPass", repeatPass);
             request.setAttribute("error3", "Please re-input CodeOTP");
             request.getRequestDispatcher("changepass.jsp").forward(request, response);
          
        }
        if(u.validPass(newPass) && u.checkRepeatPass(newPass, repeatPass) && (OTP.equals(OTPmail)))
        {
            DAO dao = new DAO();
            dao.UpdateUser(user.getID(), user.getUserName(), newPass, user.getName(), user.getAddress(), user.getEmail(), user.getPhone(), user.isStatus(), user.getRoleId());
            request.setAttribute("message", "Change pass sucessful!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
