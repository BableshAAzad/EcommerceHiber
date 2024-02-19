package com.ecom.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecom.dao.CategoryDao;
import com.ecom.dao.ProductDao;
import com.ecom.entities.Category;
import com.ecom.entities.Product;
import com.ecom.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	@Override
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
//			    add product
				String pName = request.getParameter("pName");
				String catDesc = request.getParameter("catDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPhoto");

				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(catDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());

//				get category by id
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(catId);
				p.setCategory(category);
//				Product save
				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
//				Pic upload

//				find out the path to upload photo
				String path = request.getRealPath("img") + File.separator + "products" + File.separator
						+ part.getSubmittedFileName();
				System.out.println(path);
//				Uploading code
//				try {
//					FileOutputStream fos = new FileOutputStream(path);
//
//					InputStream is = part.getInputStream();
				try (FileOutputStream fos = new FileOutputStream(path); InputStream is = part.getInputStream()){
//					Reading data
					byte[] data = new byte[is.available()];
					is.read(data);
//					Writing the data
					fos.write(data);
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

//				out.println("Product Save Success....");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product Added");
				response.sendRedirect("admin.jsp");
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
