<%@ page import="java.sql.*" %>
<%@ page import="com.exam.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Profile</title>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
</head>

<body class="profile-page">

<%
Integer id = (Integer)session.getAttribute("userid");

if(id == null){
    response.sendRedirect("login.jsp");
}

Connection con = DBConnection.getConnection();

String msg = "";

/* ===== HANDLE UPDATE FIRST ===== */
if("POST".equalsIgnoreCase(request.getMethod())){

    String newName = request.getParameter("name");
    String newPass = request.getParameter("password");

    PreparedStatement ps2;

    if(newPass != null && !newPass.trim().equals("")){
        ps2 = con.prepareStatement(
        "UPDATE users SET name=?, password=? WHERE id=?"
        );
        ps2.setString(1, newName);
        ps2.setString(2, newPass);
        ps2.setInt(3, id);
    } else {
        ps2 = con.prepareStatement(
        "UPDATE users SET name=? WHERE id=?"
        );
        ps2.setString(1, newName);
        ps2.setInt(2, id);
    }

    int updated = ps2.executeUpdate();

    if(updated > 0){
        msg = "Profile Updated Successfully!";
    } else {
        msg = "Update Failed!";
    }
}

/* ===== FETCH UPDATED DATA ===== */
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM users WHERE id=?"
);

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

String name = "";
String sic = "";

if(rs.next()){
    name = rs.getString("name");
    sic = rs.getString("SIC");

    // update session also
    session.setAttribute("name", name);
}
%>

<div class="profile-card">

    <h2>My Profile</h2>

    <% if(!msg.equals("")) { %>
        <div class="success-msg"><%= msg %></div>
    <% } %>

    <form method="post">

        <label>Name</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label>SIC</label>
        <input type="text" value="<%= sic %>" disabled>

        <label>New Password</label>
        <input type="password" name="password" placeholder="Leave blank to keep same">

        <button class="profile-btn">Update Profile</button>

    </form>

    <br>

    <a href="dashboard.jsp">
        <button class="profile-btn">Back to Dashboard</button>
    </a>

</div>

</body>
</html>