<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "your are not logged-in !!! login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<h1 class="text-center text-warning">Check out Page</h1>
	<section class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- Cart -->
				<div class="card boderShadow">
					<div class="card-head">
						<h3 class="text-center text-success">Your Selected Items</h3>
					</div>
					<div class="card-body">
						<div class="cart-body mt-2">
							<!-- Cart details-->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- Form data -->
				<div class="card adminCardShadow">
					<div class="card-head">
						<h3 class="text-center text-info">Your Details For Order</h3>
					</div>
					<div class="card-body">
						<form>
							<div class="form-group">
								<label for="email">Email address</label>
								 <input type="email" value="<%=user.getUserEmail() %>"
									name="email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="name">Full Name</label>
								 <input type="text" value="<%=user.getUserName() %>"
									name="fname" class="form-control" id="name"
									aria-describedby="namelHelp" placeholder="Enter your Full Name">
							</div>
							<div class="form-group">
								<label for="phone">Contact Number</label>
								 <input type="number" value="<%=user.getUserPhone() %>"
									name="phone" class="form-control" id="phone"
									aria-describedby="phonelHelp" placeholder="Enter phone number">
							</div>
							<div class="form-group">
								<label for="address">Your Shipping Address</label>
								<textarea class="form-control" id="address" rows="3"
									placeholder="Enter you full address"><%=user.getUserAddress() %></textarea>
							</div>
                             <div class="card-footer text-center">
								<button type="submit" class="btn btn-outline-success">Continue Shopping</button>
								<button type="submit" class="btn btn-outline-info">Order Now</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="components/common_modal.jsp"%>
</body>
</html>