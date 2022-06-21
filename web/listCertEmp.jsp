<%-- 
    Document   : listCertEmp
    Created on : Jun 21, 2022, 11:06:04 AM
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
        <title>Certificate</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import>
        <c:if test="${updateSuccess != null}" >
            <h3 style="color: green" ><c:out value="${updateSuccess}" /></h3>
        </c:if>
        <c:if test="${updateFail != null}" >
            <h3 style="color: red" > <c:out value="${updateFail}" /></h3>
        </c:if>
        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listcer">
            select cerID, cerName, doi, tc.name as type
            from Certificate as c, TypeCertificate tc
            where c.idTypeCer = tc.idTypeCer and c.idEmp = ${sessionScope.USER_LOGGIN.idEmp}
        </sql:query>

        <div>
            <a href="mainController?action=addNewCertPage">Add new Certificate</a>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Day of get</th>
                    <th scope="col">Type</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var = "rowcer" items = "${listcer.rows}">
                <form action="mainController" method="POST">
                    <tr>
                        <td><input type="hidden" name="cerName" value="${rowcer.cerName}"/>${rowcer.cerName}</td>
                        <td><input type="hidden" name="cerDoi" value="${rowcer.doi}"/>${rowcer.doi}</td>
                        <td><input type="hidden" name="cerType" value="${rowcer.type}"/>${rowcer.type}</td>
                        <td>
                            <input type="hidden" name="action" value="updateCertPage"/>
                            <input type="hidden" name="cerID" value="${rowcer.cerID}"/>
                            <input type="submit" value="Edit"/>
                        </td>
                    </tr>
                </form>
            </c:forEach>

        </tbody>
    </table>
</body>
</html>
