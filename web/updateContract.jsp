<%-- 
    Document   : updateContract
    Created on : Jun 7, 2022, 9:13:49 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Contract Page</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>   


            <div>
                <form action="mainController" method="POST" style="margin: 0 32px; width: 100%">

                <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                   url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                                   user = "sa"  password = "12345"/>

                <sql:query dataSource = "${snapshot}" var = "listtype">
                    select idTypeCon, name
                    from TypeContract
                </sql:query>



                <p>Contract of employee : ${requestScope.Contract.nameEmp} </p>
                <p style="color:red">${requestScope.WARNING}</p>
                <label>Type of contract</label>
                <select name="typecon">
                    <c:forEach var = "rowlist" items = "${listtype.rows}">

                        <option value="${rowlist.idTypeCon}"
                                <c:if test="${requestScope.Contract.typeCon eq rowlist.name}">
                                    selected=""
                                </c:if>
                                >${rowlist.name}</option>
                    </c:forEach>
                </select>
                </br>
                Sign Day <input type="text" readonly="" value="${requestScope.Contract.signDay}"/></br>
                Expiration Day <input type="date" value="${requestScope.Contract.expDay}" name="expday"/></br>
                <c:choose>
                    <c:when test="${requestScope.Contract.status eq 1}">
                        Status: <p style="color:green">OK</p>
                    </c:when>
                    <c:otherwise>
                        Status: <p style="color:red">Expired</p>
                    </c:otherwise>
                </c:choose>

                <input type="hidden" value="${requestScope.Contract.idCon}" name="idcon">
                <input type="submit" name="action" value="updateCon"/> 
                

            </form>
        </div>
    </body>
</html>
