<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
	<style>
        body {
            font-family:  'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("bcg.png") no-repeat center  center/cover;
            height: 100vh;
            margin: 0	;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .register-container {
            padding: 40px;
            border-radius: 10px;
            width: 350px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
        }
        .register-container:hover {
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
        }
        .logo {
            text-align: center;
            margin-bottom: 32;
            margin-bottom: 30px;
        }
        
        h1 {
            text-align: center;
            color:  #2d3748;
            margin-bottom: 8px;
        }
        p {
            text-align: center;
            color: #718096;
           
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #4a5568;
        }
        input {
            width: 90%;
            padding: 14px 16px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
        }
        
        input:hover {
            border-color: #667eea;
        }
        .password-box {
        	position: relative;
        }
        .password-box span {      	   
        	position: absolute;
            right: 10px;
            top: 20%;
            background: none;
            border: none;
            color: #718096;
            cursor: pointer;
            font-size: 19px;
            padding: 4px;
        }
       
        .submit-btn {
            width: 100%;
            padding: 12px;
            background: #5669c1;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #5568d3;
        }
        .link {
            text-align: center;
            margin-top: 15px;
            
        }
        .link a {
            text-decoration: none;
            color: #667eea;
        }
        .link a:hover {
            color: #5568d3;
            text-decoration: underline;
        }
        .error {
            color: red;
            font-size: 12px;
            display: none;
        }
    </style>
</head>
<body>
	<div class="register-container">
		<div class="logo">
	    	<img src="icon-Photoroom.png" class="top-png" width="110px">
	    	<h1>Create Account</h1>
    		<p>Register to get started</p>
		</div>

    	<form onsubmit="return validateForm()">

        	<div class="form-group">
            	<label>Full Name</label>
            	<input type="text" id="name" placeholder="Enter your name" required>
        	</div>

        	<div class="form-group">
            	<label>Email</label>
            	<input type="email" id="email" placeholder="Enter your email" required>
        	</div>

        	<div class="form-group">
            	<label>Password</label>
            	<div class="password-box">
	            	<input type="password" id="password" placeholder="Enter password" required>
	            	<span onclick="togglePassword('password',this)">👁️</span>
            	</div>
        	</div>

	        <div class="form-group">
	            <label>Confirm Password</label>
	            <div class="password-box">
	            	<input type="password" id="confirmPassword" placeholder="Confirm password" required>
	            	<span onclick="togglePassword('confirmPassword',this)">👁️</span>
	            	<div class="error" id="passError">Passwords do not match</div>
	            </div>
	        </div>

        	<button class="submit-btn">Register</button>

    	</form>

	    <div class="link">
	        Already have an account? <a href="login.jsp">Login</a>
	    </div>

	</div>

	<script>
		function togglePassword(fieldId, icon) {
			const input = document.getElementById(fieldId);
			
			if(input.type == "password") {
				input.type = "text";
				icon.innerText = "🙈";
			}
			else {
				input.type = "password";
				icon.innerText = "👁️";
			}
		}
		
		function validateForm() {
			var password = document.getElementById("password").value;
		    var confirmPassword = document.getElementById("confirmPassword").value;
		    
		    var passError = document.getElementById("passError");
			
		    var valid = true;

		    if (password !== confirmPassword) {
		        passError.style.display = "block";
		        valid = false;
		    } else {
		        passError.style.display = "none";
		    }
		    
		    return valid;
		}
	</script>
</body>
</html>