<%-- 
    Document   : listEmp
    Created on : May 29, 2022, 8:06:21 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div style="margin: 0 32px" class="list-employee">
                <a href="createNewEmp.jsp">Create New Employee</a>
            <c:if test="${requestScope.listEmp != null}">
                <c:if test="${not empty requestScope.listEmp}">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Department</th>
                                <th scope="col">Position</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                                <th scope="col">Assign RP</th>
                                <th scope="col">Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listEmp" varStatus="counter" items="${requestScope.listEmp}">
                            <form action="mainController">
                                <tr>


                                    <td scope="row">${listEmp.idEmp}</td>     
                                    <td>
                                        <img class="align-self-center img-fluid" src='images/${listEmp.imgPath}' style="width: 100px; height: 100px">
                                    </td>

                                    <td>${listEmp.name}</td>
                                    <td>${listEmp.gender}</td>
                                    <td>${listEmp.dob}</td>
                                    <td>${listEmp.depName}</td>
                                    <td>${listEmp.posName}</td>

                                    <td>
                                        <c:url var="update" value="mainController">
                                            <c:param name="action" value="Update"> </c:param>

                                            <c:param name="id" value="${listEmp.idEmp}"> </c:param>
                                        </c:url>
                                        <a href="${update}"><i class="fas fa-edit"></i></a>

                                    </td>

                                    <td>
                                        <c:url var="delete" value="mainController">
                                            <c:param name="action" value="Delete"> </c:param>

                                            <c:param name="id" value="${listEmp.idEmp}"> </c:param>
                                        </c:url>
                                        <a href="${delete}"><i class="fas fa-trash-alt"></i></a>

                                    </td>
                                    <td>
                                        <form action="mainController" method="POST">
                                            <input type="hidden" value="${listEmp.idEmp}" name="idemp">
                                            <input type="hidden" value="${listEmp.name}" name="nameemp">
                                            <input type="hidden" name="updatetype" value="createnewrp">
                                            <input type="hidden" name="action" value="pushss" >
                                            <input type="submit" class="btn btn-secondary btn-sm" value="CreateNewRp">
                                        </form>
                                    </td>

                                    <td>
                                        <a href="mainController?action=passidemp&empid=${listEmp.idEmp}"><i class="fas fa-address-card"></i></a>
                                    </td>

                                </tr>
                            </form> 
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
