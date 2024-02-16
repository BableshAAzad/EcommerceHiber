<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration form</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<section class="container-fluid">
	<%@include file="components/message.jsp"%>
	<div class="row mt-3">
		<div class="col-md-6 offset-md-3">
			<div class="card boderShadow mb-3">
			<div class="card-header">
			     <section class="iconRegister text-primary"><i class="fa-solid fa-user-pen"></i></section>
		        <h2 class="text-primary text-center">Sign-up Form</h2>
			</div>
			<div class="card-body">
			<form action="RegisterServlet" method="post">
				<div class="form-group">
					<label for="name">User Name</label>
					<input type="text" name="user_name" class="form-control" id="name" aria-describedby="nameHelp" placeholder="Enter your full name"> 
				</div>
				<div class="form-group">
					<label for="email">User Email</label>
					<input type="email" name="user_email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter your mail id"> 
				</div>
				<div class="form-group">
					<label for="password">User Password</label>
					<input type="password" name="user_password"  class="form-control" id="password" aria-describedby="passwordHelp" placeholder="Enter password"> 
				</div>
				<div class="form-group">
					<label for="phone">User Phone Number</label>
					<input type="number" name="user_phone"  class="form-control" id="phone" aria-describedby="numberHelp" placeholder="Enter Phone number"> 
				</div>
				<div class="form-group">
					<label for="address">User Address</label>
					<textarea rows="3" cols="5" name="user_address"  class="form-control" id="address"></textarea> 
				</div>
				<div class="container text-center mb-3">
					<a href="login.jsp">login here</a>
				</div>
				<div class="container text-center">
				   <button type="submit" class="btn btn-outline-success mr-3">Register</button>
				   <button type="reset" class="btn btn-outline-warning">Reset</button>
				</div>
			</form>
			</div>
			</div>
		</div>
	</div>
	</section>
</body>
</html>