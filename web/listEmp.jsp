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
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="list__employee">

                <h3 class="list__employee-title">Employee</h3>
                <a class="list__employee-link add-btn" href="createNewEmp.jsp">
                    <i class="ri-add-fill list__employee-icon"></i>
                    Add Employee
                </a>
                <div> <p style="color: green">${requestScope.COMPLETED}</p></div>

            <c:if test="${requestScope.listEmp != null}">
                <c:if test="${not empty requestScope.listEmp}">
                    <table class="table table-striped list__employee-table">
                        <thead>
                            <tr class="list__employee-header">
                                <th scope="col">EmployeeID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Department</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Reward - Penalty</th>
                                <th scope="col">Employee Records</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listEmp" varStatus="counter" items="${requestScope.listEmp}">
                            <form action="mainController">
                                <tr class="list__employee-body">
                                    <td scope="row">${listEmp.idEmp}</td>     
                                    <td class="list__employee-item">
                                        <span>
                                            <img class="list__employee-item-img" src='images/${listEmp.imgPath}'>
                                        </span>
                                        <div class="list__employee-description">
                                            <span class="list__employee-description-name">${listEmp.name}</span>                   
                                            <span class="list__employee-description-pos">${listEmp.posName}</span>
                                        </div>
                                    </td>

                                    <td>${listEmp.gender}</td>
                                    <td>${listEmp.dob}</td>
                                    <td>${listEmp.depName}</td>

                                    <td>
                                        <a href="mainController?action=passidemp&empid=${listEmp.idEmp}&type=update"><i class="fas fa-edit"></i></a>
                                    </td>

                                    <td>
<<<<<<< HEAD
                                        <form action="mainController" method="POST">
                                            <input type="hidden" value="${listEmp.idEmp}" name="idemp">
                                            <input type="hidden" value="${listEmp.name}" name="nameemp">
                                            <input type="hidden" name="updatetype" value="createnewrp">
                                            <input type="hidden" name="action" value="pushss" >
                                            <input type="submit" value="CreateNewRp">
                                        </form>
=======
                                        <c:url var="delete" value="mainController">
                                            <c:param name="action" value="Delete"> </c:param>

                                            <c:param name="id" value="${listEmp.idEmp}"> </c:param>
                                        </c:url>
                                        <a href="${delete}"><i class="fas fa-trash-alt"></i></a>

                                    </td>
                                    <td>
                                        <c:url var="create" value="mainController">
                                            <c:param name="action" value="pushss"> </c:param>
                                            <c:param name="idemp" value="${listEmp.idEmp}"> </c:param>
                                            <c:param name="updatetype" value="createnewrp"> </c:param>
                                            <c:param name="nameemp" value="${listEmp.name}"> </c:param>
                                        </c:url>
                                        <a href="${create}"><i class="fas fa-trash-alt"></i></i></a>
>>>>>>> 302352fc3dfb37b5793701a54b6ac104bba01822
                                    </td>

                                    <td>
                                        <a href="mainController?action=passidemp&empid=${listEmp.idEmp}&type=detail">
                                        <i class="fas fa-address-card"></i></a>
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
