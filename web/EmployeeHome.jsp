<%-- 
    Document   : EmployeeHome
    Created on : May 29, 2022, 1:26:52 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Page</title>
    </head>
    <body>
        <h1>Welcome back to Employee Home</h1>
        <h3><a href="logoutController?action=logout">Log out</a> </h3>
        <h2>Hello <c:out value="${sessionScope.USER_LOGGIN.name}"/> </h2>
    </body>
</html>
