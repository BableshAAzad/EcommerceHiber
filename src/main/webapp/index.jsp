<%@page import="com.ecom.helper.Helper"%>
<%@page import="com.ecom.entities.Category"%>
<%@page import="com.ecom.dao.CategoryDao"%>
<%@page import="com.ecom.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.dao.ProductDao"%>
<%@page import="com.ecom.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommerce - Home</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<h1 class="text-primary text-center">Welcome to Ecommerce Website</h1>
	<%
	ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
	List<Product> list = pdao.getAllProducts();

	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> catList = cdao.getCategories();
	%>
	<section class="row">
		<!-- Show Categories ---------------------------------------------------->
		<div class="col-md-2 ml-3">
			<div class="list-group">
				<a href="#"
					class="list-group-item list-group-item-action text-light text-center custom-bg">All
					Products</a>
				<%
				for (Category cat : catList) {
				%>
				<a href="#" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>
		</div>
		<!-- Show products----------------------------------------------------- -->
		<div class="col-md-8">
			<h2 class="text-danger">
				Number of Product is :<%=list.size()%></h2>
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
						<%
						for (Product product : list) {
						%>

						<div class="card adminCardShadow m-3">
							<div class="container text-center">
								<img class="card-img-top m-2 img-center"
									src="img/products/<%=product.getpPhoto()%>" alt="No Pic">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=product.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(product.getpDesc())%></p>
							</div>
							<div class="card-footer">
								<a href="#" class="btn btn-warning">Add To Card</a> <a href="#"
									class="btn btn-outline-danger">&#8377;<%=product.getpPrice()%></a>
							</div>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>



		</div>
	</section>

</body>
</html>