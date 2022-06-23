<%-- 
    Document   : listDep
    Created on : May 29, 2022, 8:06:05 PM
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
        <title>List Department</title>
        <style>
            .btn-primary{
                background-color: #01a3ed !important;
                border: 1px solid #01a3ed !important;
                border-radius: 20px !important;
                font-size: 18px;
                font-weight: 600;
                min-width: 150px;
                padding: 10px 20px;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:import url="sidebar.jsp"></c:import>
        <c:if test="${requestScope.listDep != null}">
            <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                               url = "jdbc:sqlserver://localhost:1433;databaseName=ApartmentEmployeeManagement"
                               user = "sa"  password = "12345"/>

            <sql:query dataSource = "${snapshot}" var = "listLocation">
                select location
                from Department
            </sql:query>
            <div style="margin: 0 32px" class="list-employee">
                <form action="mainController" method="POST" class="form-reward-penalty">
                    <div class="row filter-row" style="margin-left: 16px">
                        <div class="col-sm-6 col-md-4">
                            <div class="form-group mb-3 mt-3">
                                <label>Department Name</label>
                                <input type="text" class="form-control " id="email" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>" name="txtSearchName">
                                
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 mt-3"> 
                            <div class="form-group form-focus select-focus">
                                <label >Location</label>
                                <select name="locationDep" class="form-select form-select-md-5 mb-1 list-options" > 
                                    <option value="allDep">All</option>
                                    <c:forEach var="listLocation" items="${listLocation.rows}">
                                        <option value="${listLocation.location}" ><c:out value="${listLocation.location}"/></option>                       
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                             <div class="col-sm-6 col-md-4 " style="margin-top: 48px">
                            <input class="btn btn-primary" type="submit" value="Filter"/>
                            <input  type="hidden" name="action" value="filterDepByLocation"/>
                        </div>
                    </div>
                </form>
                <h5>${requestScope.SearchRS}</h5>
                <div style="margin: 0 32px" class="list-dep">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">DepNum</th>
                                <th scope="col">Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Location</th>
                                <th scope="col">Date Create</th>
                                <th scope="col">Creator</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listDep" varStatus="counter" items="${requestScope.listDep}">
                            <form action="mainController">
                                <tr>
                                    <td>${listDep.depNum}</td>                            
                                    <td>${listDep.depName}</td>
                                    <td>${listDep.description}</td>
                                    <td class="location">${listDep.location}</td>
                                    <td>${listDep.dateCreate}</td>
                                    <td>${listDep.creator}</td>

                                    <td>
                                        <a href="mainController?action=passiddep&iddep=${listDep.depNum}"><i class="fas fa-edit"></i></a>

                                    </td>

                                    <td>
                                        <c:url var="delete" value="mainController">
                                            <c:param name="action" value="Delete"> </c:param>

                                            <c:param name="id" value="${listDep.depNum}"> </c:param>
                                        </c:url>
                                        <a href="${delete}"><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                            </form> 
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <div class="dep-btn">
                <p style="color:green">${requestScope.WARNING}<p>
                    <a href="createNewDep.jsp">Create New Department</a>
                    <a href="mainController?action=showlist&type=changedep">Change Department</a>
            </div>
        </div>
    </body>
</html>
