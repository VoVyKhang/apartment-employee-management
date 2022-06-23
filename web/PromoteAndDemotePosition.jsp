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

        <div style="width: 100%">
                <div>
                    <a href="mainController?action=hisPromoteAndDemote" >History of promotion and demotion</a>
                </div>

            <%HttpSession ss = request.getSession();%>
            <c:if test="${requestScope.listEmpPos != null}">
                <c:if test="${not empty requestScope.listEmpPos}">

                    <div style="margin: 0 16px" >
                        <table class="table table-striped list-position" >
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Date of birth</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Current Position</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">New Position</th>
                                    <th scope="col">Update</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="listEmpPos" varStatus="counter" items="${requestScope.listEmpPos}">
                                <form action="mainController">
                                    <tr>
                                        <td scope="row">${listEmpPos.idEmp}</td>     
                                        <td>
                                            <img class="align-self-center img-fluid" src='images/${listEmpPos.imgPath}' width="120"
                                                 height="120">
                                        </td>
                                        <td>${listEmpPos.name}</td>
                                        <td>${listEmpPos.gender}</td>
                                        <td>${listEmpPos.dob}</td>
                                        <td>${listEmpPos.depName}</td>                               
                                        <td>${listEmpPos.posName}</td>

                                        <td> 
                                            <select name="type">
                                                <option value="0">Promote</option>
                                                <option value="1">Demote</option>                                               
                                            </select>
                                        </td>


                                        <td>
                                            <select name="idPos">
                                                <option value="1">Manager</option>
                                                <option value="2">Deputy</option>
                                                <option value="3">Employee</option>
                                            </select>
                                        </td>

                                        <td> 
                                            <c:url var="save" value="mainController">
                                                <c:param name="action" value="SavePosition"> </c:param>
                                                <c:param name="oldIdPos" value="${listEmpPos.idPos}"> </c:param>
                                                <c:param name="idEmp" value="${listEmpPos.idEmp}"> </c:param>
                                            </c:url>
                                            <a href="${save}"><i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>
                                </form> 
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </c:if>
            </c:if>
            <c:if test="${sessionScope.updateSuccess != null}">
                <h4 style="color: green" ><c:out value="${sessionScope.updateSuccess}"/></h4> 
            </c:if>
            <%
                ss.removeAttribute("updateSuccess");
            %>
        </div>
    </body>

</html>



