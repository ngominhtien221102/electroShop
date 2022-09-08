/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
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
import Utility.Ultilities;

/**
 *
 * @author Lenovo
 */
public class EditPass extends HttpServlet {

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
             //Gio hang
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
            //Gio hang
            request.getRequestDispatcher("EditPass.jsp").forward(request, response);
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
       String CurrentPass = request.getParameter("CurrentPass");
       String NewPass = request.getParameter("NewPass");
       String RepeatPass = request.getParameter("RepeatPass");
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("Account");
        Ultilities u = new Ultilities();
        if(!user.getPassword().equals(CurrentPass))
        {
            request.setAttribute("error1", "Current pass error please re-input");
        }
        if(!u.validPass(NewPass))
        {   
            request.setAttribute("error2", "Password must be between 4 and 12 characters");
        }
        if(!u.checkRepeatPass(NewPass, RepeatPass))
        {   
            request.setAttribute("error3", "Repeat pass wrong Please re-input");
        }
        if((user.getPassword().equals(CurrentPass)) && u.validPass(NewPass) && u.checkRepeatPass(NewPass, RepeatPass))
        {   DAO dao = new DAO();
             dao.UpdateUser(user.getID(), user.getUserName(), NewPass, user.getName(), user.getAddress(), user.getEmail(), user.getPhone(), user.isStatus(), user.getRoleId());
            request.setAttribute("message", "Change pass successfull!");
        }
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
