<%-- 
    Document   : historyChange
    Created on : Jun 5, 2022, 10:28:38 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <title>History Change Department</title>
        <style>
            .btn-primary{
                background-color: #01a3ed !important;
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                min-width: 150px;
                padding: 10px 20px;
                margin-top: 46px
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

        <c:if test="${requestScope.listHisDep != null}">
            <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                               url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                               user = "sa"  password = "12345"/>

            <sql:query dataSource = "${snapshot}" var = "listDep">
                select depName
                from Department
            </sql:query>
            <div style="margin: 0 32px; width: 100%">
                <form action="mainController" method="POST" class="form-reward-penalty">
                    <div class="row filter-row">
                        <div class="col-sm-6 col-md-3">
                            <div class="form-group mb-3 mt-3">
                                <label for="name">Employee Name</label>
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>" placeholder="Enter name" name="txtSearchName">
                                
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3 mt-3"> 
                            <div class="form-group form-focus select-focus">
                                <label >Status</label>
                                <select name="status" class="form-select form-select-md-5 mb-1 list-options" >
                                    <option value="allStatus">All</option>
                                    <option value="0">Inactive</option>
                                    <option value="1">Active</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3 mt-3"> 
                            <div class="form-group form-focus select-focus">
                                <label >Department</label>
                                <select name="depName" class="form-select form-select-md-5 mb-1 list-options" > 
                                    <option value="allDep">All</option>
                                    <c:forEach var="listDep" items="${listDep.rows}">
                                        <option value="${listDep.depName}" ><c:out value="${listDep.depName}"/></option>                       
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <input class="btn btn-primary" type="submit" value="Filter"/>
                            <input  type="hidden" name="action" value="filterHisDep"/>
                        </div>
                    </div>
                </form>
                <h5>${requestScope.SearchRS}</h5>
                <table class="table table-striped">
                    <thead >
                        <tr style="text-align: center">
                            <th scope="col">ID History</th>
                            <th scope="col">Employee</th>
                            <th scope="col">Department</th>
                            <th scope="col">Delivery Date</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listHisDep" varStatus="counter" items="${requestScope.listHisDep}">    
                            <tr style="text-align: center">


                                <td>${listHisDep.idHidDep}</td>                            
                                <td>${listHisDep.nameEmp}</td>
                                <td>${listHisDep.nameDep}</td>
                                <td>${listHisDep.deliveryDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${listHisDep.status eq 1}">
                                            <p style="color:green">Active</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p style="color:red">Inactive</p>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>                        
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>
