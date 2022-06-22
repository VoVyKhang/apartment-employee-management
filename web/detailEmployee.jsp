<%-- 
    Document   : detailEmployee
    Created on : Jun 8, 2022, 9:14:55 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
        <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link rel="stylesheet" href="./css/profile.css"/>
        <title>Details Information Of Employee</title>
    </head>

    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Employee Records</h3>
                            <ul class="breadcrumb ">
                                <li class="breadcrumb-item"><a href="BoardManagerHome.jsp">Home</a></li>
                                <li class="breadcrumb-item"><a href="mainController?action=showlist&type=emp">Employee</a></li>
                                <li class="breadcrumb-item active">Profile</li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="card mb-0">
                    <div class="card-body">
                        <div class="row employee__container">
                            <div class="col-md-12">
                                <div class="profile-view">
                                    <div class="profile-img-wrap">
                                        <div class="profile-img">
                                            <img alt="" src="images/${requestScope.Employee.imgPath}">
                                    </div>
                                </div>
                                <div class="profile-basic">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="profile-info-left mt-16">
                                                <h3 class="user-name m-t-0 mb-0">${requestScope.Employee.name}</h3>
                                                <h6 class="text-muted">${requestScope.Employee.posName}</h6>
                                                <div class="staff-id">Department: ${requestScope.Employee.depName}</div>
                                                <div class="small doj text-muted">Date of Join : ${requestScope.Employee.joinDate}</div>

                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <ul class="personal-info">
                                                <li>
                                                    <div class="title">Phone:</div>
                                                    <div class="text">${requestScope.Employee.phoneNum}</div>
                                                </li>
                                                <li>
                                                    <div class="title">Email:</div>
                                                    <div class="text">${requestScope.Employee.email}</div>
                                                </li>
                                                <li>
                                                    <div class="title">Birthday:</div>
                                                    <div class="text">${requestScope.Employee.dob}</div>
                                                </li>
                                                <li>
                                                    <div class="title">Address:</div>
                                                    <div class="text">${requestScope.Employee.address}</div>
                                                </li>
                                                <li>
                                                    <div class="title">${requestScope.Employee.gender}</div>
                                                    <div class="text">Male</div>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                               url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                               user = "sa"  password = "12345"/>

            <div class="tab-content">
                <div class="row" style="margin-top: 16px">
                    <div class="col-md-6 d-flex">
                        <div class="card profile-box flex-fill">
                            <div class="card-body">
                                <h3 class="card-title">Contract informations</h3>

                                <sql:query dataSource = "${snapshot}" var = "listcontract">
                                    select idContract,  t.name, signDay, expDay, status
                                    from Contract as c, TypeContract as t
                                    where c.idTypeCon = t.idTypeCon and c.idEmp = ${requestScope.Employee.idEmp}
                                </sql:query>

                                <ul class="personal-info">
                                    <c:forEach var = "rowcon" items = "${listcontract.rows}">
                                        <li>
                                            <div class="title">Contract ID</div>
                                            <div class="text">${rowcon.idContract}</div>
                                        </li>
                                        <li>
                                            <div class="title">Name</div>
                                            <div class="text">${rowcon.name}</div>
                                        </li>
                                        <li>
                                            <div class="title">Sign Day</div>
                                            <div class="text">${rowcon.signDay}</div>
                                        </li>
                                        <li>
                                            <div class="title">End Day</div>
                                            <div class="text">${rowcon.expDay}</div>
                                        </li>
                                        <li>
                                            <c:choose>
                                                <c:when test="${rowcon.status eq 1}">
                                                    <p style="color:green">OK</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p style="color:red">Expired</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 d-flex">
                        <div class="card profile-box flex-fill">
                            <div class="card-body">
                                <h3 class="card-title">Dependent Informations </h3>
                                <div class="table-responsive">

                                    <sql:query dataSource = "${snapshot}" var = "listdepen">
                                        select idDepen, name, gender, dob, relationship
                                        from Dependent
                                        where idEmp = ${requestScope.Employee.idEmp}
                                    </sql:query>

                                    <table class="table table-nowrap">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Gender</th>
                                                <th>Date of Birth</th>
                                                <th>Relationship</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var = "rowdepen" items = "${listdepen.rows}">
                                                <tr>
                                                    <td>${rowdepen.name}</td>
                                                    <td>${rowdepen.gender}</td>
                                                    <td>${rowdepen.dob}</td>
                                                    <td>${rowdepen.relationship}</td>
                                                    <td class="text-right">

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row" style="margin-top: 16px">
                    <div class="col-md-6 d-flex">
                        <div class="card profile-box flex-fill">
                            <div class="card-body">
                                <h3 class="card-title">Certificate Informations </h3>
                                <div class="experience-box">
                                    <ul class="experience-list">
                                        <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                                           url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                                                           user = "sa"  password = "12345"/>

                                        <sql:query dataSource = "${snapshot}" var = "listcer">
                                            select cerID, cerName, doi, tc.name as type
                                            from Certificate as c, TypeCertificate tc
                                            where c.idTypeCer = tc.idTypeCer and c.idEmp = ${requestScope.Employee.idEmp}
                                        </sql:query>
                                        <c:forEach var = "rowcer" items = "${listcer.rows}">
                                            <li>
                                                <div class="experience-user">
                                                    <div class="before-circle"></div>
                                                </div>
                                                <div class="experience-content">
                                                    <div class="timeline-content">
                                                        <div class="name">${rowcer.cerName}</div>
                                                        <div>${rowcer.type}</div>
                                                        <span class="time">${rowcer.doi}</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>             

            <div style="height: 20px; background-color: #fff"></div>

        </div>
    </body>
</html>
