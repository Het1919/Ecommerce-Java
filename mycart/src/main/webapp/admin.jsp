<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("error_message", "You are Not Logged In!! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("error_message", "You are Not an Admin!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin">

            <div class='container-fluid mt-3'>
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>
                            <h1>998</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon"/>
                            </div>
                            <h1>450</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon"/>
                            </div>
                            <h1>8590</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row--> 
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click Here to add new Category</p>
                            <h1 class="text-uppercase text-muted">Add category</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--add category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="POST">
                            <input type='hidden' name='operation' value="addcategory"/>
                            <div class="form-group">
                                <input type='text' class="form-control" name='catTitle' placeholder="Enter category title" required/>
                            </div>
                            <div class="form-group mt-2">
                                <textarea style="height: 200px;" class="form-control" placeholder="Enter category desription" name="catDescription" required></textarea>
                            </div>
                            <div class="container text-center mt-2">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--end add category modal-->

        <!--=======================================================-->

        <!--add product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!--form start-->

                        <form action="ProductOperationServlet" method="POST">

                            <!--product title-->
                            <div class="form-group mt-2">
                                <input type='text' class="form-control" placeholder="Enter title of Product" name="pName" required/>
                            </div>

                            <!--product description-->
                            <div class="form-group mt-2">
                                <textarea style="height: 80px;" class="form-control" placeholder="Enter product desription" name="pDesc" required></textarea>
                            </div>

                            <!--product price-->
                            <div class="form-group mt-2">
                                <input type='number' class="form-control" placeholder="Enter price of Product" name="pPrice" required/>
                            </div>

                            <!--product discount-->
                            <div class="form-group mt-2">
                                <input type='text' class="form-control" placeholder="Enter product discount" name="pDiscount" required/>
                            </div>

                            <!--product quantity-->
                            <div class="form-group mt-2">
                                <input type='text' class="form-control" placeholder="Enter product quantity" name="pQuantity" required/>
                            </div>

                            <!--product category-->

                            <%  
                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getcategories();
                            %>


                            <div class="form-group mt-2">
                                <select name="catId" class="form-control" id="">

                                    <%
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <!--product file photo-->
                            <div class="form-group mt-2">
                                <label for="pPic">Select Picture of Product</label><br/>
                                <input type="file" name="pPic" id="pPic" required/>
                            </div>

                            <!--submit button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>
                        <!--end form-->
                    </div>

                </div>
            </div>
        </div>

        <!--end add product modal-->
    </body>
</html>
