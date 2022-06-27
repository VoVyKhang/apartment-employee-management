<%-- 
    Document   : listCertificate
    Created on : Jun 6, 2022, 9:45:26 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Certificate</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }
        </style>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listCer">
            select name
            from TypeCertificate
        </sql:query>
            
        <div style="width: 100%">
            <div style="margin: 0 32px">
                <div>
                    <a href="mainController?action=add new certificate">Add new Certificate</a>
                </div>

                <form action="mainController" method="post" >
                    <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group mb-3 mt-3">
                            <label for="ID">Employee ID</label>
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empid") == null) ? "" : request.getParameter("empid")%>" placeholder="Enter email" name="empid">                           
                        </div>
                    </div> 
                        <div class="col-sm-6 col-md-3">
                            <div class="form-group mb-3 mt-3">
                                <label for="name">Employee Name</label>
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter email" name="empname">                              
                            </div>
                        </div>
                            <div class="col-sm-6 col-md-3" style="margin-top: 48px">
                            <select class="form-select form-select-md-5 mb-1 list-option form-controls" name="typecer"> 
                                <option value="" >All Certificate</option>
                                <c:forEach var="listCer" items="${listCer.rows}">
                                    <option value="${listCer.name}"
                                            <c:if test="${listCer.name eq sessionScope.typecer}">selected="${listCer.name}"</c:if>>${listCer.name}</option>
                                </c:forEach>
                            </select>
                        </div> 
                        <div class="col-sm-6 col-md-3 ">
                            </br>
                            <input style="margin-top: 22px" type="submit" value="searchCer" name="action" class="btn btn-primary">
                        </div>
                    </div>
                </form>
                                
            <c:if test="${updateSuccess != null}" >
                <h3 style="color: green" ><c:out value="${updateSuccess}" /></h3>
            </c:if>
            <c:if test="${updateFail != null}" >
                <h3 style="color: red" > <c:out value="${updateFail}" /></h3>
            </c:if>
            <c:if test="${requestScope.listCer != null}">
                
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID </th>
                                <th scope="col">Employee name</th>                      
                                <th scope="col">Certificate ID</th>
                                <th scope="col">Certificate name</th>
                                <th scope="col">Date of issue</th>
                                <th scope="col">Type certificate</th>
                                <th scope="col">Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listCer" items="${requestScope.listCer}">    
                                <tr>
                                    <td scope="row">${listCer.idEmp}</td>
                                    <td>${listCer.empName}</td>                            
                                    <td>${listCer.cerId}</td>
                                    <td>${listCer.cerName}</td>
                                    <td>${listCer.doi}</td>
                                    <td>${listCer.type}</td>                            
                                    <td> <a href="mainController?action=updateCertificate&&idEmp=${listCer.idEmp}&&cerId=${listCer.cerId}&&idTypeCer=${listCer.idTypeCer}"><i class="fas fa-edit"></i></a></td>
                                </tr>                        
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </body>
</html>
