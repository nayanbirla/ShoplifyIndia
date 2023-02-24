/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Log.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nayan
 */
@WebServlet(name = "ADDTOCartServlet", urlPatterns = {"/add-to-cart"})
public class ADDTOCartServlet extends HttpServlet {

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
            out.println("<title>Servlet ADDTOCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ADDTOCartServlet at " + request.getContextPath() + "</h1>");
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
       response.setContentType("text/html");
       try(PrintWriter out=response.getWriter())
       {
           ArrayList<Cart> cartlist=new ArrayList<>();
           int id=Integer.parseInt(request.getParameter("id"));
          Cart cm=new Cart();
          cm.setId(id);
          cm.setQuantity(1);
          HttpSession session=request.getSession();
          ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
          if(cart_list==null)
          {
              cartlist.add(cm);
              session.setAttribute("cart-list",cartlist);
              response.sendRedirect("index.jsp");
              
          }else{
              cartlist=cart_list;
              boolean exist=false;
              for(Cart c:cart_list)
              {
                  if(c.getId()==id){
                      exist=true;
                      out.println("<h3 style='color:crimson; text-aling:centre'>Item already exist in Cart.<a href='cart.jsp'>Go to cart page</a>");
                  }
                  
              }
              if(!exist){
                      cartlist.add(cm);
                      response.sendRedirect("index.jsp");
                  }
              
//              for(Cart c:cart_list){
//                  out.println(c.getId());
//              }
//              for(Cart c:cartlist)
//              {
//                  out.print(c.getId());
//              }
          }
       }
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
