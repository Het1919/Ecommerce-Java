package com.mycompany.mycart.servlets;

import com.mycompany.mycart.dao.CategoryDao;
import com.mycompany.mycart.entities.Category;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //Servlet 2 works -> Add category and Add Product
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                //add category
                //fetching category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                //category database save:
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCaregory(category);
                //out.println("Category Saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Added Successfully: "+catId);
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addproduct")) {
                //add product
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}