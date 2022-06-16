<%-- 
    Document   : PromoteAndDemotePosition
    Created on : Jun 1, 2022, 5:39:09 PM
    Author     : AD
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

            <div>
                <div>
                    <a href="mainController?action=hisPromoteAndDemote" >History of promotion and demotion</a>
                </div>


            <c:if test="${requestScope.listEmp != null}">
                <c:if test="${not empty requestScope.listEmp}">

                    <div style="margin: 0 16px" >
                        <table class="table table-striped list-position" >
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">DOB</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Current Positon</th>
                                    <th scope="col">Reason</th>
                                    <th scope="col">New Position</th>
                                    <th scope="col">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="listEmp" varStatus="counter" items="${requestScope.listEmp}">
                                <form action="mainController">
                                    <tr>
                                        <td scope="row">${listEmp.idEmp}</td>     
                                        <td>
                                            <img class="align-self-center img-fluid" src='${listEmp.imgPath}' width="120"
                                                 height="120">
                                        </td>
                                        <td>${listEmp.name}</td>
                                        <td>${listEmp.gender}</td>
                                        <td>${listEmp.dob}</td>
                                        <td>${listEmp.depName}</td>                               
                                        <td>${listEmp.posName}</td>

                                        <td> <input name="reasonPosition"> </td>


                                        <td>
                                            <select name="idPos">
                                                <option value="1">Manager</option>
                                                <option value="2">Deputy</option>
                                                <option value="3">Employee</option>
                                            </select>
                                        </td>

                                        <td> 

                                            <input value="${listEmp.posName}" type="hidden" name="oldPosName">


                                            <input value="${listEmp.idEmp}" type="hidden" name="idEmp"> 
                                            <input class="btn btn-secondary btn-sm"  type="submit" name="action" value="SavePosition">                                                                                                        
                                        </td>
                                    </tr>
                                </form> 
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </c:if>
            </c:if>
            <c:if test="${requestScope.updateSuccess != null}">
                <c:out value="${requestScope.updateSuccess}"/>
            </c:if>
        </div>
    </body>

</html>



