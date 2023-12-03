<%@ page language="java" contentType="text/html"%>
<%@ page import="com.spring.mvc.model.Owner"%>
<%@ page import="com.spring.mvc.model.Tenant"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RentKaro</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/Css/addproperty.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand mx-5 text-white" href="#" id="mainhead">RentKaro</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="/home">Home</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="/aboutus">About
							Us</a></li>
					<li class="nav-item dropdown">
				</ul>
				<div class="d-flex mx-2">
					<%
					// Check if the user is not logged in
					if (session.getAttribute("name") == null) {
					%>
					<form action="/addproperty" method="get">
						<input type="submit" class="btn btn-warning mx-5 mt-1"
							value="List property" id="lst" />
					</form>
					<button type="button" class="btn btn-success mx-2" id="loginBtn">Log
						in</button>
					<button class="btn btn-success" type="submit mx-2"
						id="signupButton">Sign Up</button>
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
					} else {
					// If the user is logged in, check if the user is an owner
					Object roleAttribute = session.getAttribute("role");
					if (roleAttribute != null) {
						String role = roleAttribute.toString();

						// Check if the user is an owner
						if ("owner".equals(role)) {
					%>
					<!-- Display the list button for owners -->
					<form action="/addproperty" method="get">
						<input type="submit" class="btn btn-warning mx-5 mt-1"
							value="List property" id="lst" />
					</form>
					<%
					}
					}					
					%>
					<p id="name" class="mt-2">${name}</p>
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-user-circle" id="proficon"
								style="font-size: 30px; color: white;"></i>
						</button>
						<div class="dropdown-menu ml-5"
							aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="/profile"><i
								class="fas fa-user"></i> Profile</a> <a class="dropdown-item"
								href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</nav>
	<div class="container propviewhead">
		<h1 class="text-left my-4">Add Your Property</h1>
	</div>
	<div class="container" id="newcan">
		<div id="propform">
			<form action="/addproperty" class="w-100"
				enctype="multipart/form-data" method="post">
				<div class="rectangle-shape">
					<div class="shape2">
					<label>Choose file:</label>
						<input type="file" name="imageData" accept="image/jpeg, image/png, image/jpg" multiple required>
					</div>
				</div>
				<div class="mb-3">
					<label for="property_title" class="form-label">Title</label> 
					<input type="text" class="form-control" id="property_title" name="prop_title" required>
				</div>
				<div class="mb-3">
					<label for="property_description" class="form-label">Description</label>
					<textarea class="form-control" id="property_description" rows="3" name="prop_description" required></textarea>
				</div>
				<div class="mb-3">
					<label for="property_address" class="form-label">Address</label>
					<textarea class="form-control" id="property_address" rows="3" name="prop_address" required></textarea>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="mb-3">
							<label for="property_location" class="form-label">Location</label>
							<input type="text" class="form-control" id="property_location" name="prop_location" required>
						</div>
					</div>
					<div class="col-md-6">
						<div class="mb-3">
							<label for="property_area" class="form-label">Area(sqft)</label>
							<input type="number" class="form-control" id="property_area" name="prop_area" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="mb-3">
							<label for="property_type" class="form-label">Type</label><br>
							<select name="prop_type" id="type" required>
								<option value=""></option>
								<option value="1 BHK">1 BHK</option>
								<option value="1 RK">1 RK</option>
								<option value="2 BHK">2 BHK</option>
								<option value="3 BHK">3 BHK</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="mb-3">
							<label for="property_price" class="form-label">Price</label> 
							<input type="number" class="form-control" id="property_price" name="prop_price" required>
						</div>
					</div>
				</div>
				<div class="mb-3">
							<label for="status" class="form-label">Status</label><br>
							<select name="status" id="status" required>
								<option value=""></option>
								<option value="Available">Available</option>
								<option value="Not available">Not available</option>
							</select>
					</div>
				<button type="submit" class="btn btn-primary" id="loginbtn">Add
					Property</button>
			</form>
		</div>
		<div class="rightside">
			<img src="/Image/addpropimg.jpg" alt="" id="rightimg">
		</div>
	</div>

	<footer class="footer">
		<div class="row" id="foot1">
			<div class="col-md-4" id="fcol1">
				<h2 class="float-left">RentKaro</h2>
				<p>Your one stop solution for all things renting!</p>
				<div class="iconlist">
					<a href=""><i class="fab fa-instagram fa-2x instagram-icon" style="color: #bc2a8d"></i></a> 
					<a href="https://www.facebook.com/"><i class="fab fa-facebook fa-2x facebook-icon" style="color: #3b5998"></i></a> 
					<a href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-2x linkedin-icon" style="color: #0077b5"></i></a> 
					<a href="https://twitr.com/"><i class="fab fa-twitter fa-2x twitter-icon" style="color: #1da1f2"></i></a>
				</div>
			</div>
			<div class="col-md-4" id="fcol2">
				<h5>Navigation</h5>
				<ul>
					<li><a href="/home">Home</a></li>
					<li><a href="/about">About Us</a></li>
				</ul>
			</div>

			<div class="col-md-4" id="fcol3">
				<h3>Contact Us</h3>
				<p>
					<i class="fa fa-envelope"></i> rentkaro@gmail.com
				</p>
				<p>
					<i class="fa fa-phone"></i> +91 9089056778
				</p>
			</div>
		</div>
		<div class="footer-bottom" id="fbottom">
			<p>Copyright &copy; RentKaro | All rights reserved</p>
		</div>
	</footer>
	<script src="/script/script.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>