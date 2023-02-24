<%-- 
    Document   : index
    Created on : 26 Nov, 2022, 10:06:08 PM
    Author     : nayan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Log.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Log.Product"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="Dao.ProductDao"%>
<%@page import="Log.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%User auth=(User)request.getSession().getAttribute("auth");
 int b=-1;
 System.out.println();
 if(auth!=null){
 request.setAttribute("auth",auth);
  b=auth.getTyp();
 }
 
 ProductDao pd=new ProductDao(DBConnection.getConnection());
 List<Product> products=pd.getAllProduct();
 
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
        <title>ShoplifyIndia!</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
       <%@include file="includes/main.jsp" %>
       <div class="container">
           <div class="card-header my-3">ALL Product</div>
           <div class="row">
          
               <%if(!products.isEmpty()){
               for(Product p:products){    
               %>
               <div class="col-md-3 my-3">
               <div class="card w-100" style="width: 18rem;">
  <img class="card-img-top" style="height:15rem; width: 16rem; object-fit: cover;" src="product-images/<%= p.getImage()%>" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%= p.getName()%></h5>
    <h6 class="price">Price: <%= p.getPrice()%></h6>
    <h6 class="category">Category: <%= p.getCategory()%></h6>
    <div class="mt-3 d-flex justify-content-between">
        <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add to Cart</a>
        <a href="Order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-primary">Buy Now</a>
      </div>
        <%if(auth!=null)
       {
           if(b==1){%>
            <div class="mt-3 d-flex justify-content-between">
           <a href="delete?id=<%=p.getId()%>" class="btn btn-primary">Delete</a>
            </div>
       <%}}%>
 
</div>
  </div>
           </div><%}}%>
       </div>
       </div>
    
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
