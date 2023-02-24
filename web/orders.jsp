<%-- 
    Document   : index
    Created on : 26 Nov, 2022, 10:06:08 PM
    Author     : nayan
--%>

<%@page import="Log.Order"%>
<%@page import="Dao.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Dao.ProductDao"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Log.Cart"%>
<%@page import="Log.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%DecimalFormat dcf=new DecimalFormat("#.##");
     request.setAttribute("df",dcf);
     User auth=(User)request.getSession().getAttribute("auth");
List<Order> orders=null;
     if(auth!=null){
 request.setAttribute("auth",auth);
  orders=new OrderDao().userOrders(auth.getId());
 
 
 }else{
     response.sendRedirect("login.jsp");
 }
 

ArrayList<Cart> cart_list =(ArrayList<Cart>)session.getAttribute("cart-list");
 List<Cart> cartProduct=null;
 if(cart_list!=null)
 {
     
     request.setAttribute("cart_list",cart_list);
 }
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome To Electronic Store!</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
       <%@include file="includes/main.jsp" %>
       <div class="container">
           <div class="cart-header my-3">All Orders</div>
           <table class="table table-light">
               
               <thead>
                   <tr>
                       <th scope="col">Date</th>
                       <th scope="col">Name</th>
                       <th scope="col">Category</th>
                       <th scope="col">Quantity</th>
                       <th scope="col">Price</th>
                       <th scope="col">Cancel</th>
               </tr>
               </thead>
               <tbody>
                 <%
                     if(orders!=null)
                     {
                         for(Order o:orders){%>
                         <tr>
                         <td><%=o.getDate()%></td>
                         <td><%=o.getName()%></td>
                         <td><%=o.getCategory()%></td>
                         <td><%=o.getQty()%></td>
                         <td><%=dcf.format(o.getPrice())%></td>
                         <td><a class="btn btn-sm btn-danger" href="Cancel-order?id=<%=o.getOrderid()%>">Cancel</a></td>
           </tr>
                   <%} }
                 %>  
               </tbody>
           </table>
       </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
