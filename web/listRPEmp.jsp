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
        <title>Reward And Penalty</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            .title{
                margin-top: 14px
            }

            .btn-primary{
                margin-top: 44px
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:import url="sidebarEmp.jsp"></c:import>
            <table  class="table table-striped">
                <thead>
                    <tr>
                        <th>Image </th>
                        <th>Name </th>
                        <th>Gender </th>
                        <th>Type </th>
                        <th>Times</th>
                        <th>Date</th>
                        <th>Name</th>
                        <th>Reason </th>
                        <th>Department </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="listRpEmp" varStatus="counter" items="${requestScope.listRpEmp}">
                    <tr>
                        <td>
                            <img class="align-self-center img-fluid" src='images/${listRpEmp.imgPath}' width="120"
                                 height="120">
                        </td>
                        <td>${listRpEmp.name}</td>
                        <td>${listRpEmp.gender}</td>
                        <td><c:choose>
                                <c:when test="${listRpEmp.status eq  1}">Reward</c:when>
                                <c:otherwise>Penalty</c:otherwise>
                            </c:choose></td>
                        <td>${listRpEmp.times}</td>
                        <td>${listRpEmp.applicableDate}</td>
                        <td>${listRpEmp.namere}</td> 
                        <td>${listRpEmp.reason}</td> 
                        <td>${listRpEmp.depName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> 
    </div>
</body>
</html>
