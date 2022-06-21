<%-- 
    Document   : listDependent
    Created on : Jun 12, 2022, 8:26:09 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dependent</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>


        <c:if test="${requestScope.updateFail != null}" >
            <c:out value="${requestScope.updateFail}" />
        </c:if>
        <c:if test="${requestScope.listDependent != null}">

            <div style="margin: 0 32px; width: 100%">
                <c:if test="${requestScope.updateSuccess != null}" >
                    <h3 style="color: green" ><c:out value="${requestScope.updateSuccess}" /></h3>
                </c:if>
                    <a href="mainController?action=addNewDependent" >Add new dependent</a>
                    <h3>List dependent</h3>
                <table class="table table-striped">
                    <thead>
                        <tr style="text-align: center">
                            <th scope="col">ID employee</th>                           
                            <th scope="col">Employee name</th>                                                  
                            <th scope="col">ID dependent</th>
                            <th scope="col">Dependent name</th>
                            <th scope="col">gender</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Relationship</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>                  
                        <c:forEach var="listDependent" items="${requestScope.listDependent}">
                            <tr style="text-align: center">
                                <td scope="row">${listDependent.idEmp}</td>                            
                                <td>${listDependent.empName}</td>
                                <td>${listDependent.idDepen}</td>
                                <td>${listDependent.name}</td> 
                                <td>${listDependent.gender}</td> 
                                <td>${listDependent.dob}</td> 
                                <td>${listDependent.relationship}</td> 
                                <td>  
                                    <a href="mainController?action=updateDependent&&idEmp=${listDependent.idEmp}&&idDepen=${listDependent.idDepen}"><i class="fas fa-edit"></i></a>
                                </td>
                                <td>
                                    <c:url var="delete" value="mainController">
                                        <c:param name="action" value="Delete"> </c:param>
                                        <c:param name="id" value="${listDep.depNum}"> </c:param>
                                    </c:url>
                                    <a href="${delete}"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>                           
                        </c:forEach>
                    </tbody>
                </table>       
            </div>
        </c:if>
    </body>
</html>
