<%-- 
    Document   : listEmp
    Created on : May 29, 2022, 8:06:21 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/styles.css"/>
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

        <div class="list__employee">

            <div>
                <h3 class="list__employee-title">Employee</h3>
                <a class="list__employee-link add-btn" style="margin-top: 16px" href="createNewEmp.jsp">
                    <i class="ri-add-fill list__employee-icon"></i>
                    Add Employee
                </a>
                <div> 
                    <p style="color: green">${requestScope.COMPLETED}</p>
                </div>
            </div>

            <div>
                <form action="mainController" method="post" >
                    <div class="row filter-row">
                        <div class="col-sm-6 col-md-3" style="margin-top: 8px">
                            <div class="form-group mb-3 mt-3" >
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter name..." name="empname">
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
                            <input type="submit" value="searchEmp" name="action" class="btn btn-secondary btn-sm">
                        </div>
                    </div>
<<<<<<< HEAD
                    <div class="col-sm-6 col-md-3"> 
                        </br>
                        <select class="form-select form-select-md-5 mb-1 list-options" name="depname"> 
                            <option value="" >All Department</option>
                            <c:forEach var="listDep" items="${listDep.rows}">
                                <option value="${listDep.depName}"
                                        <c:if test="${listDep.depName eq sessionScope.depname}">selected="${listDep.depName}"</c:if>>${listDep.depName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        </br>
                        <select class="form-select form-select-md-5 mb-1 list-options" name="posname"> 
                            <option value="" >All Position</option>
                            <c:forEach var="listPos" items="${listPos.rows}">
                                <option value="${listPos.posName}"
                                        <c:if test="${listPos.posName eq sessionScope.posname}">selected="${listPos.posname}"</c:if>>${listPos.posName}</option>
                            </c:forEach>
                        </select>
                    </div> 
                    <div class="col-sm-6 col-md-3 ">
                        </br>
                        <input type="submit" value="searchEmp" name="action" class="btn btn-secondary btn-sm">
                    </div>
                </div>
            </form>
                            
=======
                </form>
            </div>

>>>>>>> 17fe9170490fdb3bfe2e349af728388f9f47dc9b
            <c:if test="${requestScope.listEmp != null}">
                <c:if test="${not empty requestScope.listEmp}">
                    <table class="table table-striped list__employee-table">
                        <thead>
                            <tr class="list__employee-header">
                                <th scope="col">Employee ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Email</th>
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
                                    <td>${listEmp.email}</td>
                                    <td>${listEmp.depName}</td>

                                    <td>
                                        <a href="mainController?action=passidemp&empid=${listEmp.idEmp}&type=update">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>


                                    <td>
                                        <c:url var="create" value="mainController">
                                            <c:param name="action" value="pushss"> </c:param>
                                            <c:param name="idemp" value="${listEmp.idEmp}"> </c:param>
                                            <c:param name="updatetype" value="createnewrp"> </c:param>
                                            <c:param name="nameemp" value="${listEmp.name}"> </c:param>
                                        </c:url>
                                        <a href="${create}"><i class="fas fa-plus-square"></i></a>
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
