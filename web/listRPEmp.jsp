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
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            #sidebar{
                height: 100vh
            }

            .breadcrumb{
                background-color: #f7f7f7 !important;
                margin-left: -14px
            }

            .page-title{
                text-align: initial !important;
                margin-left: 16px !important;
                margin-top: 8px
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="headerEmp.jsp" %>
        </header>
        <c:if test="${sessionScope.USER_LOGGIN eq null}">
            <c:redirect url="Hall.jsp"/>
        </c:if>
        <c:import url="sidebarEmp.jsp"></c:import>
            <div style="margin: 0 16px; width: 100%">
                <div class="page-header">
                    <div class="row">
                        <h3 class="page-title">Reward and penalty</h3>
                        <div class="col-sm-12 list-employee__actions">                       
                            <div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="EmployeeHome.jsp">Home</a></li>
                                    <li class="breadcrumb-item">Account</li>
                                    <li class="breadcrumb-item active">Reward and penalty</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Times</th>
                            <th>Date</th>
                            <th>Reason </th>
                        </tr>
                    </thead>
                    <tbody id="listRp">
                    <c:forEach var="listRpEmp" varStatus="counter" items="${requestScope.listRpEmp}">
                        <tr>
                            <td><c:choose>
                                    <c:when test="${listRpEmp.status eq  1}">Reward</c:when>
                                    <c:otherwise>Penalty</c:otherwise>
                                </c:choose></td>
                            <td>${listRpEmp.namere}</td> 
                            <td>${listRpEmp.times}</td>
                            <td>${listRpEmp.applicableDate}</td>
                            <td>${listRpEmp.reason}</td> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table> 
        </div>
    </body>
</html>
