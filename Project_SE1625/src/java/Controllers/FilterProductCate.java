/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Model.Cart;
import Utility.Ultilities;
import Model.Categories;
import Model.PageInfor;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class FilterProductCate extends HttpServlet {

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
            ArrayList<Categories> cList = dao.getCateL();
            ArrayList<String> bList = dao.getBrand();
            int ID = 1;
            try {
                ID = Integer.parseInt(request.getParameter("type"));
            } catch (Exception e) {
            }
            ArrayList<Product> pList = u.FilterProductsByCate(ID);
            request.setAttribute("pList", pList);

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
                Cart cart = new Cart(txt);
                request.setAttribute("cart", cart);
            }
            //Gio hang

            //Phan trang
            int np = 1;
            if (request.getParameter("np") != null) {
                np = Integer.parseInt(request.getParameter("np"));
            }
            int cp = 0;
            if (request.getParameter("cp") != null) {
                cp = Integer.parseInt(request.getParameter("cp"));
            }
            int nrpp = 3;
            if (request.getParameter("nrpp") != null) {
                nrpp = Integer.parseInt(request.getParameter("nrpp"));
            }
            ses.setAttribute("nrpp", nrpp);
            if (request.getParameter("Home") != null) {
                cp = 0;//click vao nut home
            }
            if (request.getParameter("Pre") != null) {
                cp = cp - 1;
            }
            if (request.getParameter("Next") != null) {
                cp = cp + 1;
            }
            if (request.getParameter("End") != null) {
                cp = np - 1;
            }
            for (int i = 0; i < np; i++) {
                if (request.getParameter("btn" + i) != null) {
                    cp = i; //click vao nut i
                }
            }
            PageInfor page = new PageInfor(cp, nrpp, pList.size());
            page.calc();
            ses.setAttribute("CP", page);
            //Phan trang

            request.setAttribute("bList", bList);
            request.setAttribute("cList", cList);
            request.setAttribute("method", "FilterProductCate");
            request.getRequestDispatcher("store.jsp").forward(request, response);
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
