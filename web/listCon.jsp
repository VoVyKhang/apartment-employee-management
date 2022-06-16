<%-- 
    Document   : listContract
    Created on : Jun 6, 2022, 8:32:17 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <title>List Contract</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <div style="width: 100%">
                <div>
                    <p style="color:green">${requestScope.COMPLETE}</p>
                <a href="createNewCon.jsp">Create New Contract</a>
            </div>
            <c:if test="${requestScope.listCon != null}">
                <c:if test="${not empty requestScope.listCon}">
                    <div style="margin: 0 32px">
                        <table  class="table table-striped" >
                        <thead>
                            <tr>
                                <th scope="col">ID Contract</th>
                                <th scope="col">Type</th>
                                <th scope="col">Sign Day</th>
                                <th scope="col">Expires Day</th>
                                <th scope="col">Name of Employee</th>
                                <th scope="col">Status</th>
                                <th scope="col">Update</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <c:forEach var="listCon" varStatus="counter" items="${requestScope.listCon}">
                            <form action="mainController">
                                <tr>
                                    <td scope="row">${listCon.idCon}</td>
                                    <td>${listCon.typeCon}</td>
                                    <td>${listCon.signDay}</td>
                                    <td>${listCon.expDay}</td>
                                    <td>${listCon.nameEmp}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${listCon.status eq 0}">
                                                <p style="color:red">Expired</p>
                                                <a href="mainController?action=passidcon&idcon=${listCon.idCon}&flag=renewal">Renewal</a>
                                            </c:when>
                                            <c:otherwise>
                                                <p style="color:green">OK</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td><a href="mainController?action=passidcon&idcon=${listCon.idCon}&flag=update"><i class="fas fa-edit"></i></a></td>
                                </tr>
                            </form> 
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
