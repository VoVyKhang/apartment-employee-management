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


        <div style="width: 100%">
                <form action="mainController" method="post" style="margin: 0 32px" class="form-position">
                    <p>ID Employee is being updated:  ${sessionScope.id}</p>
                <p>Name is being updated: ${sessionScope.name} </p>
                <div>
                    <div style="margin-bottom: 8px">
                        Type
                    </div>
                    <select name="typerp" class="certificate-select">
                        <option value="1">Penalty</option>
                        <option value="0">Reward</option>
                    </select>
                </div>

                <div>
                    <div style="margin-bottom: 8px">Reason</div>

                    <textarea class="certificate-select" name="reasonrp" placeholder="Late" required></textarea>

                </div>

                <div>
                    <div style="margin-bottom: 8px">Time</div> 
                    <input style="margin-bottom: 16px" class="certificate-select" type="number" name="timerp" min="2" max="100" required/>
                </div>
                <div>
                    <input type="hidden" value="${sessionScope.id}" name="idemp">
                    <input class="btn btn-secondary btn-sm" type="submit" name="action" value="UpdateRp"> 
                    <input class="btn btn-secondary btn-sm" type="reset" value="Reset"/>
                </div>
                <c:if test="${requestScope.updateSuccess != null}">
                    <c:out value="${requestScope.updateSuccess}"/>
                </c:if>
            </form>
        </div>
    </body>
</html>
