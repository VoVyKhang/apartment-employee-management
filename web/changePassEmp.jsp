<%-- 
    Document   : changePassEmp
    Created on : Jun 26, 2022, 2:27:13 PM
    Author     : VyNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
        <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Change Password</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import>
        <form action="mainController">
            Current Password:<input type="password" name="oldPass" /><h6>${requestScope.checkOldPass}</h6></br>
            New Password:<input type="password" name="newPass"/><h6>${requestScope.checkNewPass}</h6></br>
            Confirm Password:<input type="password" name="confirmPass"/><h6>${requestScope.checkPass}</h6></br>
            <input type="submit" value="Save"/>
            <input type="hidden" name="action" value="changePassEmp"/>
        </form>
            <h6>${requestScope.Warning}</h6>
    </body>
</html>
