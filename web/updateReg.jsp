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
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 









            <form action="mainController" method="POST" class="form-position" style="margin: 0 32px; width: 100%">
                <p>Regulation is being updated: ${requestScope.nameReg}</p>
            <div class="form-group">
                <label for="formGroupExampleInput">Regulation Name</label>
                <input type="text" class="form-control" id="formGroupExampleInput" name="regName" value="${requestScope.nameReg}" placeholder="Example input">
                <p style="color:red">${sessionScope.WARNING}</p>
            </div>
            <div class="form-group">
                <c:choose>
                    <c:when test="${requestScope.typeReg eq 0}">
                        Regulation Type: <select name="regType">
                            <option value="0" selected>Penalty</option>
                            <option value="1">Reward</option>
                        </select></br>
                    </c:when>
                    <c:otherwise>
                        Regulation Type: <select name="regType">
                            <option value="0" >Penalty</option>
                            <option value="1"selected>Reward</option>
                        </select></br>
                    </c:otherwise>
                </c:choose>           </div>

            <div class="form-position__btn">
                <input class="btn btn-secondary btn-sm" type="hidden" name="idReg" value="${requestScope.idReg}"/>
                <input class="btn btn-secondary btn-sm" type="submit" name="action" value="Update Regulation"/>
                <a class="btn btn-secondary btn-sm" href="mainController?action=showlist&type=reg">Back</a>
            </div>

        </form>
    </body>
</html>
