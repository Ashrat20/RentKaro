<%@ page language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentKaro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="/Css/register.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Sign up</h1>
    <form action="/register-tenant" method="post">
    
         <div class="mb-3 mr-3">
            <label for="exampleFormControlInput2" class="form-label">Enter Your Name</label>
            <input type="text" class="form-control" id="exampleFormControlInput2" name="name" placeholder="Name" required>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Email address</label>
            <input type="email" class="form-control" id="exampleFormControlInput1"  name="email" placeholder="Email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
        </div>

         <div class="mb-3">
            <label for="exampleFormControlInput3" class="form-label">Password</label>
            <input type="password" class="form-control" id="exampleFormControlInput3"  name="password" placeholder="password" maxlength="8" required>
        </div>

         <div class="mb-3">
            <label for="exampleFormControlInput4" class="form-label">Enter Your Phone no</label>
            <input type="text" class="form-control" id="exampleFormControlInput4"  name="contact" placeholder="Contact" maxlength="10" required>
        </div>

       <button type="submit" class="btn btn-primary" id="btn1">Sign up</button>
    </form>
    <hr>
    <div class="bottomsection mt-3">
        <p class="text-center">Already have an account?  <a href="/login"><span style="color:blue;">Login here</span></a>
    </div>
    </div>
</body>
</html>