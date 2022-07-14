<%-- 
    Document   : historyChange
    Created on : Jun 5, 2022, 10:28:38 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <title>History Change Department</title>
        <style>
            .btn-primary{
                background-color: #01a3ed !important;
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                min-width: 150px;
                padding: 10px 20px;
                margin-top: 46px
            }
        </style>
    </head>
    <body>
        <c:import url="headerEmp.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import> 

        <c:if test="${requestScope.listHisDep != null}">
            <table class="table table-striped">
                <thead >
                    <tr style="text-align: center">
                        <th scope="col">Employee</th>
                        <th scope="col">Department</th>
                        <th scope="col">Delivery Date</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="listHisDep" varStatus="counter" items="${requestScope.listHisDep}">    
                        <tr style="text-align: center">
                            <td>${listHisDep.nameEmp}</td>
                            <td>${listHisDep.nameDep}</td>
                            <td>${listHisDep.deliveryDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${listHisDep.status eq 1}">
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
</body>
</html>
