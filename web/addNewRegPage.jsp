<%-- 
    Document   : addNewRegPage.jsp
    Created on : Jun 7, 2022, 3:55:47 AM
    Author     : VyNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Regulation Page</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 



            <form action="mainController" method="POST" class="form-position" style="margin: 0 32px; width: 100%">
                <p>Regulation is being created by: ${sessionScope.USER_LOGGIN.name}</p>
            <div class="form-group">
                <label for="formGroupExampleInput">Regulation Name</label>
                <input type="text" class="form-control" id="formGroupExampleInput" name="regName" placeholder="Example input">
                <p style="color:red">${sessionScope.WARNING}</p>
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">Regulation Type</label>
                <select name="regType">
                    <option value="0" selected>Penalty</option>
                    <option value="1">Reward</option>
                </select>            </div>

            <div class="form-position__btn">
                <input class="btn btn-secondary btn-sm" type="submit" name="action" value="Create Regulation"/>
                <input class="btn btn-secondary btn-sm" type="reset" value="Reset"/>
                <a class="btn btn-secondary btn-sm" href="mainController?action=showlist&type=reg">Back</a>
            </div>

        </form>


    </body>
</html>
