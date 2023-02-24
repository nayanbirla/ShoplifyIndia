<%-- 
    Document   : index
    Created on : 26 Nov, 2022, 10:06:08 PM
    Author     : nayan
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Log.Cart"%>
<%@page import="Log.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%User auth=(User)request.getSession().getAttribute("auth");
 if(auth!=null)
 {
 request.setAttribute("auth",auth);
  response.sendRedirect("index.jsp");
  
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
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-centre">User Login</div>
                <div class="card-body">
                    <form action="Userlogin" method="post">
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" class="form-control" name="login-email" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="login-password" placeholder="********" required>
                        </div>
                        <div class="text-centre">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                        
                    </form>
                    <br>
                    <a href="Register.jsp">Register</a>
                    
                </div>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
