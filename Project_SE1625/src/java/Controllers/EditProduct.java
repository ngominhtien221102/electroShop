/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Model.*;
import Utility.Ultilities;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
@MultipartConfig
public class EditProduct extends HttpServlet {

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
            ArrayList<Product> pList = dao.getProL();
            ArrayList<Categories> cList = dao.getCateL();
            int id = 0;
            try {

                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
            }
            String type = request.getParameter("type");
            if (type != null && type.equals("0")) {
                dao.delProduct(id);
            } else if (type != null && type.equals("1")) {
                ArrayList<Product> productList = dao.getProL();
                for (Product p : productList) {
                    if (p.getID() == id) {
                        request.setAttribute("Product", p);
                    }
                }

            }
            
            //Phan trang
            HttpSession ses = request.getSession();
            int np = 1;
            if(request.getParameter("np") != null)
                np = Integer.parseInt(request.getParameter("np"));
            int cp = 0;
            if(request.getParameter("cp") != null)
                cp = Integer.parseInt(request.getParameter("cp"));
            int nrpp = 1;
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
            PageInfor page = new PageInfor(cp, nrpp, pList.size());
            page.calc();
            ses.setAttribute("CP", page);
            //Phan trang

            request.setAttribute("pList", pList);
            request.setAttribute("cList", cList);
            request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);

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

        // get image and save image to a foder at server
        String uploadFolder = request.getServletContext().getRealPath("/Product_Image");
        Path uploadPath = Paths.get(uploadFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectory(uploadPath); // neu chua ton tai foder postimg thi tao
        }
        Part imagePart = request.getPart("Image"); // tra ve doi tuong file 'image'
        String imageFilename = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        if(!imageFilename.isEmpty())
        {
              imagePart.write(Paths.get(uploadPath.toString(), imageFilename).toString()); //save to foder 
        }
      

        DAO dao = new DAO();
        String Name = request.getParameter("Name");
        int Quantity = 0;
        float Price = 0;
        int Category = 0;
        String Brand = request.getParameter("Brand");
        String Description = request.getParameter("Description");
        float OldPrice = 0;
        String Color = request.getParameter("Color");
        String Size = request.getParameter("Size");
        try {
            Quantity = Integer.parseInt(request.getParameter("Quantity"));
            Price = Float.parseFloat(request.getParameter("Price"));
            Category = Integer.parseInt(request.getParameter("Category"));
            OldPrice = Float.parseFloat(request.getParameter("OldPrice"));
        } catch (NumberFormatException e) {
        }
        String id = request.getParameter("ID");
        if (id.isEmpty()) {
            dao.InsertProduct(Name, Quantity, Price, Category, Brand, Description, OldPrice, imageFilename, Color, Size);
        } else {
                int ID = 0;
                try {
                    ID = Integer.parseInt(id);
                } catch (Exception e) {
                }
                Ultilities u = new Ultilities();
                if(imageFilename.isEmpty())
                {
                    imageFilename = u.getProductById(ID).getImage();
                }
                dao.UpdateProduct(ID, Name, Quantity, Price, Category, Brand, Description, OldPrice, imageFilename, Color, Size);
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
