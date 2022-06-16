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
                            <th scope="col">Description</th>
                            <th scope="col">Delivery Date</th>
                            <th scope="col">Old Department</th>
                            <th scope="col">New Department</th>
                            <th scope="col">Name Of Employee</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listHisDep" varStatus="counter" items="${requestScope.listHisDep}">    
                            <tr style="text-align: center">


                                <td>${listHisDep.idHis}</td>                            
                                <td>${listHisDep.des}</td>
                                <td>${listHisDep.deliveryDate}</td>
                                <td>${listHisDep.oldDep}</td>
                                <td>${listHisDep.newDep}</td>
                                <td>${listHisDep.nameEmp}</td>

                            </tr>                        
                        </c:forEach>
                    </tbody>
                </table>
                </div>
            </c:if>
        </c:if>
    </body>
</html>
