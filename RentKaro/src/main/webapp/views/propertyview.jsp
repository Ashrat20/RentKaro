<%@ page import="com.spring.mvc.model.Property" language="java"
	contentType="text/html"%>
<%@ page import="com.spring.mvc.model.ImageItem"%>
<%@ page import="java.util.List"%>

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
<link rel="stylesheet" href="/Css/home.css">
<link rel="stylesheet" href="/Css/propertyview.css">

</head>

<body>
	<nav class="navbar navbar-expand-lg ">
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
					<li class="nav-item"><a class="nav-link text-white"
						href="/aboutus">About Us</a></li>
					<li class="nav-item dropdown">
				</ul>
				<p id="welcomeMessage"></p>
				<div class="d-flex mx-2">
					<%
					// Check if the user is not logged in
					if (session.getAttribute("name") == null) {
						// Display the list button for users who are not logged in
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
					<!-- Display logout button -->
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

	<div class="container" id="viewproperty">
		<h1 class="mt-3">Property list</h1>
		<hr>
		<%
		List<Property> proplist = (List<Property>) request.getAttribute("property");
		if (proplist != null && !proplist.isEmpty()) {
			for (Property prop : proplist) {
		%>
		<div class="property <% if (!"available".equalsIgnoreCase(prop.getStatus())) { %>blur<% } %>" 
			data-type="<%=prop.getProp_type().toUpperCase()%>"
			data-location="<%=prop.getProp_location().toUpperCase()%>">

			<div class="row mt-4" id="propview">
				<div class="col-md-4">
					<div class="slider-container">
						<div class="slider">
							<%
							List<ImageItem> imglist = prop.getImageItems();
							if (imglist != null && !imglist.isEmpty()) {
								for (ImageItem imgl : imglist) {
							%>
							<img src="data:image/*;base64,<%=imgl.getBase64ImageData()%>"
								alt="" class="slider-image prop2img" />
							<%
							}
							}
							%>
						</div>
						<button class="prevBtn">&lt;</button>
						<button class="nextBtn">&gt;</button>
					</div>
				</div>
				<div class="col-md-8">
					<%
					if ("available".equalsIgnoreCase(prop.getStatus())) {
					%>
					<a href="propertyDetails?propertyId=<%=prop.getProp_id()%>"
						id="linkprop"> 
						<%
                         } else {
                         %>
						<div>
						<%
						}
						%>

							<div class="row">
								<div class="col-md-6">
									<h3 id="prophead"><%=prop.getProp_title()%></h3>
								</div>
								<div class="col-md-6">
									<p class="text-end" id="statuspara"><%=prop.getStatus()%></p>
								</div>
							</div>

							<p class="text-secondary"><%=prop.getProp_address()%></p>
							<div class="row mt-3">
								<div class="col-md-6">
									<h5>Type</h5>
									<p class="text-secondary"><%=prop.getProp_type()%></p>
								</div>
								<div class="col-md-6">
									<h5>Location</h5>
									<p class="text-secondary"><%=prop.getProp_location()%></p>
								</div>
							</div>
							<div class="row mt-4">
								<div class="col-6">
									<h5>
										Price<br>
									</h5>
									<span class="text-secondary">&#8377;<%=prop.getProp_price()%>/month
									</span>
								</div>

								<div class="col-6">
									<%
									if (prop.getOwner() != null) {
									%>
									<div id="owndel">
										<label for="">Owner Name</label>
										<p class="text-secondary"><%=prop.getOwner().getName()%></p>
									</div>
									<%
									} else {
									%>
									<p>Owner details not available.</p>
									<%
									}
									%>
								</div>
							</div>

							<%
							if ("available".equalsIgnoreCase(prop.getStatus())) {
							%>
						</a>
					<%
					} else {
					%>
					
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%
	}
	} else {
	%>
	<div class="text-center noprop">
		<p style="font-size: 30px;">No property found</p>
	</div>
	<%
	}
	%>

	<footer class="footer">
		<div class="row" id="foot1">
			<div class="col-md-4" id="fcol1">
				<h2 class="float-left">RentKaro</h2>
				<p>Your one stop solution for all things renting!</p>
				<div class="iconlist">
					<a href=""><i class="fab fa-instagram fa-2x instagram-icon"
						style="color: #bc2a8d"></i></a> <a href="https://www.facebook.com/"><i
						class="fab fa-facebook fa-2x facebook-icon" style="color: #3b5998"></i></a>
					<a href="https://www.linkedin.com/"><i
						class="fab fa-linkedin fa-2x linkedin-icon" style="color: #0077b5"></i></a>
					<a href="https://twitr.com/"><i
						class="fab fa-twitter fa-2x twitter-icon" style="color: #1da1f2"></i></a>
				</div>
			</div>
			<div class="col-md-4" id="fcol2">
				<h5>Navigation</h5>
				<ul>
					<li><a href="/home">Home</a></li>
					<li><a href="/aboutus">About Us</a></li>
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
	<script src="/script/slider.js"></script>
	<script src="/script/script.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>