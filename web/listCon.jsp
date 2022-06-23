<%-- 
    Document   : listContract
    Created on : Jun 6, 2022, 8:32:17 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Contract</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listTyCon">
            select name
            from TypeContract
        </sql:query>

        <div style="width: 100%">
            <div style="margin: 0 32px">
                <div>
                    <p style="color:green">${requestScope.COMPLETE}</p>
                    <a href="createNewCon.jsp">Create New Contract</a>
                </div>

                <form action="mainController" method="post" >
                    <div class="row filter-row">
                        <div class="col-sm-6 col-md-3">
                            <div class="form-floating mb-3 mt-3">
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter email" name="empname">
                                <label for="name">Employee Name</label>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3"> 
                            </br>
                            <select class="form-select form-select-md-5 mb-1 list-options" name="typecon"> 
                                <option value="" >All Type</option>
                                <c:forEach var="listTyCon" items="${listTyCon.rows}">
                                    <option value="${listTyCon.name}">${listTyCon.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            </br>
                            <select class="form-select form-select-md-5 mb-1 list-options" name="statuscon"> 
                                <option value="" >All Contract</option>
                                <option value="0" >Expired</option>
                                <option value="1" >OK</option>
                            </select>
                        </div> 
                        <div class="col-sm-6 col-md-3 ">
                            </br>
                            <input type="submit" value="searchCon" name="action" class="btn btn-secondary btn-sm">
                        </div>
                    </div>
                </form>

                <c:if test="${requestScope.listCon != null}">
                    <c:if test="${not empty requestScope.listCon}">

                        <table  class="table table-striped" >
                            <thead>
                                <tr>
                                    <th scope="col">ID Contract</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Sign Day</th>
                                    <th scope="col">Expires Day</th>
                                    <th scope="col">Name of Employee</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Update</th>
                                </tr>
                            </thead> 
                            <tbody>
                                <c:forEach var="listCon" varStatus="counter" items="${requestScope.listCon}">
                                <form action="mainController">
                                    <tr>
                                        <td scope="row">${listCon.idCon}</td>
                                        <td>${listCon.typeCon}</td>
                                        <td>${listCon.signDay}</td>
                                        <td>${listCon.expDay}</td>
                                        <td>${listCon.nameEmp}</td>

                                        <td>
                                            <c:choose>
                                                <c:when test="${listCon.status eq 0}">
                                                    <p style="color:red">Expired</p>
                                                    <a href="mainController?action=passidcon&idcon=${listCon.idCon}&flag=renewal">Renewal</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <p style="color:green">OK</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><a href="mainController?action=passidcon&idcon=${listCon.idCon}&flag=update"><i class="fas fa-edit"></i></a></td>
                                    </tr>
                                </form> 
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
