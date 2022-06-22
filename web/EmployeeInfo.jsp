<%-- 
    Document   : accountInfo
    Created on : Jun 15, 2022, 10:44:14 PM
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
        <title>Information Of Employee</title>
    </head>

    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import> 
            <div class="container">
                <div >

                    <div class="row">
                        <h1 style="text-align:center">Employee Information</h1>
                    </div>

                    <h6>${requestScope.COMPLETED}</h6>
                    <div class="row">
                        <div class="col-12"><h6><img class="align-self-center img-fluid" src='images/${sessionScope.USER_LOGGIN.imgPath}'style="width: 150px; height: 150px"></h6></div>
                </div>

                <div class="row" style="margin-top: 32px">
                    <div class="col-6"><h6 >Name: ${sessionScope.USER_LOGGIN.name}</h6></div>
                    <div class="col-6"><h6 >Address: ${sessionScope.USER_LOGGIN.address}</h6></div>
                </div>

                <div class="row">
                    <div class="col-6"><h6 >Age: ${sessionScope.USER_LOGGIN.age}</h6></div>
                    <div class="col-6"><h6 >Gender: ${sessionScope.USER_LOGGIN.gender}</h6></div>
                </div>

                <div class="row">
                    <div class="col-6"><h6 >Phone: ${sessionScope.USER_LOGGIN.phoneNum}</h6></div>
                    <div class="col-6"><h6 >Date Of Birth: ${sessionScope.USER_LOGGIN.dob}</h6></div>
                </div>

                <div class="row">

                    <div class="col-6"><h6 >Join Day: ${sessionScope.USER_LOGGIN.joinDate}</h6></div>
                    <div class="col-6"><h6 >Position: ${sessionScope.USER_LOGGIN.posName}</h6></div>
                </div>

                <div class="row">
                    <div class="col-6"><h6 >Department: ${sessionScope.USER_LOGGIN.depName}</h6></div>

                </div>
                <div class="row">
                    <div class="col-6"><h6 >Email: ${sessionScope.USER_LOGGIN.email}</h6></div>
                </div>
            </div>
                <a href="mainController?action=updateEmpPage">Change Your Info</a>

    </body>
</html>
