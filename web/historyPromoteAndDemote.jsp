<%-- 
    Document   : historyPromoteAndDemote
    Created on : Jun 6, 2022, 3:32:01 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Promote and demote</title>
    </head>
    <body>
        
            <c:import url="header.jsp"></c:import>
            <c:import url="sidebar.jsp"></c:import>
       
        
           
            <div style="margin: 0 16px; width: 100%">
                <c:if test="${requestScope.listHistoryPosition != null}">
            
                <table class="table table-striped list-position">
                    <thead>
                        <tr>
                            <th scope="col">ID </th>
                            <th scope="col">Description</th>
                            <th scope="col">Delivery Date</th>
                            <th scope="col">Old Position</th>
                            <th scope="col">New Position</th>
                            <th scope="col">Name Of Employee</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listHistoryPosition" items="${requestScope.listHistoryPosition}">    
                            <tr>
                                <td scope="row">${listHistoryPosition.idHis}</td>                            
                                <td>${listHistoryPosition.des}</td>
                                <td>${listHistoryPosition.deliveryDate}</td>
                                <td>${listHistoryPosition.oldDep}</td>
                                <td>${listHistoryPosition.newDep}</td>
                                <td>${listHistoryPosition.nameEmp}</td>
                            </tr>                        
                        </c:forEach>
                    </tbody>
                </table>
            
        </c:if>
            </div>
    </body>
</html>
