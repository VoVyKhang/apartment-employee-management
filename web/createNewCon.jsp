<%-- 
    Document   : createNewCon
    Created on : Jun 7, 2022, 8:09:10 AM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new contract Page</title>
        <style>
            .certificate-select{
                
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                width: 100%;
                height: 42px
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "resultemp">
            select DISTINCT e.idEmp, name
            from Employee as e, Contract as c
            where e.idEmp not in (
            select e.idEmp
            from Employee as e, Contract as c
            where c.idEmp = e.idEmp ) and role = 0
        </sql:query>

        <sql:query dataSource = "${snapshot}" var = "resulttype">
            select idTypeCon, name
            from TypeContract
        </sql:query>


        <c:if test="${result.rowCount != 0}">
            <div style="width: 100%">
                <form action="mainController" method="post" style="margin: 0 32px" class="form-position">
                    <div class="form-group">
                        <div style="margin-bottom: 8px">Type of contract</div>
                        <select name="typecon" class="certificate-select">
                            <c:forEach var = "rowtype" items = "${resulttype.rows}">
                                <option value="${rowtype.idTypeCon}">${rowtype.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <%Date d = new Date();%>


                    <div class="form-group">
                        <label>Sign Day</label>
                        <input class="form-control" type="text" name="signday" value="<%=d%>" readonly="">
                    </div>


                    <div class="form-group">
                        <label>Expiration Day</label>
                        <input class="form-control" type="date" name="expday">
                    </div>


                    <div class="form-group">
                        <div style="margin-bottom: 8px">Choose Employee</div>
                        <select name="idemp" class="certificate-select">
                            <c:forEach var = "rowemp" items = "${resultemp.rows}">
                                <option value="${rowemp.idEmp}">ID: ${rowemp.idEmp} - ${rowemp.name}</option>
                            </c:forEach>
                        </select>

                    </div>

                    <p style="color:red">${requestScope.WARNING}</p>
                    <p style="color:green">${requestScope.COMPLETE}</p>  

                    <input type="hidden" name="action" value="createcon">
                    <input class="btn btn-secondary btn-sm" type="submit" value="Create New"> 
                </form>
            </div>
        </c:if>
        <c:if test="${result.rowCount == 0}">
            <p style="color:green">All employees have been registered for the contract</p>
        </c:if>
    </body>
</html>
