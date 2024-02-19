package com.ecom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ecom.entities.User;
import com.ecom.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String userName = req.getParameter("user_name");
			String userEmail = req.getParameter("user_email");
			String userPassword = req.getParameter("user_password");
			String userPhone = req.getParameter("user_phone");
			String userAdress = req.getParameter("user_address");
			String userType = req.getParameter("user_type");
			PrintWriter out = resp.getWriter();
//			Server side validation
			if(userName.isEmpty()) {
				out.println("Name is empty....");
				return;
			}
//			creating user object to store data
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAdress, "normal");
			Session hibernateSession =  FactoryProvider.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			int userId =(int) hibernateSession.save(user);

//			out.println("Successfully saved....!!!");
//			out.println("<br>User id is : "+userId);
			tx.commit();
			hibernateSession.close();

			  HttpSession httpSession = req.getSession();
			  httpSession.setAttribute("message", "Registration Successfull...!!! User Is is : "+userId);
			  resp.sendRedirect("register.jsp");
			  return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
