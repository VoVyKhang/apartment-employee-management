<%-- 
    Document   : ListPosition
    Created on : Jun 1, 2022, 12:18:29 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <c:if test="${requestScope.listPosition != null}">

            <div style="margin: 0 32px; width: 100%">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Position name</th>                           
                            <th scope="col">Description</th>                                                  
                            <th scope="col">Creator</th>
                            <th scope="col">Date Create</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <a href="mainController?action=promoteAndDemote">Promote/demote</a>
                    <c:forEach var="listPosition" items="${requestScope.listPosition}">
                        <tr>
                            <td>${listPosition.posName}</td>                            
                            <td>${listPosition.description}</td>
                            <td>${listPosition.creator}</td>
                            <td>${listPosition.dateCreated}</td>                          
                            <td>  
                                <a href="mainController?action=ssPosition&&idPos=<c:out value="${listPosition.idPos}"/>&&posName=<c:out value="${listPosition.posName}"/>"><i class="fas fa-edit"></i></a>
                            </td>
                            <td>
                                <c:url var="delete" value="mainController">
                                    <c:param name="action" value="Delete"> </c:param>
                                    <c:param name="id" value="${listDep.depNum}"> </c:param>
                                </c:url>
                                <a href="${delete}"><i class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>                           
                    </c:forEach>
                    </tbody>
                </table>       
            </div>
        </c:if>
    </body>
</html>
