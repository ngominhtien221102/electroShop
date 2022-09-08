/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Model.PageInfor;
import Model.Role;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class EditUser extends HttpServlet {

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
            int id = 0;
            try {

                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
            }
            String type = request.getParameter("type");
            if (type != null && type.equals("0")) {
                dao.delUser(id);
            } else if (type != null && type.equals("1")) {
                ArrayList<User> userList = dao.getUsers();
                for (User user : userList) {
                    if (user.getID() == id) {
                        request.setAttribute("user", user);
                    }
                }

            }
            
          

            ArrayList<User> uList = dao.getUsers();
            ArrayList<Role> rList = dao.getRoleList();
            
            
            
                   //Phan trang
            HttpSession ses = request.getSession();
            int np = 1;
            if(request.getParameter("np") != null)
                np = Integer.parseInt(request.getParameter("np"));
            int cp = 0;
            if(request.getParameter("cp") != null)
                cp = Integer.parseInt(request.getParameter("cp"));
            int nrpp = 2;
            if(request.getParameter("nrpp") != null)
                nrpp = Integer.parseInt(request.getParameter("nrpp"));       
            ses.setAttribute("nrpp",nrpp);
            if(request.getParameter("Home") != null) cp = 0;//click vao nut home
            if(request.getParameter("Pre") != null) cp = cp-1;
            if(request.getParameter("Next") != null) cp = cp+1;
            if(request.getParameter("End") != null) cp = np-1;
            for (int i = 0; i < np; i++) {
                if (request.getParameter("btn"+i) != null) cp = i; //click vao nut i
            }
            PageInfor page = new PageInfor(cp, nrpp, uList.size());
            page.calc();
            ses.setAttribute("CP", page);
            //Phan trang
            request.setAttribute("uList", uList);
            request.setAttribute("rList", rList);
            request.getRequestDispatcher("ManagerUser.jsp").forward(request, response);
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
        int ID = 2;
        Boolean Status = true;
        int RoleID = 3;
        try {
            ID = Integer.parseInt(request.getParameter("ID"));
            Status = Boolean.parseBoolean(request.getParameter("Status"));
            RoleID = Integer.parseInt(request.getParameter("Role"));
        } catch (Exception e) {
        }
        String UserName = request.getParameter("UserName");
        String Password = request.getParameter("Password");
        String Name = request.getParameter("Name");
        String Address = request.getParameter("Address");
        String Email = request.getParameter("Email");
        String Phone = request.getParameter("Phone");
        DAO dao = new DAO();
        dao.UpdateUser(ID, UserName, Password, Name, Address, Email, Phone, Status, RoleID);
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
