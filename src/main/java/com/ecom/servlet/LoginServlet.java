package com.ecom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dao.UserDao;
import com.ecom.entities.User;
import com.ecom.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
//	   User	Validation

//	   User Authenticating
			UserDao useDao = new UserDao(FactoryProvider.getFactory());
			User user = useDao.getUseByEmailAndPassword(userEmail, userPassword);
//			System.out.println(user);
			HttpSession httpSession = request.getSession();
			if (user == null) {
//				out.println("<h1>Invalid details...</h1>");
				httpSession.setAttribute("message", "Invalid detail... try with correct details");
				response.sendRedirect("login.jsp");
				return;
			} else {
				out.println("<h1>Welcome " + user.getUserName() + "</h1>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
