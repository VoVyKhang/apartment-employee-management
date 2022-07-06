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
        <title>History Contract</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 50px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                width: 100%;
                height: 38px;
                background-color: #55ce63;
                text-transform: uppercase;
                margin-top: 15px
            }

            .search-btn:hover{
                transform: scale(0.9)
            }

            .pd-body td{
                padding: 0 !important;
                vertical-align: middle !important
            }
        </style>
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
        <div style="margin: 0 16px; width: 100%">
            <div class="page-header">
                <div class="row">
                    <h3 class="page-title">History Contract</h3>
                    <div class="col-sm-12 list-employee__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <c:if test="${requestScope.idEmp eq ''}">
                                    <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                    </c:if>
                                    <c:if test="${requestScope.idEmp ne ''}">
                                    <li class="breadcrumb-item"><a href="mainController?action=passidemp&empid=${requestScope.idEmp}&type=detail">Employee</a></li>
                                    </c:if>
                                <li class="breadcrumb-item"><a href="mainController?action=showlist&type=con">Contract</a></li>
                                <li class="breadcrumb-item active">History</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <form action="mainController" method="post" >
                <div class="row filter-row" style="margin-bottom: 16px">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group mb-3 mt-3">
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter employee name..." name="empname">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" style="margin-top: 15px"> 
                        <select class="form-select form-select-md-5 mb-1 list-options" name="typecon"> 
                            <option value="" >All Type</option>
                            <c:forEach var="listTyCon" items="${listTyCon.rows}">
                                <option value="${listTyCon.name}"
                                        <c:if test="${listTyCon.name eq sessionScope.typecon}">selected="${listTyCon.name}"</c:if>>${listTyCon.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-6 col-md-3" style="margin-top: 15px">
                        <select class="form-select form-select-md-5 mb-1 list-options" name="statuscon"> 
                            <option value="" <c:if test="${null eq sessionScope.statuscon}">selected=""</c:if>>All Contract</option>
                            <option value="1" <c:if test="${1 eq sessionScope.statuscon}">selected="1"</c:if>>Active</option>
                            <option value="0" <c:if test="${0 eq sessionScope.statuscon}">selected="0"</c:if>>Expired</option> 
                            </select>
                        </div> 
                        <div class="col-sm-6 col-md-3 ">
                            <input type="submit" value="Search"  class="btn search-btn">
                            <input type="hidden" value="searchCon" name="action" >
                            <input type="hidden" value="searchHisCon" name="searchHisCon" >
                        </div>
                    </div>
                </form>
            <c:if test="${requestScope.listCon != null}">
                <c:if test="${not empty requestScope.listCon}">
                    <table class="table table-striped">
                        <thead >
                            <tr style="text-align: center">
                                <th scope="col">ID History</th>
                                <th scope="col">Type</th>
                                <th scope="col">Sign Day</th>
                                <th scope="col">Expires Day</th>
                                <th scope="col">Employee</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <c:forEach var="listHisCon" varStatus="counter" items="${requestScope.listCon}">    
                            <tr style="text-align: center" class="pd-body">
                                <td>${listHisCon.idCon}</td>                            
                                <td>${listHisCon.typeCon}</td>
                                <td>${listHisCon.signDay}</td>
                                <td>${listHisCon.expDay}</td>
                                <td>${listHisCon.nameEmp}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${listHisCon.status eq 1}">
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
