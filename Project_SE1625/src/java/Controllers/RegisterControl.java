/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Model.SendEmail;
import Model.User;
import Utility.Ultilities;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.PasswordAuthentication;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Lenovo
 */
public class RegisterControl extends HttpServlet {

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
            throws ServletException, IOException, UnsupportedEncodingException {
        DAO dao = new DAO();
        Ultilities u = new Ultilities();
        String fullName = request.getParameter("Fullname");
        String email = request.getParameter("Email");
        String UserName = request.getParameter("UserName");
        String Password = request.getParameter("Password");
        String RepeatPass = request.getParameter("RepeatPass");
        String Address = request.getParameter("Address");
        String Phone = request.getParameter("Phone");
        //Check Fullname
        if (!u.validName(fullName)) {
            request.setAttribute("ErrorFullName", "Name must be between 2 and 32 characters");
        }

        //check email
        if (!u.validEmail(email)) {
            request.setAttribute("ErrorEmail", "Invalid type of email!, for example: example1@gmail.com");
        } else {
            if (u.checkExistEmail(email)) {
                request.setAttribute("ExistEmail", "Email already registered, please re-enter email!");
            }
        }

        //check userName
        if (!u.validUsername(UserName)) {
            request.setAttribute("ErrorUser", "User name must be between 4 and 12 characters and be the number or alphabet characters");
        } else {
            if (u.checkExistUsername(UserName)) {
                request.setAttribute("ExistUser", "UserName already registered, please re-enter UserName!");
            }
        }

        //check PassWord
        if (!u.validPass(Password)) {
            request.setAttribute("ErrorPassword", "Password must be between 4 and 12 characters");
        } else {
            if (!u.checkRepeatPass(Password, RepeatPass)) {
                request.setAttribute("ErrorRepeatPass", "Please repeat password!");
            }
        }

        //Check phone
        if (!u.validPhone(Phone)) {
            request.setAttribute("ErrorPhone", "Wrong phone format please Re-input phone!");
        }

        //Check successful
        if (u.validName(fullName) && !u.checkExistEmail(email) && u.validEmail(email)
                && u.validUsername(UserName) && !u.checkExistUsername(UserName)
                && u.validPass(Password) && u.checkRepeatPass(Password, RepeatPass)
                && u.validPhone(Phone)) {
            //send email
            dao.InsertUser(UserName, Password, fullName, Address, email, Phone);
            SendEmail verify = new SendEmail();
            String code = verify.getrdcode();
            User user = dao.getUs(UserName);
            try {
                verify.Sendmail(user.getEmail(), code);
            } catch (MessagingException ex) {
                Logger.getLogger(RegisterControl.class.getName()).log(Level.SEVERE, null, ex);
            }
            dao.updateCode(user.getID(), code);
             HttpSession ses = request.getSession();
             ses.setAttribute("Account", user);
             request.getRequestDispatcher("Verify.jsp").forward(request, response);
        }

        request.setAttribute("fullName", fullName);
        request.setAttribute("Email", email);
        request.setAttribute("UserName", UserName);
        request.setAttribute("Password", Password);
        request.setAttribute("RepeatPass", RepeatPass);
        request.setAttribute("Address", Address);
        request.setAttribute("Phone", Phone);
        request.getRequestDispatcher("Registration.jsp").forward(request, response);

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
