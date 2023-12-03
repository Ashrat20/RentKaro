var modal = document.getElementById("myModal");
var btn = document.getElementById("signupButton");
var ownerBtn = document.getElementById("ownerBtn");
var tenantBtn = document.getElementById("tenantBtn");

btn.onclick = function() {
  modal.style.display = "block";
}

ownerBtn.onclick = function() {
  window.location.href = "register";
}

tenantBtn.onclick = function() {
  window.location.href = "register-tenant";
}
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
