/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DBConnection.DBConnection;
import Dao.ProductDao;
import Log.Product;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author nayan
 */
@WebServlet(name = "Addprod", urlPatterns = {"/Addprod"})
@MultipartConfig(fileSizeThreshold= 1024*1024*2,
        maxFileSize=1024*1024*2,
        maxRequestSize=1024*1024*50
)
public class Addprod extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Addprod</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Addprod at " + request.getContextPath() + "</h1>");
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
        String s1=request.getParameter("pname");
        String s2=request.getParameter("category");
        float s3=Float.parseFloat(request.getParameter("price"));
        Part part=request.getPart("image");
        String fileName=part.getSubmittedFileName();
        String uploadpath="C:/Users/nayan/Documents/NetBeansProjects/Electronics Store/web/product-images/"+fileName;
        try{
            FileOutputStream fos=new FileOutputStream(uploadpath);
            InputStream in=part.getInputStream();
            byte[] data=new byte[in.available()];
            in.read(data);
            fos.write(data);
            fos.close();
            
        }catch(Exception tt)
        {
            System.out.println(tt);
        }
        Product pd=new Product();
        pd.setName(s1);
        pd.setCategory(s2);
        pd.setPrice(s3);
        pd.setImage(fileName);
        ProductDao pad=new ProductDao(DBConnection.getConnection());
        boolean b=pad.insertpro(pd);
        PrintWriter out=response.getWriter();
        if(b)
        {
            out.println("product added Successfully");
        }
        else
        {
            out.println("kuch to gadbad hai");
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
