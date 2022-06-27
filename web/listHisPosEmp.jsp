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
        <c:import url="sidebarEmp.jsp"></c:import> 
        
        <div style="margin: 0 32px; width: 100%">
        <c:if test="${requestScope.listHisPos != null}">
            <c:if test="${not empty requestScope.listHisPos}">
                    <table class="table table-striped">
                        <thead >
                            <tr style="text-align: center">
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
