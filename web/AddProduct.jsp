<%-- 
    Document   : AddProduct
    Created on : 5 Dec, 2022, 5:30:03 PM
    Author     : nayan
--%>

<%@page import="Log.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%User auth=(User)request.getSession().getAttribute("auth");
if(auth==null)
{
    response.sendRedirect("login.jsp");
}
if(auth!=null)
 {
     int a=auth.getTyp();
     if(a==0)
     {
 request.setAttribute("auth",auth);
 response.sendRedirect("index.jsp");
     }
 }%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD PRODUCt</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/main.jsp" %>
        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-centre">Add Product</div>
                <div class="card-body">
                    <form action="Addprod" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Product Name</label>
                            <input type="text" class="form-control" name="pname" placeholder="Enter Product name" required>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <input type="text" class="form-control" name="category" placeholder="Enter Product Category" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="text" class="form-control" name="price" placeholder="Price" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" class="form-control" name="image" required>
                        </div>
                        <!--<div class="text-centre">-->
                            <button type="submit" class="btn btn-primary">Add Product</button>
                    </form>
                </div>
            </div>
        </div>
       <%@include file="includes/footer.jsp" %>
        
    </body>
</html>
