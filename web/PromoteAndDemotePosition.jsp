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
        <title>Promote And Demote</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            .btn-primary{
                background-color: #55ce63 !important;
                border: 1px solid #55ce63 !important;
                border-radius: 5px !important;
                font-size: 18px;
                font-weight: 600;
                padding: 5px 10px;
                margin-top: 22px;
                width: 100%;
            }

            .btn-primary:hover{
                transform: scale(0.9);
                opacity: 0.9
            }

            .list-position__link{
                font-weight: 600;
                padding: 4px 8px;
                border: 1px solid #333;
                border-radius: 5px
            }

            .list-position__link:hover{
                background-color: #000;
                color: #fff
            }
            
            .list__promote-demote-item{
                display: flex;
                align-items: center
            }
            
            .list__promote-demote-item-img{
                width: 38px;
                height: 38px;
                border-radius: 50%
            }
            
            .list__promote-demote-description{
                display: flex;
                flex-direction: column;
                text-align: initial;
                font-size: 14px;
                margin-left: 8px
            }
            
            .list__promote-demote-description-name{
                font-weight: 600;
                margin-bottom: 2px
            }
            
            .list__promote-demote-description-dep{
                font-size: 13px;
                opacity: 0.9
            }
            
            .pd-btn{
                background-color: #fff;
                border: 1px solid #9d9d9d;
                outline: none;
                padding: 2px 8px;
                border-radius: 4px
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                           user = "sa"  password = "12345"/>

        <div style="width: 100%">
            <sql:query dataSource = "${snapshot}" var = "listDep">
                select depName
                from Department
            </sql:query>

            <sql:query dataSource = "${snapshot}" var = "listPos">
                select posName
                from Position
            </sql:query>
            <div style="margin: 0 16px" >
                <div class="modal-header" style="margin: 0 0 20px -16px">
                    <h5 class="modal-title">Promote/Demote</h5>
                </div>

                <div>
                    <div>
                        <a class="list-position__link" href="mainController?action=searchHisPos" >History of promotion and demotion</a>
                    </div>

                    <form action="mainController" method="post" >
                        <div class="row filter-row" style="margin-bottom: 8px">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group mb-3 mt-3" >
                                    <input style="margin-top: 24px" type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter employee name..." name="empname">
                                </div>
                            </div>
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
                                                <c:if test="${listPos.posName eq sessionScope.posname}">selected="${listPos.posName}"</c:if>>${listPos.posName}</option>
                                    </c:forEach>
                                </select>
                            </div> 
                            <div class="col-sm-6 col-md-3 ">
                                <input type="submit" value="searchPro" name="action" class="btn btn-primary">
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
                                        <th scope="col">Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Date of birth</th>
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
                                            <td class="list__promote-demote-item">
                                                <div>
                                                    <img class="list__promote-demote-item-img" src='images/${listEmpPos.imgPath}'>
                                                </div>
                                                <div class="list__promote-demote-description">
                                                    <span class="list__promote-demote-description-name">
                                                        ${listEmpPos.name}
                                                    </span>
                                                    <span class="list__promote-demote-description-dep">
                                                        ${listEmpPos.depName}
                                                    </span>
                                                </div>

                                            </td>
                                            <td>${listEmpPos.gender}</td>
                                            <td>${listEmpPos.dob}</td>                         
                                            <td>${listEmpPos.posName}</td>

                                            <td> 
                                                <select name="type">
                                                    <option value="0">Promote</option>
                                                    <option value="1">Demote</option>                                               
                                                </select>
                                            </td>


                                            <td>
                                                <select name="idPos" >
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
                                                <input class="pd-btn" type="submit" value="Save"/>
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
        </div>
    </body>

</html>



