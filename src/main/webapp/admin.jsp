<%@page import="com.ecom.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "your are not logged-in !!! login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "your are not admin !!! do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
    <%@include file="components/navbar.jsp"%>
	<section class="container mb-3 adminCard">
	
	<div class="container-fluid mt-3">
	  <%@include file="components/message.jsp" %>
	</div>
	
	<h1 class="text-center text-warning">Welcome to Admin</h1>
	  <section class="row mt-3">
	     <div class="col-md-4">
	       <div class="card">
	         <div class="card-body text-center">
	         <div class="container">
	           <img alt="Users" src="img/users.png" class="img-fluid rounded-circle" />
	         </div>
	         <h2>4753</h2>
	          <h2 class="text-uppercase text-muted">Users</h2>
	         </div>
	       </div>
	     </div>
	     <div class="col-md-4">
	        <div class="card">
	         <div class="card-body text-center">
	            <div class="container">
	               <img alt="Catagories" src="img/menu.png" class="img-fluid" />
	             </div>
	           <h2>853</h2>    
	           <h2 class="text-uppercase text-muted">Catagories</h2>
	         </div>
	       </div>
	     </div>
	     <div class="col-md-4">
	        <div class="card">
	         <div class="card-body text-center">
	             <div class="container">
	                 <img alt="Products" src="img/hand.png" class="img-fluid" />
	               </div>
	           <h2>538443</h2>
	           <h2 class="text-uppercase text-muted">Products</h2>
	         </div>
	       </div>
	     </div>
	   </section>
	   <section class="row mt-3">
	     <div class="col-md-6">
	       <div class="card" data-toggle="modal" data-target="#add-category-model">
	         <div class="card-body text-center">
	              <div class="container">
	                  <img alt="Add Catagory" src="img/calculator.png" class="img-fluid"/>
	               </div>
	          <p class="mt-2">Click here to add new category</p>
	          <h2 class="text-uppercase text-muted">Add Category</h2>
	         </div>
	       </div>
	     </div>
	     <div class="col-md-6">
	        <div class="card" data-toggle="modal" data-target="#add-product-model">
	         <div class="card-body text-center">
	            <div class="container">
	               <img alt="Add Products" src="img/addProduct.png" class="img-fluid" />
	             </div>
	           <p class="mt-2">Click here to add new new product</p>    
	           <h2 class="text-uppercase text-muted">Add Product</h2>
	         </div>
	       </div>
	     </div> 
	  </section>
	</section>
	

<!-- Modal for add category -->
<div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="categoryModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header text-light custom-bg" >
        <h5 class="modal-title" id="exampleModalLongTitle">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="ProductOperationServlet" method="post">
        <input type="hidden" name="operation" value="addCategory" />
        <div class="form-group">
          <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
        </div>
        <div class="form-group">
          <textarea class="form-control" rows="4" name="catDescription" placeholder="Enter category description" required></textarea>
        </div>
        <div class="container text-center">
          <button class="btn btn-outline-success">Add Category</button>
          <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- Modal for add product -->
<div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="productModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header text-light custom-bg" >
        <h5 class="modal-title" id="exampleModalLongTitle">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="ProductOperationServlet" method="post">
        <input type="hidden" name="operation" value="addProduct" />
        <div class="form-group">
          <input type="text" class="form-control" name="pName" placeholder="Enter Product title" required />
        </div>
        <div class="form-group">
          <textarea class="form-control" rows="2" name="catDesc" placeholder="Enter Product description" required></textarea>
        </div>
        <div class="form-group">
          <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required />
        </div>
        <div class="form-group">
          <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required/>
        </div>
        <div class="form-group">
          <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />
        </div>
        <!------------------------------ Product Category---------------------------------- -->
        <div class="form-group">
          <select name="catId" class="form-group">
            <option value="Laptop">Laptop</option>
            <option value="Mobile">Mobile</option>
            <option value="EarPhone">EarPhone</option>
          </select>
        </div>
        <div class="form-group">
          <label for="pPicture">Select Picture of product</label>
          <br>
          <input type="file" name="pPic" id="pPicture" required />
        </div>
        <div class="container text-center">
          <button class="btn btn-outline-success">Add Product</button>
          <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
	
	
</body>
</html>