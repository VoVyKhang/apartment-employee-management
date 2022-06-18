<%-- 
    Document   : listEmp
    Created on : May 29, 2022, 8:06:21 PM
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
        <title>Change Department</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    <a></a>
</head>
<body>
    <c:import url="header.jsp"></c:import>
    <c:import url="sidebar.jsp"></c:import>  

        <div style="margin: 0 32px; width: 100%" class="change-department">
        <c:if test="${requestScope.listEmp != null}">
            <c:if test="${not empty requestScope.listEmp}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID Employee</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Department</th>
                            <th scope="col">Position</th>
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listEmp" varStatus="counter" items="${requestScope.listEmp}">
                        <form action="mainController">
                            <tr>


                                <td>${listEmp.idEmp}</td>     
                                <td>
                                    <img class="align-self-center img-fluid" src='images/${listEmp.imgPath}' width="120"
                                         height="120">
                                </td>

                                <td class="nameEmp">${listEmp.name}</td>
                                <td>${listEmp.gender}</td>
                                <td>${listEmp.dob}</td>
                                <td class="exception">Old department: ${listEmp.depName}</br>
                                    </br>

                                    <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                                       url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                                                       user = "sa"  password = "12345"/>

                                    <sql:query dataSource = "${snapshot}" var = "result">
                                        select DISTINCT d.depNum, d.depName
                                        from HistoryDep as hd, Department as d
                                        where hd.depNum <> d.depNum
                                        and hd.depNum = (
                                        select depNum
                                        from Department
                                        where depName = '${listEmp.depName}'
                                        );
                                    </sql:query>

                                    <form action="mainController" method="POST">
                                        <label>New department:</label>
                                        <select name="iddep">
                                            <c:forEach var = "row" items = "${result.rows}">
                                                <option selected="" value="${row.depNum}">${row.depName}</option>
                                            </c:forEach>
                                        </select>
                                        </br>
                                        </br>

                                        
                                        </td>
                                        <td>${listEmp.posName}</td>

                                        <td>

                                            <input type="hidden" name="idemp" value="${listEmp.idEmp}">
                                            <input type="hidden" name="action" value="changeDep" >
                                            <input type="hidden" name="olddep" value="${listEmp.depName}">
                                            <input class="btn btn-secondary btn-sm" type="submit" value="Change">
                                    </form>

                                </td>
                            </tr>
                        </form> 
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>
        <div class="changedep-btn">
            <p style="color:green">${requestScope.WARNING}</p>
            <a href="mainController?action=history&typehis=hisdep">History of change department</a>

        </div>
    </div>
</body>
</html>
