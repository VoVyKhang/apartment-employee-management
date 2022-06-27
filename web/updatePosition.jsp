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
                transform: scale(0.99);
                opacity: 0.9
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Update Position</h5>
                </div>

                <div>
                    <div>
                        <p style="margin: 16px 16px 0 16px">Position is being updated: <c:out value="${sessionScope.posName}"/></p>
                </div>

                <div class="modal-body">
                    <form action="mainController" method="POST" class="form-position">

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

                            <input class="btn btn-primary" type="submit" name="action" value="updatePosition"/> 
                        </div>
                        <c:if test="${requestScope.updateSuccess != null}">
                            <c:out value="${requestScope.updateSuccess}"/>
                        </c:if>
                    </form>
                </div>
            </div>

    </body>
</html>
