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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
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
                margin-left: -16px;
            }
            .page-title{
                text-align: initial !important;
                margin-left: 2px !important;
                margin-top: 8px
            }
            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 5px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                display: flex;
                width: 268.6px;
                height: 38px;
                background-color: #55ce63;
                text-transform: uppercase;
                margin-top: -10px
            }

            .search-btn:hover{
                transform: scale(0.95);
                opacity: 0.9
            }

            .add-btn{
                background-color: #00a8ef;
                border: 1px solid #00c5fb;
                border-radius: 50px;
                color: #fff;
                font-weight: 500;
                min-width: 140px;
                text-decoration: none;
                cursor: pointer;
                padding: 4px 10px;
                display: flex;
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

        <div style="width: 100%; margin: 0 16px">

            <div class="page-header">
                <div class="row">
                    <h3 class="page-title">Certificate</h3>
                    <div class="col-sm-12 list-employee__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item active">Certificate</li>
                            </ul>
                        </div>
                        <div style="margin-right: 8px">          
                            <a class="add-btn" href="mainController?action=add new certificate">
                                <i class="ri-add-fill list__employee-icon"></i>
                                Add new Certificate</a>
                        </div>
                    </div>
                </div>
            </div>

            <form action="mainController" method="post" >
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group mb-3 mt-3">
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchIdemp") == null) ? "" : request.getParameter("txtSearchIdemp")%>" placeholder="Enter employee id..." name="txtSearchIdemp">
                        </div>
                    </div>  
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group mb-3 mt-3">
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>" placeholder="Enter name..." name="txtSearchName">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" style="margin-top: 15px">
                        <select class="form-select form-select-md-5 mb-1 list-option form-controls" name="typecer"> 
                            <option value="allCer" >All Type Certificate</option>
                            <c:forEach var="listCer" items="${listCer.rows}">
                                <option value="${listCer.name}"
                                        <c:if test="${listCer.name eq sessionScope.typecer}">selected="${listCer.name}"</c:if>>${listCer.name}</option>
                            </c:forEach>
                        </select>
                    </div> 
                    <div class="col-sm-6 col-md-3 ">
                        </br>
                        <input type="submit" value="Search" class="btn search-btn">
                        <input type="hidden" name="action" value="searchCer" >
                    </div>
                </div>
            </form>
            <h5>${requestScope.SearchRS}</h5>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID Employee</th>
                        <th scope="col">Employee name</th>                      
                        <th scope="col">Cert ID</th>                      
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
                            <td class="list__employee-item">
                                <span>
                                    <img class="list__employee-item-img" src='images/${listCer.imgPath}'>
                                </span>
                                <div class="list__employee-description">
                                    <span class="list__employee-description-name">${listCer.cerName}</span>                 
                                </div>
                            </td>
                            <td>${listCer.doi}</td>
                            <td>${listCer.type}</td>                            
                            <td> <a href="mainController?action=updateCertificate&&idEmp=${listCer.idEmp}&&cerId=${listCer.cerId}&&idTypeCer=${listCer.idTypeCer}"><i class="fas fa-edit"></i></a></td>
                        </tr>                        
                    </c:forEach>
                </tbody>
                <c:if test="${updateSuccess != null}" >
                    <h3 style="color: green" ><c:out value="${updateSuccess}" /></h3>
                </c:if>
                <c:if test="${updateFail != null}" >
                    <h3 style="color: red" > <c:out value="${updateFail}" /></h3>
                </c:if>
            </table>
        </div>
    </body>
</html>
