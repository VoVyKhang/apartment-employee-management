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
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }
            
            #sidebar{
                height: 100vh !important
            }
            
            
        </style>
    </head>
    <body>

        <c:import url="headerEmp.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import>
        <c:if test="${requestScope.filedBlank != null}" >
            <h6 style="color: red" ><c:out value="${requestScope.filedBlank}" /></h6>
        </c:if>
            <div style="margin: 0 16px; width: 100%">
                <table class="table table-striped list-certificate">
                    <thead>
                        <tr>                    
                            <th scope="col">Certificate ID</th>
                            <th scope="col">Certificate name</th>
                            <th scope="col">Date of issue</th>
                            <th scope="col">Type certificate</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="mainController">   
                            <tr>                            
                                <td>${requestScope.cerID}</td>
                            <td><input type="text" name="cerName" value="${requestScope.cerName}"></td>
                                <td><input name="cerDoi" type="date" value="${requestScope.cerDoi}"></td>
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
                                    <input type="hidden" name="cerID" value="${requestScope.cerID}">
                                    <input type="hidden" name="empID" value="${sessionScope.USER_LOGGIN.idEmp}">
                                    <input type="hidden" name="action" value="saveCertEmp">
                                    <input class="btn btn-secondary btn-sm" type="submit" value="Save">
                                </td>
                            </tr>                        
                    </form>
                    </tbody>
                </table>
            </div>
    </body>
</html>
