<%-- 
    Document   : listDep
    Created on : May 29, 2022, 8:06:05 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Department</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>


        <div>
            <c:if test="${requestScope.listDep != null}">
                <c:if test="${not empty requestScope.listDep}">
                    <div style="margin: 0 32px" class="list-dep">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">DepNum</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">Date Create</th>
                                    <th scope="col">Creator</th>
                                    <th scope="col">Update</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="listDep" varStatus="counter" items="${requestScope.listDep}">
                                <form action="mainController">
                                    <tr>


                                        <td>${listDep.depNum}</td>                            
                                        <td>${listDep.depName}</td>
                                        <td>${listDep.description}</td>
                                        <td class="location">${listDep.location}</td>
                                        <td>${listDep.dateCreate}</td>
                                        <td>${listDep.creator}</td>

                                        <td>
                                            <a href="mainController?action=passiddep&iddep=${listDep.depNum}"><i class="fas fa-edit"></i></a>

                                        </td>

                                        <td>
                                            <c:url var="delete" value="mainController">
                                                <c:param name="action" value="Delete"> </c:param>

                                                <c:param name="id" value="${listDep.depNum}"> </c:param>
                                            </c:url>
                                            <a href="${delete}"><i class="fas fa-trash-alt"></i></a>

                                        </td>

                                    </tr>
                                </form> 

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </c:if>
            <div class="dep-btn">
                <p style="color:green">${requestScope.WARNING}<p>
                    <a href="createNewDep.jsp">Create New Department</a>

                    <a href="mainController?action=showlist&type=changedep">Change Department</a>
            </div>
        </div>
    </body>
</html>
