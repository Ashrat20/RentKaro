<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Rentkaro</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/Css/login.css">
</head>

<body>
	<div class="container">
		<h1 class="text-center">Login</h1>
		<form action="/login" method="post">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">Email
					address</label> <input type="email" class="form-control"
					id="exampleFormControlInput1" name="email" placeholder="Email"
					pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
			</div>

			<div class="mb-3">
				<label for="exampleFormControlInput3" class="form-label">Password</label>
				<input type="password" class="form-control"
					id="exampleFormControlInput3" name="password"
					placeholder="password" maxlength="8" required>
			</div>
			<p>Please select your role:</p>
			<input type="radio" id="userTypeObj" name="userType" value="obj" required>
			<label for="userType">Owner</label> 
			<input type="radio" id="userTypeTobj" name="userType" value="tobj" class="text-center" required> 
			<label for="userType">Tenant</label><br>

			<button type="submit" class="btn btn-primary mt-3" id="loginbtn">Login</button>
		</form>
		<hr>
		<div class="loginbottom mt-3">
			<p class="text-center">
				Don't have an account? <button id="signupButton">Sign up</button>
		</div>
		<div id="myModal" class="modal">
			<div class="modal-content">
				<p>Choose who you are:</p>
				<div id="twobtn">
					<button class="modal-btn btn-primary" id="ownerBtn">Owner</button>
					<button class="modal-btn btn-success" id="tenantBtn">Tenant</button>
				</div>
			</div>
		</div>
		 <%
        String loginError = (String) request.getAttribute("loginError");
        if (loginError != null && !loginError.isEmpty()) {
        %>
           <script>
            alert("<%= loginError %>"); // Show the login error message in an alert
        </script>
        <%
        }
        %>
	</div>

	
	<script src="/script/login.js"></script>
</body>

</html>