<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login form</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<section class="container">
	<%@include file="components/message.jsp" %>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4 boderShadow">
					<div class="card-header">
						<section class="iconRegister text-primary">
							<i class="fa-solid fa-user-shield"></i></i>
						</section>
						<h2 class="text-primary text-center">Login Page</h2>
					</div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									name="user_email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									name="user_password" class="form-control" id="password"
									placeholder="Password">
							</div>
							<div class="container text-center mb-3">
								<a href="register.jsp">If not registered click here</a>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success mr-3">Login</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="components/common_modal.jsp" %>
</body>
</html>