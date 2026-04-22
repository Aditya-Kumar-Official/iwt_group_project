<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<meta charset="UTF-8">
</head>

<body class="dashboard-page">

<!-- NAVBAR -->
<div class="navbar">

    <div>
        <b>Online Exam Portal</b>
    </div>

    <div class="nav-right">

    <div style='display:flex;'>
    	Welcome, <%= session.getAttribute("name") %>
    </div>

    <a href="profile.jsp" class="nav-btn profile-btn">
        <i class="fas fa-user"></i> Profile
    </a>

    <a href="logout.jsp" class="nav-btn logout-btn">
        <div style='display:flex'>
        	<i class="fas fa-sign-out-alt">&nbsp;Logout</i>
        </div>
    </a>

</div>

</div>

<div class="dashboard-container">

    <!-- Welcome -->
    <div class="welcome">
        👋 Hello, <%= session.getAttribute("name") %>
    </div>

    <!-- Stats -->
    <div class="stats">

        <div class="stat-card">
            <h3>📚 Exams</h3>
            <p>2 Available</p>
        </div>

        <div class="stat-card">
            <h3>📝 Attempted</h3>
            <p>3 Exams</p>
        </div>

        <div class="stat-card">
            <h3>🏆 Best Score</h3>
            <p>4/5</p>
        </div>

    </div>

    <!-- Exams -->
    <h3>Available Exams</h3>

    <div class="exam-grid">

        <div class="exam-card java" onclick="startExam('java')">
            <h3>💻 Java</h3>
            <p>5 Questions • 5 Minutes</p>
            <span class="exam-btn">Start Exam</span>
        </div>

        <div class="exam-card dbms" onclick="startExam('dbms')">
            <h3>🗄️ DBMS</h3>
            <p>5 Questions • 5 Minutes</p>
            <span class="exam-btn">Start Exam</span>
        </div>

    </div>

</div>

<script>
function startExam(subject){
    window.location.href = "instructions.jsp?subject=" + subject;
}
</script>

</body>
</html>