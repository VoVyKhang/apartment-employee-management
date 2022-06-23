<%-- 
    Document   : PromoteAndDemotePosition
    Created on : Jun 1, 2022, 5:39:09 PM
    Author     : AD
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>
        
        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <sql:query dataSource = "${snapshot}" var = "listDep">
            select depName
            from Department
        </sql:query>
            
        <sql:query dataSource = "${snapshot}" var = "listPos">
            select posName
            from Position
        </sql:query>
            <div style="margin: 0 16px" >
            <div>
                <div>
                    <a href="mainController?action=searchHisPos" >History of promotion and demotion</a>
                </div>
                
            <form action="mainController" method="post" >
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-floating mb-3 mt-3">
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter email" name="empname">
                            <label for="name">Employee Name</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3"> 
                        </br>
                        <select class="form-select form-select-md-5 mb-1 list-options" name="depname"> 
                            <option value="" >All Department</option>
                            <c:forEach var="listDep" items="${listDep.rows}">
                                <option value="${listDep.depName}">${listDep.depName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        </br>
                        <select class="form-select form-select-md-5 mb-1 list-options" name="posname"> 
                            <option value="" >All Position</option>
                            <c:forEach var="listPos" items="${listPos.rows}">
                                <option value="${listPos.posName}">${listPos.posName}</option>
                            </c:forEach>
                        </select>
                    </div> 
                    <div class="col-sm-6 col-md-3 ">
                        </br>
                        <input type="submit" value="searchPro" name="action" class="btn btn-secondary btn-sm">
                    </div>
                </div>
            </form>
                            
            <%HttpSession ss = request.getSession();%>
            <c:if test="${requestScope.listEmpPos != null}">
                <c:if test="${not empty requestScope.listEmpPos}">

                    
                        <table class="table table-striped list-position" >
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Date of birth</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Current Positon</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">New Position</th>
                                    <th scope="col">Action</th>

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
                                            <input type="submit" value="Save"/>
                                            <input type="hidden" name="action" value="SavePosition"/>
                                            <input type="hidden" name="oldIdPos" value="${listEmpPos.idPos}"/>
                                            <input type="hidden" name="idEmp" value="${listEmpPos.idEmp}"/>
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



