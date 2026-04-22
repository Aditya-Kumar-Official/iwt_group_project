<%@ page import="java.sql.*" %>
<%@ page import="com.exam.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | ONLINEEXAM</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body class="login-page">

<div class="login-container" align="center">

    <div class="header">
        <h2>Welcome Back</h2>
        <p>Login to your account</p>
    </div>

    <!-- ERROR MESSAGE -->
    <%
    String error = "";
    if(request.getMethod().equals("POST")){

        String sic = request.getParameter("SIC");
        String pass = request.getParameter("password");

        try{
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE SIC=? AND password=?"
            );

            ps.setString(1, sic);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                session.setAttribute("userid", rs.getInt("id"));
                session.setAttribute("user", rs.getString("SIC"));
                session.setAttribute("name", rs.getString("name"));

                response.sendRedirect("dashboard.jsp");
            } else {
                error = "Invalid SIC or Password";
            }

        } catch(Exception e){
            error = "Server Error!";
        }
    }
    %>

    <% if(!error.equals("")) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <!-- FORM -->
    <form method="post">

        <div class="input-group">
            <label>SIC</label>
            <input type="text" name="SIC" placeholder="Enter your SIC" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required>
        </div>

        <button type="submit" class="login-btn">Login</button>

    </form>

    <div class="footer-text">
        Don't have an account? <a href="register.jsp">Register</a>
    </div>

</div>

</body>
</html>