<%@ page import="java.sql.*" %>
<%@ page import="com.exam.util.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
</head>

<body class="login-page">

<div class="login-container">

    <div class="header">
        <h2>Create Account</h2>
        <p>Register to start your exam</p>
    </div>

    <%
    String error = "";

    if("POST".equalsIgnoreCase(request.getMethod())){

        String name = request.getParameter("name");
        String sic = request.getParameter("SIC");
        String pass = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");

        if(pass != null && pass.equals(confirm)){

            try{
                Connection con = DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO users(name,SIC,password) VALUES(?,?,?)"
                );

                ps.setString(1, name);
                ps.setString(2, sic);
                ps.setString(3, pass);

                int i = ps.executeUpdate();

                if(i > 0){
                    // Redirect to login after success
                    response.sendRedirect("login.jsp?msg=registered");
                    return;
                }

            } catch(Exception e){
                error = "SIC already exists!";
            }

        } else {
            error = "Passwords do not match!";
        }
    }
    %>

    <!-- ERROR MESSAGE -->
    <% if(!error.equals("")) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <!-- FORM -->
    <form method="post">

        <div class="input-group">
            <label>Name</label>
            <input type="text" name="name" placeholder="Enter your name" required>
        </div>

        <div class="input-group">
            <label>SIC</label>
            <input type="text" name="SIC" placeholder="Enter your SIC" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="••••••••" required>
        </div>

        <div class="input-group">
            <label>Confirm Password</label>
            <input type="password" name="confirmPassword" placeholder="••••••••" required>
        </div>

        <button type="submit" class="login-btn">Register</button>

    </form>

    <div class="footer-text">
        Already have an account? <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>