<%-- 
    Document   : updateCertificate
    Created on : Jun 8, 2022, 10:07:38 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Certificate</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>
        <c:if test="${requestScope.filedBlank != null}" >
            <h3 style="color: red" ><c:out value="${requestScope.filedBlank}" /></h3>
        </c:if>


        <c:if test="${requestScope.listCerObject != null}">

            <div style="margin: 0 32px; width: 100%">
                <c:if test="${nameInvalid != null}">
                    <h3 style="color: red" ><c:out value="${nameInvalid}"/></h3> 
                </c:if>
                <c:if test="${requestScope.checkDoi != null}" >
                    <h3 style="color: red" ><c:out value="${requestScope.checkDoi}" /></h3>
                </c:if>
                <table class="table table-striped list-certificate">
                    <thead>
                        <tr>
                            <th scope="col">ID employee</th>
                            <th scope="col">Employee name</th>                      
                            <th scope="col">Certificate ID</th>
                            <th scope="col">Certificate name</th>
                            <th scope="col">Date of issue</th>
                            <th scope="col">Type certificate</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="mainController">
                        <c:forEach var="listCerObject" items="${requestScope.listCerObject}">    
                            <tr>
                                <td scope="row">${listCerObject.idEmp}</td>
                                <td>${listCerObject.empName}</td>                            
                                <td>${listCerObject.cerId}</td>
                                <td><input name="cerName" value="${listCerObject.cerName}"></td>
                                <td><input name="doi" type="date" value="${listCerObject.doi}"></td>
                                <td>
                                    <select name="idTypeCer" >
                                        <c:forEach var="listTypeCer" items="${requestScope.listTypeCer}">                                       
                                            <option value="${listTypeCer.idTypeCer}"  <c:if test="${listCerObject.idTypeCer == listTypeCer.idTypeCer}" > selected="${listTypeCer.type}" </c:if>>
                                                ${listTypeCer.type}
                                            </option>

                                        </c:forEach>  
                                    </select>
                                </td>
                                <td>
                                    <input type="hidden" name="cerID" value="${listCerObject.cerId}">
                                    <input type="hidden" name="idEmp" value="${listCerObject.idEmp}">
                                    <input type="hidden" name="action" value="SaveChange">
                                    <input class="btn btn-secondary btn-sm" type="submit" value="Save">
                                </td>
                            </tr>                        
                        </c:forEach>
                    </form>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>
