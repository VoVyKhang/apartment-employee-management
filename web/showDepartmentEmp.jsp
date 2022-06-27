<%-- 
    Document   : showDepartmentEmp
    Created on : Jun 26, 2022, 6:48:37 PM
    Author     : VyNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            .title{
                margin-top: 14px
            }

            .btn-primary{
                margin-top: 44px
            }
        </style>
        <title>Department Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:import url="sidebarEmp.jsp"></c:import>
        <div>Department Name: ${requestScope.department.depName}</div>
        <div>Department description: ${requestScope.department.description}</div>
        <div>Department Location: ${requestScope.department.location}</div>
        <div>Department Create Date: ${requestScope.department.dateCreate}</div>
        <div>Department Creator: ${requestScope.department.creator}</div>
        <a href="mainController?action=showHisDepEmp">Show History Department</a>
        <a href="mainController?action=showHisPosEmp">Show History Position</a>
    </body>
</html>
