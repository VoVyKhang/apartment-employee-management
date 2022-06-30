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
        <title>Update Reward - Penalty</title>
        <style>
            .btn-primary{
                background: linear-gradient(to right, #00c0f9, #0255cd);
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                padding: 5px 10px;
                margin-top: 16px;
                width: 100%
            }
            
            .btn-primary:hover{
                transform: scale(0.9);
                opacity: 0.9
            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <c:import url="sidebar.jsp"></c:import> 
            <div style="margin: 0 8px" class="list-employee modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update Reward - Penalty</h5>
                </div>
                <div>
                    <div>
                        <p style="margin: 16px 16px 0 16px">ID Employee is being updated:  ${sessionScope.id}</p>
                    <p style="margin: 16px 16px 0 16px">Name is being updated: ${sessionScope.name}</p>
                </div>
            </div>
            <div class="modal-body">
                <form action="mainController" method="post">       
                    <div class="form-group">
                        <label>Reason</label>
                        <select name="idReg" class="form-control">
                            <c:forEach var="list" items="${requestScope.list}">
                                <option value="${list.idReg}"  <c:if test="${sessionScope.idReg == list.idReg}" > selected="${list.name}" </c:if>>
                                    ${list.name}
                                </option>
                            </c:forEach>  
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" rows="4" cols="40" name="reasonrp" placeholder="Enter description here..."></textarea>
                    </div>
                    <div class="form-group">
                        <label>Time</label> 
                        <input class="form-control" type="number" pattern="[0-9\/]*" name="timerp" min="1" max="10" required/>
                    </div>          
                    <div>
                        <input type="hidden" value="${sessionScope.id}" name="idemp">
                        <input type="hidden" name="action" value="UpdateRp"> 
                        <input class="btn btn-primary" type="submit" value="Update"> 
                    </div>
                    <c:if test="${requestScope.updateSuccess != null}">
                        <c:out value="${requestScope.updateSuccess}"/>
                    </c:if>
                </form>
            </div>
        </div>
    </body>
</html>
