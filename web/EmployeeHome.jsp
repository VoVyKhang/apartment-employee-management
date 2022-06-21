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
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import>
        <h2>Hello <c:out value="${sessionScope.USER_LOGGIN.name}"/> </h2>
    </body>
</html>
