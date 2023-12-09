var modal = document.getElementById("myModal");
var btn = document.getElementById("signupButton");
var ownerBtn = document.getElementById("ownerBtn");
var tenantBtn = document.getElementById("tenantBtn");
var loginbtn = document.getElementById("loginBtn");
var pagedir = document.getElementById("pagedirect");

if (btn !== null) {
    btn.onclick = function() {
  modal.style.display = "block";
}



ownerBtn.onclick = function() {
  window.location.href = "register";
}

tenantBtn.onclick = function() {
  window.location.href = "register-tenant";
}

loginbtn.onclick = function() {
  window.location.href = "login";
}
}
pagedir.onclick = function(){
	window.location.href = "propertyview";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

