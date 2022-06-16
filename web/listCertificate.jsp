<%-- 
    Document   : listCertificate
    Created on : Jun 6, 2022, 9:45:26 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Certificate</title>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>


        <div style="width: 100%">
                <div>
                    <a href="mainController?action=add new certificate">Add new Certificate</a>
                </div>
            <c:if test="${updateSuccess != null}" >
                <h3 style="color: green" ><c:out value="${updateSuccess}" /></h3>
            </c:if>
            <c:if test="${updateFail != null}" >
                <h3 style="color: red" > <c:out value="${updateFail}" /></h3>
            </c:if>
            <c:if test="${requestScope.listCer != null}">
                <div style="margin: 0 32px">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID </th>
                                <th scope="col">Employee name</th>                      
                                <th scope="col">Certificate ID</th>
                                <th scope="col">Certificate name</th>
                                <th scope="col">Date of issue</th>
                                <th scope="col">Type certificate</th>
                                <th scope="col">Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listCer" items="${requestScope.listCer}">    
                                <tr>
                                    <td scope="row">${listCer.idEmp}</td>
                                    <td>${listCer.empName}</td>                            
                                    <td>${listCer.cerId}</td>
                                    <td>${listCer.cerName}</td>
                                    <td>${listCer.doi}</td>
                                    <td>${listCer.type}</td>                            
                                    <td> <a href="mainController?action=updateCertificate&&idEmp=${listCer.idEmp}&&cerId=${listCer.cerId}&&idTypeCer=${listCer.idTypeCer}"><i class="fas fa-edit"></i></a></td>
                                </tr>                        
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </body>
</html>
