<%@page import="Log.User"%>
<%User auth=(User)request.getSession().getAttribute("auth");
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
                    <form action="OTP" method="post">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" class="form-control" name="login-email" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="login-password" placeholder="********" required>
                        </div>
                        <!--<div class="text-centre">-->
                            <button type="submit" class="btn btn-primary">Register</button>
                           
                        
                        <!--</div>-->
                        
                    </form>
                    <!--<button class="btn btn-primary"><a href="login.jsp">Login</a></button>-->
                    <br>
                    <a href="login.jsp">Login</a>
                </div>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
