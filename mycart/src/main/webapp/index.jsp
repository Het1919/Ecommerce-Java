<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="row mt-3 mx-2">

            <%                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = dao.getAllProducts();
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getcategories();
            %>

            <!--show categories-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                        All Categories
                    </a>

                    <%
                        for (Category c : clist) {
                    %>
                    <a href="#" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    <%
                        }
                    %>
                </div>
            </div>

            <!--show products-->
            <div class="col-md-8">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <% for (Product p : list) {%>

                    <div class="col">
                        <div class="card">
                            <div class="container text-center">
                                <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="<%= p.getpName()%>">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><%= p.getpName()%></h5>
                                <p class="card-text"><%= Helper.get10Words(p.getpDesc())%></p>
                            </div>
                            <div class="card-footer">
                                <button class="btn custom-bg text-white">Add to Cart</button>
                                <button class="btn btn-outline-primary"> &#8377; <%= p.getpPrice()%></button>
                            </div>
                        </div>
                    </div>

                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
