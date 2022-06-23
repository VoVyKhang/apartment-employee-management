<%-- 
    Document   : createNewRp
    Created on : Jun 11, 2022, 3:12:04 PM
    Author     : Admin
--%>

<%@page import="management.dto.EmployeeDTO"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    </head>
       <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:import url="sidebar.jsp"></c:import>
        <div style="margin: 0 32px" class="list-employee">
            <h1>Create Reward - Penalty </h1>
        <form action="mainController" method="post">
            <p>ID Employee:  ${sessionScope.id}</p>
            <p>Name: ${sessionScope.name} </p>
            <p>Reason: 
                <select name="idReg" >
                    <c:forEach var="list" items="${requestScope.list}">
                        <option value="${list.idReg}"  <c:if test="${sessionScope.idReg == list.idReg}" > selected="${list.name}" </c:if>>
                            ${list.name}
                        </option>
                    </c:forEach>  
                </select>
            </p>
            <%Date d = new Date();%>
            <p>Date Create <input type="text" name="daterp" value="<%=d%>" readonly=""/></p>
            <p><textarea rows="4" cols="40" name="reasonrp" form="usrform"> Enter reason here...</textarea></p>
            <p>Time <input type="number" name="timerp" value="1" readonly=""/></p>
            <p>
                <input type="hidden" value="${sessionScope.id}" name="idemp">
                <input type="submit" name="action" value="CreateNewRp"> 
            </p>
            <c:if test="${requestScope.updateSuccess != null}">
                <c:out value="${requestScope.updateSuccess}"/>
            </c:if>
        </form>
        </div>
            </body>
</html>
