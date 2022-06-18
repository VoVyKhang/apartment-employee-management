<%-- 
    Document   : historyChange
    Created on : Jun 5, 2022, 10:28:38 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Change Department</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

        <c:if test="${requestScope.listHisDep != null}">
            <c:if test="${not empty requestScope.listHisDep}">
                <div style="margin: 0 32px; width: 100%">
                    <table class="table table-striped">
                        <thead >
                            <tr style="text-align: center">
                                <th scope="col">ID History</th>
                                <th scope="col">Employee</th>
                                <th scope="col">Department</th>
                                <th scope="col">Delivery Date</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listHisDep" varStatus="counter" items="${requestScope.listHisDep}">    
                                <tr style="text-align: center">


                                    <td>${listHisDep.idHidDep}</td>                            
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
        </c:if>
    </body>
</html>
