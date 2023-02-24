<%-- 
    Document   : main
    Created on : 26 Nov, 2022, 10:25:04 PM
    Author     : nayan
--%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
    <a class="navbar-brand" href="index.jsp">ShoplifyIndia</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
      
<!--      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>-->

<%if(auth!=null)
{
    int a=auth.getTyp();
    if(a==1)
    {%>
     <li class="nav-item">
        <a class="nav-link disabled" href="AddProduct.jsp">Product</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="Record.jsp">Record</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="AdminRegis.jsp">Registration</a>
      </li>   
  <%  }else if(a==0)
    {
%>
<li class="nav-item">
          <a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a>
      </li>
<li class="nav-item">
        <a class="nav-link disabled" href="orders.jsp">Orders</a>
      </li>
      <%}%>
       <li class="nav-item">
        <a class="nav-link" href="log-out">Logout</a>
      </li><%}else{%>
      
     <li class="nav-item">
          <a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">Login</a>
      </li>
      <%}%>
    </ul>
<!--    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>-->
  </div>
    </div>
</nav>
