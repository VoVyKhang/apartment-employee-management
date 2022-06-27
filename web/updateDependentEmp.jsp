<%-- 
    Document   : updateDependent
    Created on : Jun 12, 2022, 9:11:32 PM
    Author     : AD
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Dependent</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>

        <c:import url="sidebarEmp.jsp"></c:import>

        <c:if test="${requestScope.depenObject != null}">


            <div style=" width: 100%; margin: 0 8px">
                <c:if test="${requestScope.filedBlank != null}" >
                    <h3 style="color: red" ><c:out value="${requestScope.filedBlank}" /></h3>
                </c:if>
                <c:if test="${requestScope.checkDob != null}" >
                    <h3 style="color: red" ><c:out value="${requestScope.checkDob}" /></h3>
                </c:if>

                <c:if test="${requestScope.checkRelationship != null}" >
                    <h3 style="color: red" ><c:out value="${requestScope.checkRelationship}" /></h3>
                </c:if>
                <c:if test="${requestScope.nameInvalid != null}" >
                    <h3 style="color: red" ><c:out value="${requestScope.nameInvalid}" /></h3>
                </c:if>
                <table class="table table-striped list-certificate">
                    <thead>
                        <tr style="text-align: center">
                            <th scope="col">ID employee</th>
                            <th scope="col">Employee name</th>                      
                            <th scope="col">ID dependent</th>
                            <th scope="col">Dependent name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Relationship</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="mainController">
                        <c:forEach var="depenObject" items="${requestScope.depenObject}">    
                            <tr style="text-align: center">
                                <td scope="row">${depenObject.idEmp}</td>
                                <td>${depenObject.empName}</td>                            
                                <td>${depenObject.idDepen}</td>
                                <td><input name="name" value="${depenObject.name}"></td>                                
                                <td>
                                    <select name="gender">
                                        <option value="Male" <c:if test="${depenObject.gender eq 'Male'}">selected="${Male}"</c:if>>Male</option>
                                        <option value="Female"<c:if test="${depenObject.gender eq 'Female'}">selected="${Female}"</c:if>>Female</option>
                                        <option value="Other" <c:if test="${depenObject.gender eq 'Other'}">selected="${Other}"</c:if>>Other</option>
                                        </select>                                    
                                    </td>
                                    <td><input type="date" name="dob" value="${depenObject.dob}">

                                </td>
                                <td><input name="relationship" value="${depenObject.relationship}">

                                    <input type="hidden" name="idEmp" value="${depenObject.idEmp}">
                                    <input type="hidden" name="idDepen" value="${depenObject.idDepen}"></td>
                            <input type="hidden" name="action" value="SaveDependentEmp"></td>
                            <td><input class="btn btn-secondary btn-sm" type="submit" value="Save"></td>
                            </tr>                        
                        </c:forEach>
                    </form>
                    </tbody>
                </table>
            </div>
        </c:if>

    </body>
</html>
