<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="nav1">
		<%@ include file="nav.jsp" %>
	</div>	
	<section class="book">
		<div class="book-text">
			<h1>Book Appointments Easily</h1>
			<p>
				Easily schedule appointments with trusted healthcare professionals using our convenient online booking system.
			</p>
			<button class="btn">Book Now</button> 
		</div>		

	</section>	
	
	<section class="features">
		<div class="card1">
			<img src="images/clock1.svg" alt="search-doc">
			<h3>Find Doctors</h3>
			<p>Search and find doctors easily.</p>
		</div>
		
		<div class="card2">
			<img src="images/calender2.svg" alt="calender">
			<h3>Manage Appointments</h3>
			<p>Book and manage appointments.</p>
		</div>
		
		<div class="card3">
			<img src="images/notification.svg" alt="reminder">
			<h3>Reminders & Notifications</h3>
			<p>Get alerts and reminders.</p>
		</div>
	</section>
	
	<section class="about">
		<div class="about-text">
			<h2>About Us</h2>
			<p>
				Welcome to our appointment booking system.
				We help you connect with healthcare 
				professionals easily and efficiently.
			</p>
		</div>

	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>