<%@ page language="java" contentType="text/html"%>
<%@ page import="com.spring.mvc.model.Owner"%>
<%@ page import="com.spring.mvc.model.Tenant"%>
<%@ page import="com.spring.mvc.model.Property"%>
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
	<div id="imagetab">
		<img src="/Image/imagetab.webp" alt="">
		<h2>Find Your Dream Rental Home Today</h2>
		<p>
			Browse through our featured rental listings and discover your perfect
			home.<br> With detailed descriptions, high-quality images, and
			competitive prices, <br> finding your dream rental has never
			been easier.
		</p>
	</div>
	<div class="container">
		<form action="propertyview" class="d-flex justify-content-center"
			id="search" method="get">
			<select name="prop_type" id="type">
				<option value="1 BHK">1 BHK</option>
				<option value="1 RK">1 RK</option>
				<option value="2 BHK">2 BHK</option>
				<option value="3 BHK">3 BHK</option>
			</select> <input class="form-control me-2" type="search"
				placeholder="Search For location" aria-label="Search"
				name="prop_location" id="locationInput">
			<button class="btn btn-success" type="submit">Search</button>
		</form>

		<h1 class="mt-5">Property Listing</h1>
		<hr>
		<div class="row mt-2 propview">
			<div class="col-md-4">
				<div class="slider-container">
					<div class="slider">
						<img src="/Image/2bhk-1.avif" alt="" id="prop2img" class="slider-image prop2img"> 
							<img src="/Image/2bhk-2.avif" alt=""  class="slider-image prop2img"> 
							<img src="/Image/2bhk-3.avif" alt=""  class="slider-image prop2img"> 
							<img src="/Image/2bhk-4.avif" alt=""  class="slider-image prop2img">
					</div>
					<button class="prevBtn">&lt;</button>
					<button class="nextBtn">&gt;</button>
				</div>
			</div>
			<div class="col-md-8">
				<a href="/propertyview" class="newlink">
					<div class="row">
						<div class="col-md-6">
							<h3 id="prophead">2 BHK Flat for Rent</h3>
						</div>
						<div class="col-md-6">
							<p class="text-end" id="statuspara">Available</p>
						</div>
					</div>
					<p class="text-secondary">MM Spectra, Sai Baba Nagar, Chembur,
						Mumbai</p>
					<div class="row mt-3">
						<div class="col-md-6">
							<h5>Type</h5>
							<p class="text-secondary">2 BHK</p>
						</div>
						<div class="col-md-6">
							<h5>Location</h5>
							<p class="text-secondary">Mumbai</p>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-6">
							<h5>
								Price<br>
							</h5>
							<span>&#8377;58000.0/per month</span>
						</div>
						<div class="col-6">
							<label for="">Owner Name</label>
							<p class="text-secondary">Ashrat</p>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="row mt-2 propview">
			<div class="col-md-4">
				<div class="slider-container">
					<div class="slider">
						<img src="/Image/1rk-1.avif" alt="" class="slider-image prop2img"> 
							<img src="/Image/1rk-2.avif" alt="" class="slider-image prop2img"> 
							<img src="/Image/1rk-3.avif" alt="" class="slider-image prop2img">
					</div>
					<button class="prevBtn">&lt;</button>
					<button class="nextBtn">&gt;</button>
				</div>
			</div>
			<div class="col-md-8">
				<a href="/propertyview" class="newlink">
				<div class="row">
						<div class="col-md-6">
							<h3 id="prophead">1 RK Flat for Rent</h3>
						</div>
						<div class="col-md-6">
							<p class="text-end" id="statuspara">Available</p>
						</div>
					</div>
					<p class="text-secondary">Uttrayan society , Aghadi Nagar,
						Andheri East, Mumbai</p>
					<div class="row mt-3">
						<div class="col-md-6">
							<h5>Type</h5>
							<p class="text-secondary">1 RK</p>
						</div>
						<div class="col-md-6">
							<h5>Location</h5>
							<p class="text-secondary">Mumbai</p>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-6">
							<h5>
								Price<br>
							</h5>
							<span>&#8377;24000.0/per month</span>
						</div>
						<div class="col-6">
							<label for="">Owner Name</label>
							<p class="text-secondary">Prerna</p>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="row mt-2 propview">
			<div class="col-md-4">
				<div class="slider-container">
					<div class="slider">
						<img src="/Image/1bhkbang-1.avif" alt=""  class="slider-image prop2img"> 
							<img src="/Image/1bhkbang-2.avif" alt="" class="slider-image prop2img"> 
							<img src="/Image/1bhkbang-3.avif" alt="" class="slider-image prop2img">
					</div>
					<button class="prevBtn">&lt;</button>
					<button class="nextBtn">&gt;</button>
				</div>
			</div>
			<div class="col-md-8">
				<a href="/propertyview" class="newlink">
				    <div class="row">
						<div class="col-md-6">
							<h3 id="prophead">1 BHK Flat for Rent</h3>
						</div>
						<div class="col-md-6">
							<p class="text-end" id="statuspara">Available</p>
						</div>
					</div>
					<p class="text-secondary">Mahaveer Meridian, 8th Phase, JP
						Nagar, Bangalore</p>
					<div class="row mt-3">
						<div class="col-md-6">
							<h5>Type</h5>
							<p class="text-secondary">1 BHK</p>
						</div>
						<div class="col-md-6">
							<h5>Location</h5>
							<p class="text-secondary">Bangalore</p>
						</div>
					</div>

					<div class="row mt-4">
						<div class="col-6">
							<h5>
								Price<br>
							</h5>
							<span>&#8377;16000.0/per month</span>
						</div>
						<div class="col-6">
							<label for="">Owner Name</label>
							<p class="text-secondary">Aman</p>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="specialbth">
			<button class="btn btn-warning mt-5 text-center" id="pagedirect">View
				More</button>
		</div>
		<div id="sectionhead" class="text-center">
			<h1>Find Your Dream Home with No Brokerage Charges</h1>
			<p>
				Our platform offers curated listings and easy search functionality,
				all without any brokerage <br> charges. Find your perfect home
				hassle-free.
			</p>
		</div>
		<div class="section1">
			<div class="row text-center">
				<div class="col-md-4" id="col1">
					<img src="/Image/sectionpic3.png" alt="">
					<h2>No Brokerage Charges</h2>
					<p>Browse through our extensive collection of rental listings
						without worrying about any brokerage charges.</p>
				</div>
				<div class="col-md-4" id="col2">
					<img src="/Image/sectionpic1.webp" alt="">
					<h2>Curated Listings</h2>
					<p>Discover handpicked rental options that meet your specific
						requirements.</p>
				</div>
				<div class="col-md-4" id="col3">
					<img src="Image/sectionpic2.jpg" alt="">
					<h2>Easy Search Functionality</h2>
					<p>Effortlessly find your ideal rental property with our
						user-friendly search features.</p>
				</div>
			</div>
		</div>
	</div>
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

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="/script/slider.js"></script>
	<script src="/script/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>