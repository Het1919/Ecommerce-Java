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
        <title>Admin Panel/Edit Page</title>

        <%@include file="components/common_css_js.jsp" %>
        
        <style>
            body{
                background: #e2e2e2;
            }
        </style>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
