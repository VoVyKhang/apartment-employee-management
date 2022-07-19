
<%@page import="java.util.ArrayList"%>
<%@page import="management.dto.RewardPenaltyDTO"%>
<%@page import="management.dao.RewardPenaltyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reward And Penalty</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            .breadcrumb{
                background-color: #f7f7f7 !important;
                margin-left: -16px;
            }

            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 50px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                display: flex;
                width: 100%;
                height: 38px;
                background-color: #55ce63;
                text-transform: uppercase
            }

            .search-btn:hover{
                transform: scale(0.9)
            }

            .list__regulation-item{
                display: flex;
                align-items: center
            }

            .list__regulation-item-img{
                width: 38px;
                height: 38px;
                border-radius: 50%
            }

            .list__regulation-description{
                display: flex;
                flex-direction: column;
                text-align: initial;
                font-size: 14px;
                margin-left: 8px
            }

            .list__regulation-description-name{
                font-weight: 600;
                margin-bottom: 2px
            }

            .list__regulation-description-dep{
                font-size: 13px;
                opacity: 0.9
            }

        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:import url="sidebar.jsp"></c:import>
        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listDep">
            select depName
            from Department
        </sql:query>
        <div style="margin: 0 16px" class="list-employee">

            <div class="page-header">
                <div class="row">
                    <h3 class="page-title">Reward - Penalty</h3>
                    <div class="col-sm-12 list-employee__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item active">Reward-Penalty</li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>

            <form action="mainController" method="post" class="form-reward-penalty">
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
                    <div class="col-sm-6 col-md-3" style="margin-top: 16px"> 
                        <div class="form-group form-focus select-focus">
                            <select name="depName" class="form-select form-select-md-5 mb-1 list-options" > 
                                <option value="allDep">All Department</option>
                                <c:forEach var="listDep" items="${listDep.rows}">
                                    <option value="${listDep.depName}" ><c:out value="${listDep.depName}"/></option>                       
                                </c:forEach>
                            </select>
                        </div>
                    </div>        
                    <div class="col-sm-6 col-md-3 " style="margin-top: 15px">
                        <input type="submit" value="Search"  class="btn search-btn">
                        <input type="hidden" name="action" value="searchRP"/>
                    </div>
                </div>  
            </form>               
            <h5>${requestScope.SearchRS}</h5>
            <table  class="table table-striped">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Name </th>
                        <th>Gender </th>
                        <th>Type </th>
                        <th>Times</th>
                        <th>Date</th>
                        <th>Reason </th>
                        <th>Description</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="listrp" varStatus="counter" items="${requestScope.listrp}">
                    <form action="mainController">
                        <tr>
                            <td style="padding-left: 50px">${listrp.idEmp}</td> 
                            <td class="list__regulation-item">
                                <div>
                                    <img class="list__regulation-item-img" class="align-self-center img-fluid" src='images/${listrp.imgPath}'>
                                </div>
                                <div class="list__regulation-description"> 
                                    <span class="list__regulation-description-name">${listrp.name}</span>
                                    <span class="list__regulation-description-dep">${listrp.depName}</span>
                                </div>                        
                            </td>
                            <td>${listrp.gender}</td>
                            <td><c:choose>
                                    <c:when test="${listrp.status eq  1}">Reward</c:when>
                                    <c:otherwise>Penalty</c:otherwise>
                                </c:choose></td>
                            <td>${listrp.times}</td>
                            <td>${listrp.applicableDate}</td>
                            <td>${listrp.namere}</td>
                            <td>${listrp.reason}</td>
                            <td>
                                <c:url var="update" value="mainController">
                                    <c:param name="action" value="pushss"> </c:param>
                                    <c:param name="updatetype" value="updaterp"> </c:param>
                                    <c:param name="idreg" value="${listrp.idReg}"> </c:param>
                                    <c:param name="nameemp" value="${listrp.name}"> </c:param>
                                    <c:param name="idemp" value="${listrp.idEmp}"> </c:param>   
                                </c:url>
                                <a href="${update}"><i class="fas fa-edit"></i></a>
                            </td>                    
                        </tr>
                    </c:forEach>
                    </tbody>
                    <c:if test="${requestScope.updateSuccess != null}">
                        <p style="color:green"> <c:out value="${requestScope.updateSuccess}"/></p>
                    </c:if>
            </table> 
        </div>
    </body>
</html>
