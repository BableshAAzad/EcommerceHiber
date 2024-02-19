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
	<%@include file="components/navbar.jsp" %>
	<h1 class="text-primary">Create Session Factory Object</h1>
	<%
	out.println(FactoryProvider.getFactory());
	%>
	  <%
	  ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
	  List<Product> list = pdao.getAllProducts();
	  
	  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	  List<Category> catList = cdao.getCategories();
	  %>
	<section class="row">
	  <!-- Show Categories ---------------------------------------------------->
	  <div class="col-md-3">
	     <h4>Total Categories : <%=catList.size() %></h4>
	     <%
	     for(Category cat : catList){
	    	 out.println(cat.getCategoryTitle()+"<br>");
	     }
	     %>
	  </div>
	  <!-- Show products----------------------------------------------------- -->
	  <div class="col-md-7">
	  <h2>Number of Product is : <%= list.size() %></h2>
	  <%
	  for(Product product : list){
	  out.println(product.getpName()+"<br>");
	  %>
	  
	  <%} %>
	  </div>
	</section>

</body>
</html>