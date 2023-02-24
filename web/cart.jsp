<%-- 
    Document   : index
    Created on : 26 Nov, 2022, 10:06:08 PM
    Author     : nayan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="Dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Log.Cart"%>
<%@page import="Log.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
     DecimalFormat dcf=new DecimalFormat("#.##");
     request.setAttribute("dcf",dcf);
     User auth=(User)request.getSession().getAttribute("auth");
 if(auth!=null)
 {
 request.setAttribute("auth",auth);
 }
 ArrayList<Cart> cart_list =(ArrayList<Cart>)session.getAttribute("cart-list");
 List<Cart> cartProduct=null;
 if(cart_list!=null)
 {
     ProductDao pdao=new ProductDao(DBConnection.getConnection());
     cartProduct= pdao.getCartProduct(cart_list);
     pdao.getTotalCartPrice(cart_list);
     float total=pdao.getTotalCartPrice(cart_list);
     request.setAttribute("cart_list",cart_list);
     request.setAttribute("total",total);
 }
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome To Electronic Store!</title>
        <%@include file="includes/head.jsp" %>
        <style type="text/css">
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre,.btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>
    <body>
       <%@include file="includes/main.jsp" %>
       
       <div class="container">
           <div class="d-flex py-3"><h3>Total Price: ${ (total>0)?dcf.format(total):0 }</h3><a class="mx-3 btn btn-primary" href="cartcheckout">Check outs</a></div>
           <table class="table table-loght">
               <thead>
                   <tr>
                       <th scope="col">Name</th>
                       <th scope="col">Category</th>
                       <th scope="col">Price</th>
                       <th scope="col">Buy Now</th>
                       <th scope="col">Cancel</th>
                   </tr>
               </thead>
               <tbody>
                   <% if(cart_list!=null)
                   { for(Cart c:cartProduct)
                   {%>
                        <tr>
                       <td><%=c.getName()%></td>
                       <td><%=c.getCategory()%></td>
                       <td><%=dcf.format(c.getPrice())%></td>
                       <td>
                           <form action="Order-now" method="post" class="form-inline">
                               <input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
                               <div class="form-group d-flex justify-content-between w-50">
                                   <a class="btn btn-sm btn-decre" href="quan-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                   <input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity()%>" readonly>
                                   <a class="btn btn-sm btn-incre" href="quan-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
                               </div>
                               <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                           </form>
                       </td>
                       <td><a class="btn btn-sm btn-danger" href="Removecart?id=<%=c.getId()%>">Remove</a></td>
                   </tr>
                  <% }
                       }%>
                  </tbody>
           </table>
       </div>
       
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
