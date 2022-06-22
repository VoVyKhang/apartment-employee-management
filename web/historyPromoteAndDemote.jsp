<%-- 
    Document   : historyPromoteAndDemote
    Created on : Jun 6, 2022, 3:32:01 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Promote and demote</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listHisPos1">
            select status
            from HistoryPos
        </sql:query>

        <sql:query dataSource = "${snapshot}" var = "listHisPos2">
            select type
            from HistoryPos
        </sql:query>
         <div style="margin: 0 32px; width: 100%">
             
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
                            <select class="form-select form-select-md-5 mb-1 list-options" name="typehispos"> 
                                <option value="" >All Type</option>
                                <c:forEach var="listHisPos2" items="${listHisPos2.rows}">
                                    <option value="${listHisPos2.type}">${listHisPos2.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            </br>
                            <select class="form-select form-select-md-5 mb-1 list-options" name="statushispos"> 
                                <option value="" >All Status</option>
                                <c:forEach var="listHisPos1" items="${listHisPos1.rows}">
                                    <option value="${listHisPos1.status}" >${listHisPos1.status}</option>
                                </c:forEach>
                            </select>
                        </div> 
                        <div class="col-sm-6 col-md-3 ">
                            </br>
                            <input type="submit" value="searchHisPos" name="action" class="btn btn-secondary btn-sm">
                        </div>
                    </div>
                </form>
                                
        <c:if test="${requestScope.listHisPos != null}">
            <c:if test="${not empty requestScope.listHisPos}">
                    <table class="table table-striped">
                        <thead >
                            <tr style="text-align: center">
                                <th scope="col">ID History</th>
                                <th scope="col">Employee</th>
                                <th scope="col">Position</th>
                                <th scope="col">Delivery Date</th>
                                <th scope="col">Type</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listHisPos" varStatus="counter" items="${requestScope.listHisPos}">    
                                <tr style="text-align: center">


                                    <td>${listHisPos.idHisPos}</td>                            
                                    <td>${listHisPos.nameEmp}</td>
                                    <td>${listHisPos.posName}</td>
                                    <td>${listHisPos.deliveryDate}</td>
                                    <td> <c:choose>
                                            <c:when test="${listHisPos.type eq 0}">
                                                Promote
                                            </c:when>
                                            <c:otherwise>
                                                Demote
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${listHisPos.status eq 1}">
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
        </c:if>
    </body>
</html>
