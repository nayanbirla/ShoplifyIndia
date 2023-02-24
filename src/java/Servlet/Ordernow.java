/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Dao.OrderDao;
import Log.Cart;
import Log.Order;
import Log.User;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nayan
 */
@WebServlet(name = "Ordernow", urlPatterns = {"/Order-now"})
public class Ordernow extends HttpServlet {

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
            out.println("<title>Servlet Ordernow</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ordernow at " + request.getContextPath() + "</h1>");
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
      try(PrintWriter out=response.getWriter())
      {
          
          SimpleDateFormat formatted=new SimpleDateFormat("yyyy-MM-dd");
          Date date=new Date();
          User auth=(User)request.getSession().getAttribute("auth");
          if(auth==null)
              response.sendRedirect("login.jsp");
          if(auth!=null)
          {
              String productid=request.getParameter("id");
              int productqty=Integer.parseInt(request.getParameter("quantity"));
              if(productqty<=0)
              {
                  productqty=1;
              }
              
              Order ordermodel=new Order();
              ordermodel.setId(Integer.parseInt(productid));
              ordermodel.setUid(auth.getId());
              ordermodel.setQty(productqty);
              ordermodel.setDate(formatted.format(date));
              
              OrderDao ord=new OrderDao();
              boolean result=ord.insertOrder(ordermodel);
              if(result)
              {
                    ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
               if(cart_list!=null)
               {  
                   for(Cart c:cart_list){
                   if(c.getId()==Integer.parseInt(productid))
                   {
                       cart_list.remove(cart_list.indexOf(c));
                       break;
                   }
               
                   }
                  
                   
              }
               response.sendRedirect("orders.jsp");
//              else
//              {
//                  out.println("order failed");
//              }
//              
          }else{
              response.sendRedirect("login.jsp");
          }
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
        doGet(request, response);
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
