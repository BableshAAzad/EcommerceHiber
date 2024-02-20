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
	<div class="container-fluid">
	<%@include file="components/navbar.jsp"%>
	<h1 class="text-primary text-center">Welcome to Ecommerce Website</h1>
	<%
	String c = request.getParameter("category");
	
	ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
	List<Product> list = null;
	if(c == null || c.trim().equals("all")){
	   list = pdao.getAllProducts();
	}else{
		int cid = Integer.parseInt(c.trim());
		list = pdao.getAllProductsById(cid);
	}

	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> catList = cdao.getCategories();
	%>
	<h2 class="text-danger text-center">Number of Product is :<%=list.size()%></h2>
	<section class="row mx-2">
		<!-- Show Categories ---------------------------------------------------->
		<div class="col-md-2">
			<div class="list-group">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action text-light text-center custom-bg">All
					Products</a>
				<%
				for (Category cat : catList) {
				%>
				<a href="index.jsp?category=<%=cat.getCategoryId() %>" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>
		</div>
		<!-- Show products----------------------------------------------------- -->
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-12">
					<div class="card-columns">
						<%
						for (Product product : list) {
						%>

						<div class="card adminCardShadow">
							<div class="container text-center">
								<img class="card-img-top m-2 img-center"
									src="img/products/<%=product.getpPhoto()%>" alt="No Pic">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=product.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(product.getpDesc())%></p>
							</div>
							<div class="card-footer text-center" style="padding: 0.75rem 0.4rem">
							    <a href="#" class="btn btn-outline-success m-1">&#8377;<%=product.getPriceAfterAlpplyingDiscount()%>/- <span class="text-secondary discount-lable">
							     <span class="discount-price">&#8377;<%=product.getpPrice() %></span>/- 
							     <%=product.getpDiscount() %>% off
							    </span></a>
							    <a href="#" class="btn btn-warning m-1" 
							    onclick="add_to_cart(<%=product.getpId() %>,'<%=product.getpName() %>',<%=product.getPriceAfterAlpplyingDiscount() %>)">
							    Add To Card</a>
							</div>
						</div>

						<%
						}
						if(list.size()==0){
							%>
							<h4 class="text-center text-warning">No Item in this category...!!!</h4>
					    <%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>