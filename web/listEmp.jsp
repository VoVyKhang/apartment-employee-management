<%-- 
    Document   : listEmp
    Created on : May 29, 2022, 8:06:21 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee</title>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/styles.css"/>
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
                float: left !important;
                margin-left: -16px
            }

            .page-title{
                text-align: initial !important;
                margin-left: 16px !important
            }

            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 50px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                display: flex;
                width: 268.6px;
                height: 38px;
                background-color: #55ce63;
                text-transform: uppercase
            }
            
            .search-btn:hover{
                transform: scale(0.9)
            }
            
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listDep">
            select depName
            from Department
        </sql:query>

        <sql:query dataSource = "${snapshot}" var = "listPos">
            select posName
            from Position
        </sql:query>

        <div class="list__employee">
            <div class="page-header">
                <div class="row">
                    <h3 class="page-title">Employee</h3>
                    <div class="col-sm-12 list-employee__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item active">Employee</li>
                            </ul>
                        </div>
                        <div style="margin-right: 8px">          
                            <a style="display: flex" class="add-btn"  href="createNewEmp.jsp">
                                <i class="ri-add-fill list__employee-icon"></i>
                                Add Employee
                            </a>
                            <div> 
                                <p style="color: green">${requestScope.COMPLETED}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div>
                <form action="mainController" method="post" >
                    <div class="row filter-row" style="margin-bottom: 16px">
                        <div class="col-sm-6 col-md-3" style="margin-top: 8px">
                            <div class="form-group mb-3 mt-3" >
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter name..." name="empname">
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3"> 
                            </br>
                            <select class="form-select form-select-md-5 mb-1 list-options form-control" name="depname"> 
                                <option value="" >All Department</option>
                                <% String depName = request.getParameter("depname");
                                    if (depName == null) {
                                        depName = "";
                                    }
                                    String posName = request.getParameter("posname");
                                    if (posName == null)
                                        posName = "";
                                %>
                                <c:set var="depName" value="<%= depName%>"></c:set>
                                <c:set var="posName" value="<%= posName%>"></c:set>
                                <c:forEach var="listDep" items="${listDep.rows}">
                                    <option value="${listDep.depName}" <c:if test="${depName eq listDep.depName}">selected=""</c:if>>${listDep.depName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            </br>
                            <select class="form-select form-select-md-5 mb-1 list-options form-control" name="posname"> 
                                <option value="" >All Position</option>
                                <c:forEach var="listPos" items="${listPos.rows}">
                                    <option value="${listPos.posName}"<c:if test="${posName eq listPos.posName}">selected=""</c:if>>${listPos.posName}</option>
                                </c:forEach>
                            </select>
                        </div> 
                        <div class="col-sm-6 col-md-3 ">
                            </br>
                            <input type="submit" value="Search" class="btn search-btn">
                            <input type="hidden" value="searchEmp" name="action" >
                        </div>
                    </div>
                </form>
            </div>

            <c:if test="${requestScope.listEmp != null}">
                <c:if test="${not empty requestScope.listEmp}">
                    <table style="font-size: 14px" class="table table-striped list__employee-table">
                        <thead>
                            <tr class="list__employee-header">
                                <th scope="col">Employee ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Email</th>
                                <th scope="col">Department</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Reward - Penalty</th>
                                <th scope="col">Employee Records</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listEmp" varStatus="counter" items="${requestScope.listEmp}">
                            <form action="mainController">
                                <tr class="list__employee-body">
                                    <td scope="row">${listEmp.idEmp}</td>     
                                    <td class="list__employee-item">
                                        <span>
                                            <img class="list__employee-item-img" src='images/${listEmp.imgPath}'>
                                        </span>
                                        <div class="list__employee-description">
                                            <span class="list__employee-description-name">${listEmp.name}</span>                   
                                            <span class="list__employee-description-pos">${listEmp.posName}</span>
                                        </div>
                                    </td>

                                    <td>${listEmp.gender}</td>
                                    <td>${listEmp.dob}</td>
                                    <td>${listEmp.email}</td>
                                    <td>${listEmp.depName}</td>

                                    <td>
                                        <a href="mainController?action=passidemp&empid=${listEmp.idEmp}&type=update">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>


                                    <td>
                                        <c:url var="create" value="mainController">
                                            <c:param name="action" value="pushss"> </c:param>
                                            <c:param name="idemp" value="${listEmp.idEmp}"> </c:param>
                                            <c:param name="updatetype" value="createnewrp"> </c:param>
                                            <c:param name="nameemp" value="${listEmp.name}"> </c:param>
                                        </c:url>
                                        <a href="${create}"><i class="fas fa-plus-square"></i></a>
                                    </td>

                                    <td>
                                        <a href="mainController?action=passidemp&empid=${listEmp.idEmp}&type=detail">
                                            <i class="fas fa-address-card"></i></a>
                                    </td>
                                </tr>
                            </form> 
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
