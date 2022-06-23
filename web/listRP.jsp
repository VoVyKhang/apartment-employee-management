<%-- 
    Document   : rewardpenalty
    Created on : May 31, 2022, 1:34:28 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="management.dto.RewardPenaltyDTO"%>
<%@page import="management.dao.RewardPenaltyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
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
        <div style="margin: 0 32px" class="list-employee">
            <form action="mainController" method="post" class="form-reward-penalty">
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-floating mb-3 mt-3">
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchIdemp") == null) ? "" : request.getParameter("txtSearchIdemp")%>" placeholder="Enter email" name="txtSearchIdemp">
                            <label for="ID">Employee ID</label>
                        </div>
                    </div>  
                    <div class="col-sm-6 col-md-3">
                        <div class="form-floating mb-3 mt-3">
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>" placeholder="Enter email" name="txtSearchName">
                            <label for="name">Employee Name</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3"> 
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
                    <div class="col-sm-6 col-md-3 ">
                        <input type="submit" value="Search"  class="btn btn-secondary btn-sm">
                        <input type="hidden" name="action" value="searchRP"/>
                    </div>
                </div>  
            </form>               
            <h5>${requestScope.SearchRS}</h5>
            <table  class="table table-striped">
                <thead>
                    <tr>
                        <th >ID </th>
                        <th >ID Employee </th>
                        <th>Image </th>
                        <th>Name </th>
                        <th>Gender </th>
                        <th>Type </th>
                        <th>Times</th>
                        <th>Date</th>
                        <th>Name</th>
                        <th>Reason </th>
                        <th>Deparment </th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="listrp" varStatus="counter" items="${requestScope.listrp}">
                    <form action="mainController">
                        <tr>
                            <td>${listrp.idRP}</td>
                            <td>${listrp.idEmp}</td> 
                            <td>
                                <img class="align-self-center img-fluid" src='images/${listrp.imgPath}' width="120"
                                     height="120">
                            </td>
                            <td>${listrp.name}</td>
                            <td>${listrp.gender}</td>
                            <td><c:choose>
                                    <c:when test="${listrp.status eq  1}">Reward</c:when>
                                    <c:otherwise>Penalty</c:otherwise>
                                </c:choose></td>
                            <td>${listrp.times}</td>
                            <td>${listrp.applicableDate}</td>
                            <td>${listrp.namere}</td> 
                            <td>${listrp.reason}</td> 
                            <td>${listrp.depName}</td>
                            <td>
                                <c:url var="update" value="mainController">
                                    <c:param name="action" value="pushss"> </c:param>
                                    <c:param name="updatetype" value="updaterp"> </c:param>
                                    <c:param name="idreg" value="${listrp.idReg}"> </c:param>
                                    <c:param name="nameemp" value="${listrp.name}"> </c:param>
                                    <c:param name="idemp" value="${listrp.idEmp}"> </c:param>
                                </c:url>
                                <a href="${update}"><i class="fas fa-trash-alt"></i></i></a>
                            </td>
                            <td>
                                <c:url var="delete" value="mainController">
                                    <c:param name="action" value="DeleteRp"> </c:param>
                                    <c:param name="idemp" value="${listrp.idEmp}"> </c:param>
                                </c:url>
                                <a href="${delete}"><i class="fas fa-trash-alt"></i></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <c:if test="${requestScope.updateSuccess != null}">
                        <c:out value="${requestScope.updateSuccess}"/>
                    </c:if>
            </table> 
        </div>
    </body>
</html>
