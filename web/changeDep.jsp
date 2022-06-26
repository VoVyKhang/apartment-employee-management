<%-- 
    Document   : listEmp
    Created on : May 29, 2022, 8:06:21 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Department</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            .btn-primary{
                background-color: #01a3ed !important;
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                min-width: 100px;
                padding: 10px 20px;
                margin-top: 48px
            }
            
            
        </style>
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
    <div style="margin: 0 32px; width: 100%" class="change-department">
        <c:if test="${requestScope.listEmp != null}">
            <form action="mainController" method="post" class="form-reward-penalty">
                <div class="row filter-row">  
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group mb-3 mt-3">
                            <label for="name">Employee Name</label>
                            <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>"  name="txtSearchName">
                            
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 mt-3"> 
                        <div class="form-group form-focus select-focus">
                            <label >Department</label>
                            <select name="depName" class="form-select form-select-md-5 mb-1 list-options form-control" > 
                                <option value="allDep">All</option>
                                <c:forEach var="listDep" items="${listDep.rows}">
                                    <option value="${listDep.depName}" ><c:out value="${listDep.depName}"/></option>                       
                                </c:forEach>
                            </select>
                        </div>
                    </div>     
                    <div class="col-sm-6 col-md-3 mt-3"> 
                        <div class="form-group form-focus select-focus">
                            <div style="margin-bottom: 8px" >Position</div>
                            <select name="posEmp" class="form-select form-select-md-5 mb-1 list-options form-control" > 
                                <option value="allPos">
                                    All
                                </option>
                                <c:forEach var="listPos" items="${listPos.rows}">
                                    <option value="${listPos.posName}" ><c:out value="${listPos.posName}"/></option>                       
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 ">
                        <input type="submit" value="Filter"  class="btn btn-primary">
                        <input type="hidden" name="action" value="filterChangeDep"/>
                    </div>
                </div>  
            </form>
            <h5>${requestScope.SearchRS}</h5>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID Employee</th>
                        <th scope="col">Image</th>
                        <th scope="col">Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Date of birth</th>
                        <th scope="col">Department</th>
                        <th scope="col">Position</th>
                        <th scope="col">Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="listEmp" varStatus="counter" items="${requestScope.listEmp}">
                    <form action="mainController">
                        <tr>


                            <td>${listEmp.idEmp}</td>     
                            <td>
                                <img class="align-self-center img-fluid" src='images/${listEmp.imgPath}' width="120"
                                     height="120">
                            </td>

                            <td class="nameEmp">${listEmp.name}</td>
                            <td>${listEmp.gender}</td>
                            <td>${listEmp.dob}</td>
                            <td class="exception">Old department: ${listEmp.depName}</br>
                                </br>

                                <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                                   url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                                                   user = "sa"  password = "12345"/>

                                <sql:query dataSource = "${snapshot}" var = "result">
                                    select DISTINCT d.depNum, d.depName
                                    from HistoryDep as hd, Department as d
                                    where hd.depNum <> d.depNum
                                    and hd.depNum = (
                                    select depNum
                                    from Department
                                    where depName = '${listEmp.depName}'
                                    );
                                </sql:query>
                                <label>New department:</label>
                                <select name="iddep">
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <option selected="" value="${row.depNum}">${row.depName}</option>
                                    </c:forEach>
                                </select>
                                </br>
                                </br>
                            </td>
                            <td>${listEmp.posName}</td>

                            <td>
                                <input type="hidden" name="idemp" value="${listEmp.idEmp}">
                                <input type="hidden" name="action" value="changeDep" >
                                <input type="hidden" name="olddep" value="${listEmp.depName}">
                                <input class="btn btn-secondary btn-sm" type="submit" value="Change">
                            </td>
                        </tr>

                    </form> 
                </c:forEach>
                </tbody>
            </table>

        </c:if>
        <div class="changedep-btn">
            <c:if test="${not empty sessionScope.WARNING}">
                <p style="color:green">${sessionScope.WARNING}</p>
                <c:remove var="WARNING" scope="session" />
            </c:if>
            <a href="mainController?action=history&typehis=hisdep">History of change department</a>
        </div>
    </div>
</body>
</html>
