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
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }
            .list-employee__actions{
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .breadcrumb{
                background-color: #f7f7f7 !important;
                display: inline-flex !important;
            }
            .page-title{
                text-align: initial !important;
                margin-left: 16px !important;
                margin-top: 8px
            }
            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 5px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                height: 38px;
                background-color: #55ce63;
                text-transform: uppercase;
                width: 100%;
                margin-top: 15px
            }

            .search-btn:hover{
                transform: scale(0.95);
                opacity: 0.9
            }
            
            .list-contract__link{
                font-weight: 600;
                padding: 4px 8px;
                border: 1px solid #333;
                border-radius: 5px
            }
            
            .list-contract__link:hover{
                background-color: #000;
                color: #fff
            }
            
            .con-body td{
                padding: 0 !important;
                vertical-align: middle !important
            }
            
            .con-body td:first-child{
                padding-left: 20px !important
            }
            
            .con-header th{
                padding-left: 0 !important
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

        <div style="width: 100%">
            <div class="page-header">
                <div class="row">
                    <h3 class="page-title">Contract</h3>
                    <div class="col-sm-12 list-employee__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item active">Contract</li>
                            </ul>
                        </div>
                        <div style="margin-right: 16px">                                      
                            <div>
                                <p style="color:green">${requestScope.COMPLETE}</p>
                                <a class="list-contract__link" href="createNewCon.jsp">Create New Contract</a>
                                <p style="color: green">${requestScope.COMPLETED}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div style="margin: 0 16px">
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
                                <input type="submit" value="searchCon" name="action" class="btn search-btn">
                            </div>
                        </div>
                    </form>

                <c:if test="${requestScope.listCon != null}">
                    <c:if test="${not empty requestScope.listCon}">

                        <table  class="table table-striped" >
                            <thead>
                                <tr class="con-header">
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
                                    <tr class="con-body">
                                        <td>${listCon.idCon}</td>
                                        <td>${listCon.typeCon}</td>
                                        <td>${listCon.signDay}</td>
                                        <td>${listCon.expDay}</td>
                                        <td>${listCon.nameEmp}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${listCon.status eq 0}">
                                                    <p style="color:red; margin-bottom: 0">Expired</p>
                                                    <a href="mainController?action=passidcon&idcon=${listCon.idCon}&flag=renewal">Renewal</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <p style="color:green; margin-bottom: 0">Active</p>
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
