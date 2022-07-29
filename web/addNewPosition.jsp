<%-- 
    Document   : addNewPosition
    Created on : Jul 22, 2022, 10:55:41 PM
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
        <c:if test="${sessionScope.USER_LOGGIN eq null}">
            <c:redirect url="Hall.jsp"/>
        </c:if>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 
        <p style="color: red" >${allField}</p>
        <div class="modal-body">
            <form action="mainController" method="POST" class="form-position">
                Position name
                <input name="posName" >
                <p style="color: red" >${messPosName}</p>
                <p style="color: red" >${duplicateName}</p>
                Description
                <input name="posDes">
                <p style="color: red" >${messDes}</p>
                Creator
                <input name="creator" value="${sessionScope.USER_LOGGIN.name}" readonly="">
                <input type="hidden" name="action" value="addNewPosition">
                <input type="submit" value="Create">
            </form>
        </div>
    </body>
</html>
