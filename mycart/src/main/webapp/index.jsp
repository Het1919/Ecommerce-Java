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
            
            <%  
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = dao.getAllProducts();
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getcategories();
            %>
            
            <!--show categories-->
            <div class="col-md-2">
                <h1>Number of categories are <%= clist.size()%></h1>
                <%
                    for (Category c : clist) {
                        out.println(c.getCategoryTitle() + "<br/>");
                    }
                %>
            </div>
            
            <!--show products-->
            <div class="col-md-8">
                <h1>Number of products are <%= list.size()%></h1>
                <%
                    for (Product p : list) {
                        out.println(p.getpPhoto()+"<br/>");
                        out.println(p.getpName() + "<br/><br/>");
                    }
                %>

            </div>
        </div>
    </body>
</html>
