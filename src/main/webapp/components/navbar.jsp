<%@page import="com.ecom.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  <a class="navbar-brand text-light" href="index.jsp">EcommerceHiber</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link " href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-light" href="About.jsp">About</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link text-light" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0 text-light" type="submit">Search</button>
    </form>
    <ul class="navbar-nav ml-auto">
  <%
    if(user1 == null){
   %>
    	 <li class="nav-item">
         <a class="nav-link text-light" href="login.jsp">Login</a>
       </li>
        <li class="nav-item">
         <a class="nav-link text-light" href="register.jsp">Register</a>
       </li>
     </ul>
   <% 
    }else{
   %>
    	 <li class="nav-item">
           <a class="nav-link text-light" href="admin.jsp"><%= user1.getUserName() %></a>
         </li>
         <li class="nav-item">
           <a class="nav-link text-light" href="LogoutServlet">Logout</a>
         </li>
     </ul>
   <% 
       }
   %>
    
  </div>
</nav>