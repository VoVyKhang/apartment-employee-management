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
        <style>
            .certificate-select{

                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                width: 100%;
                height: 42px
            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <c:import url="sidebar.jsp"></c:import>     

            <form action="mainController" method="get" class="form-position" style="margin: 0 32px; width: 100%">
                <p>ID Employee:  ${sessionScope.id}</p>
            <p>Name: ${sessionScope.name} </p>
            <div class="form-group">
                <div style="margin-bottom: 8px">Type</div>
                <select name="typerp" class="certificate-select">
                    <option value="1">Penalty</option>
                    <option value="0">Reward</option>
                </select>
            </div>

            <div class="form-group">
                <div style="margin-bottom: 8px">
                    Reason
                </div>
                <textarea class="certificate-select" name="reasonrp" placeholder="Late" required></textarea>
            </div>

            <%Date d = new Date();%>
            <div class="form-group">
                <div style="margin-bottom: 8px">
                    Date Create 
                </div>
                <input class="form-control"  type="text" name="daterp" value="<%=d%>" readonly=""/>
            </div>
            <div class="form-group">
                <div style="margin-bottom: 8px">
                    Time
                </div> 
                <input class="form-control" type="number" name="timerp" value="1" required/>
            </div>

            <div class="form-group">
                <input  type="hidden" value="${sessionScope.id}" name="idEmp">
                <input class="btn btn-secondary btn-sm" type="submit" name="action" value="CreateNewRp"> 
                <input class="btn btn-secondary btn-sm" type="reset" value="Reset"/>
            </div>
            <c:if test="${requestScope.updateSuccess != null}">
                <c:out value="${requestScope.updateSuccess}"/>
            </c:if>
        </form>
    </body>
</html>
