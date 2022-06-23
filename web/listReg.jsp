<%-- 
    Document   : listReg
    Created on : May 29, 2022, 8:06:32 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Regulation</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div style="margin: 0 32px" class="list-regulation">
            <c:if test="${requestScope.listReg != null}">
                <c:if test="${not empty requestScope.listReg}">
                    <form action="mainController" method="POST" class="form-position">
                        <div class="form-group">
                            <div style="margin-bottom: 8px">
                                Type 
                            </div>
                            <select name="regType" class="form-control" style="width: 20%">
                                <option value="2" selected>All</option>
                                <option value="1">Reward</option>
                                <option value="0">Penalty</option>
                            </select>
                        </div>
                        <div style="margin-top: -6px; margin-bottom: 16px">
                            <input class="btn btn-primary btn-sm" type="submit" value="Filter"/>
                            <input type="hidden" name="action" value="filterReg"/>
                        </div>
                    </form>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">id Regulation</th>
                                <th scope="col">Name</th>
                                <th scope="col">Type</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                        <a href="mainController?action=addReg">ADD</a>
                        <c:if test="${requestScope.message ne ''}">
                            <c:out value="${requestScope.message}"/>
                        </c:if>
                        <c:forEach var="listReg" varStatus="counter" items="${requestScope.listReg}">
                            <form action="mainController">
                                <tr>


                                    <td scope="row">${listReg.idReg}</td>                            
                                    <td>${listReg.name}</td>

                                    <c:choose>
                                        <c:when test="${listReg.status eq 0}">
                                            <td>Penalty</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Reward</td>
                                        </c:otherwise>
                                    </c:choose>


                                    <td>
                                        <c:url var="update" value="mainController">
                                            <c:param name="action" value="UpdateReg"> </c:param>

                                            <c:param name="idRegUpdate" value="${listReg.idReg}"> </c:param>
                                            <c:param name="nameRegUpdate" value="${listReg.name}"> </c:param>
                                            <c:param name="statusRegUpdate" value="${listReg.status}"> </c:param>

                                        </c:url>
                                        <a href="${update}"><i class="fas fa-edit"></i></a>

                                    </td>

                                    <td>
                                        <c:url var="delete" value="mainController">
                                            <c:param name="action" value="Delete"> </c:param>

                                            <c:param name="id" value="${listReg.idReg}"> </c:param>
                                        </c:url>
                                        <a href="${delete}"><i class="fas fa-trash-alt"></i></a>

                                    </td>

                                </tr>
                            </form> 

                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
