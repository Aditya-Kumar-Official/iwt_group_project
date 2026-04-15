<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        body {
        	min-height: 100vh; 
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("bcg.png") no-repeat center  center/cover;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: #ffffff80;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .logo {
            font-weight: bold;
            font-size: 20px;
        }
        .nav-link a{
            margin: 0 10px;
            text-decoration: none;
        }
        .nav-link button {
            background-color: #3b82f6;
            border: none;
            padding: 8px 15px;
            color: white;
            border-radius: 20px;
            cursor: pointer;
        }
        .nav-link button:hover {
        	background: #156cf8;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .welcome {
            text-align: center;
            margin: 40px 0;
            color: #1e3a5f;
        }
        .card-container {
            display: flex;
            justify-content: center;
            gap: 30px;
        }
        .card {
            background-color: white;
            padding:30px;
            width: 300px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .card img {
            width: 70px;
            margin-bottom: 10px;
        }
        .card button {
            margin-top: 15px;
            padding: 10px;
            width: 100%;
            border: none;
            background-color: #3b82f6;
            color: white;
            border-radius: 8px;
            cursor: pointer;
        }
        .card button:hover {
            background-color: #2563eb;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .doc-left {
        	position: absolute;
        	left: 50px;
        	bottom: 60px;
        	width: 240px;
        }
        .doc-right {
        	position: absolute;
        	right: 50px;
        	bottom: 60px;
        	width: 250px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Medical Name</div>
        <div class="nav-link">
            <a href="#" onclick="homePage()">Home</a>
            <a href="#">About</a>
            <a href="#">Doctors</a>

            <button onclick="logout()">Logout</button>
        </div>
    </div>

    <h1 class="welcome">Welcome to MediCare</h1>

    <div class="card-container">
        <div class="card">
            <img src="doctor.png">
            <h2>View Doctors</h2>
			<p>Browse the list of available doctors, check their specialization and fees, and book an appointment by selecting your preferred date and time.</p>
            <button onclick="goDoctor()">View Doctors</button>
        </div>

        <div class="card">
            <img src="appointment.png" height="70px">
            <h2>View Appointments</h2>
			<p>View all your booked appointments with details like doctor's name, date <br>and cancel any appointment <br>if needed.</p>
            <button onclick="goAppointment()">View Appointments</button>
        </div>
        <img src="doc-left.png" class="doc-left">
        <img src="doc-right.png" class="doc-right">
    </div>

    <script>
        function goDoctor() {
            window.location.href = "doctors.jsp"
        }
        function goAppointment() {
            window.location.href = "appointment.jsp"
        }
        function logout() {
            window.alert("Logged out succesfully")
            window.location.href = "login.jsp"
        }
        function homePage() {
			window.location.href = "index.jsp"
        }
    </script>
</body>
</html>