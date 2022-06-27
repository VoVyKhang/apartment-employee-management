<%-- 
    Document   : createNewDep
    Created on : May 31, 2022, 7:53:10 AM
    Author     : lehon
--%>

<%@page import="management.dto.EmployeeDTO"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Department Page</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            .btn-primary{
                background: linear-gradient(to right, #00c0f9, #0255cd);
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                padding: 5px 10px;
                margin-top: 16px;
                width: 100%
            }
            
            .btn-primary:hover{
                transform: scale(0.99);
                opacity: 0.9
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>     

        <div class="modal-content" style="margin: 0 8px">
                <div class="modal-header" style="margin-bottom: 16px">
                    <h5 class="modal-title">Create new department</h5>
                </div>

                <form action="mainController" method="POST" class="form-position" style="margin: 0 16px">
                    <div class="form-group">
                        <label for="formGroupExampleInput">Name</label>
                        <input type="text" class="form-control" id="formGroupExampleInput" name="depname" placeholder="Enter name..."
                        <c:if test="${not empty requestScope.namereg}">value="${requestScope.namereg}"</c:if>>
                    <p style="color:red">${requestScope.messName}</p>
                </div>

                <div class="form-group">
                    <label for="formGroupExampleInput2">Description</label>
                    <input type="text" name="depdes" class="form-control" id="formGroupExampleInput2" placeholder="Enter description..."
                           <c:if test="${not empty requestScope.desreg}">value="${requestScope.desreg}"</c:if>>
                    <p style="color:red">${requestScope.messDes}</p>
                </div>

                <div class="form-group">
                    <label for="formGroupExampleInput2">Location</label>
                    <input type="text" name="deploc" class="form-control" id="formGroupExampleInput2" placeholder="Enter location..."
                           <c:if test="${not empty requestScope.locreg}">value="${requestScope.locreg}"</c:if>>
                    <p style="color:red"> ${requestScope.messLoc}</p>
                </div>
                <%Date d = new Date();%>
                <%EmployeeDTO emp = (EmployeeDTO) session.getAttribute("USER_LOGGIN");
                String name = emp.getName();%>

                <div class="form-group">
                    <label for="formGroupExampleInput2">Date Create</label>
                    <input type="text" name="depdate" class="form-control" value="<%=d%>" readonly="" id="formGroupExampleInput2" placeholder="Another input">
                </div>    

                <div class="form-group">
                    <label for="formGroupExampleInput2">Creator</label>
                    <input type="text" name="depcre" class="form-control" value="<%=name%>"readonly="" id="formGroupExampleInput2" placeholder="Another input">
                </div>   
                <div>
                    <p style="color:red">${requestScope.WARNING}</p>
                </div>
                <div class="form-position__btn">
                    <input class="btn btn-primary" type="submit" name="action" value="Create"/>    
                </div>
                <c:if test="${requestScope.SUCCESS != null}">
                    <p style="color:green">${requestScope.SUCCESS}</p>
                </c:if>
            </form>
        </div>
    </body>
</html>
