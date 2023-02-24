<%-- 
    Document   : Record
    Created on : 7 Dec, 2022, 4:12:01 PM
    Author     : nayan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Log.User"%>
<%User auth=(User)request.getSession().getAttribute("auth");
if(auth!=null)
{
    int a=auth.getTyp();
    if(a!=1)
    {
        response.sendRedirect("login.jsp");
    }
}
else{
    response.sendRedirect("login.jsp");
}
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
</head>
<body>

</body>

<form method="post">
<%@include file="includes/main.jsp" %>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Date</th>
      <th scope="col">Product</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Email</th>
    </tr>
  </thead>

<%
try
{

Class.forName("org.postgresql.Driver");
String url="jdbc:postgresql://localhost:5432/Electronic";
String username="postgres";
String password="Nayan@2331";
String query="select oid,odate,pname,category,price,email from orders inner join product on product.pid = orders.pid inner join users on users.id = orders.uid";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
   <tbody>
    <tr>
      <th scope="row"><%=rs.getInt("oid") %></th>
      <td><%=rs.getString("odate") %></td>
    <td><%=rs.getString("pname") %></td>
    <td><%=rs.getString("category") %></td>
    <td><%=rs.getDouble("price") %></td>
    <td><%=rs.getString("email") %></td>
    </tr>
    
  </tbody>
        <%

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>


</form>
<%@include file="includes/footer.jsp" %>
</html> 