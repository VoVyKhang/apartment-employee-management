<%-- 
    Document   : updatePosition.jsp
    Created on : Jun 1, 2022, 1:00:36 PM
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


            <form action="mainController" method="POST" class="form-position" style="margin: 0 32px; width: 100%">
                <p>Position is being updated: <c:out value="${sessionScope.posName}"/> </p>
            <div class="form-group">
                <label for="formGroupExampleInput"> Position name</label>
                <input type="text" class="form-control" id="formGroupExampleInput" name="posName" placeholder="Example input">
                <p style="color:red">${requestScope.messName}</p>
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">Description</label>
                <input type="text" name="posDescription" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
                <p style="color:red">${requestScope.messDes}</p>
            </div>

            <div class="form-position__btn">

                <input class="btn btn-secondary btn-sm" type="submit" name="action" value="updatePosition"/> 
                <input class="btn btn-secondary btn-sm" type="reset" value="Reset"/>
            </div>
            <c:if test="${requestScope.updateSuccess != null}">
                <c:out value="${requestScope.updateSuccess}"/>
            </c:if>
        </form>
    </body>
</html>
