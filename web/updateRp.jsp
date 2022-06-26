<%-- 
    Document   : AssignRewardPenalty
    Created on : Jun 7, 2022, 1:00:40 PM
    Author     : Admin
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

        <%@include file="header.jsp" %>
        <c:import url="sidebar.jsp"></c:import> 
        <div style="margin: 0 32px" class="list-employee">
             <h1>Update Reward - Penalty </h1>
        <form action="mainController" method="post">
            <p>ID Employee is being updated:  ${sessionScope.id}</p>
            <p>Name is being updated: ${sessionScope.name} </p>
            <p>
                <select name="idReg" >
                    <c:forEach var="list" items="${requestScope.list}">
                        <option value="${list.idReg}"  <c:if test="${sessionScope.idReg == list.idReg}" > selected="${list.name}" </c:if>>
                            ${list.name}
                        </option>
                    </c:forEach>  
                </select>
            </p>
            <p><textarea rows="4" cols="40" name="reasonrp" form="usrform"> Enter reason here...</textarea></p>
            <p>Time <input type="number" pattern="[0-9\/]*" name="timerp" min="2" max="100" required/></br></p>          
            <p>
                <input type="hidden" value="${sessionScope.id}" name="idemp">
                <input type="hidden" name="action" value="UpdateRp"> 
                <input type="submit" value="Update"> 
            </p>
            <c:if test="${requestScope.updateSuccess != null}">
                <c:out value="${requestScope.updateSuccess}"/>
            </c:if>
        </form>
        </div>
    </body>
</html>
