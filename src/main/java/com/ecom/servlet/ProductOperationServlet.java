package com.ecom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dao.CategoryDao;
import com.ecom.entities.Category;
import com.ecom.helper.FactoryProvider;

public class ProductOperationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String operation = request.getParameter("operation");
			if (operation.trim().equals("addCategory")) {
//			add category
//			fetching category data
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
//				Category object data save in database
				CategoryDao ategoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = ategoryDao.saveCategory(category);
//				out.println("Category Saved!!!");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category Added successfully ID : " + catId);
				response.sendRedirect("admin.jsp");
                return;
			} else if (operation.trim().equals("addProduct")) {
//			add product

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
