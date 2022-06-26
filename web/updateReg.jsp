<%-- 
    Document   : updateReg
    Created on : Jun 7, 2022, 1:46:58 AM
    Author     : VyNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Regulation Page</title>
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

            <div class="modal-content" style="margin: 0 8px">

                <div class="modal-header">
                    <h5 class="modal-title">Update Regulation</h5>
                </div>

                <div>
                    <div>
                        <p style="margin: 16px 16px 0 16px">Regulation is being updated: ${requestScope.nameReg}</p>
                </div>
            </div>

            <div class="modal-body">
                <form action="mainController" method="POST" class="form-position">

                    <div class="form-group">
                        <label for="formGroupExampleInput">Regulation Name</label>
                        <input type="text" class="form-control" id="formGroupExampleInput" name="regName" value="${requestScope.nameReg}" placeholder="Example input">
                        <p style="color:red">${sessionScope.WARNING}</p>
                    </div>
                    <div class="form-group">
                        <c:choose>
                            <c:when test="${requestScope.typeReg eq 0}">
                                <div class="form-group">
                                    <label>
                                        Type
                                    </label> 
                                    <select name="regType" class="form-control">
                                    <option value="0" selected>Penalty</option>
                                    <option value="1">Reward</option>
                                </select>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="form-group">
                                    <div>Type</div>
                                    <select name="regType" class="form-control">
                                        <option value="0" >Penalty</option>
                                        <option value="1"selected>Reward</option>
                                    </select>
                                </div>
                            </c:otherwise>
                        </c:choose>           
                    </div>

                    <div class="form-position__btn">
                        <input type="hidden" name="idReg" value="${requestScope.idReg}"/>
                        <input class="btn btn-primary" type="submit" name="action" value="Update Regulation"/>
                        
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
