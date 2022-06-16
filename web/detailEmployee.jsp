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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Details Information Of Employee</title>
    </head>

    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 
            <div class="container">
                <div >

                    <div class="row">
                        <h1 style="text-align:center">Employee Records</h1>
                    </div>


                    <div class="row">
                        <div class="col-12"><h6><img class="align-self-center img-fluid" src='${requestScope.Employee.imgPath}'style="width: 150px; height: 150px"></h6></div>
                    </div>
                    
                    <div class="row" style="margin-top: 32px">
                    <div class="col-6"><h6 >Name: ${requestScope.Employee.name}</h6></div>
                    <div class="col-6"><h6 >Address: ${requestScope.Employee.address}</h6></div>
                    </div>

                <div class="row">
                    <div class="col-6"><h6 >Age: ${requestScope.Employee.age}</h6></div>
                    <div class="col-6"><h6 >Gender: ${requestScope.Employee.gender}</h6></div>
                </div>

                <div class="row">
                    <div class="col-6"><h6 >Phone: ${requestScope.Employee.phoneNum}</h6></div>
                    <div class="col-6"><h6 >Date Of Birth: ${requestScope.Employee.dob}</h6></div>
                </div>

                <div class="row">
                    
                    <div class="col-6"><h6 >Join Day: ${requestScope.Employee.joinDate}</h6></div>
                    <div class="col-6"><h6 >Position: ${requestScope.Employee.posName}</h6></div>
                </div>

                <div class="row">
                    <div class="col-6"><h6 >Department: ${requestScope.Employee.depName}</h6></div>
                    
                </div>
            </div>


            <!-- -----------------------------------------LIST------------------------------------------------------ -->
            <div class="accordion" id="accordionExample" style="margin-top: 32px">
                <!-- Item 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            List Certificate
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">

                            <!--Query get list certificate-->
                            <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                               url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                                               user = "sa"  password = "12345"/>

                            <sql:query dataSource = "${snapshot}" var = "listcer">
                                select cerID, cerName, doi, tc.name as type
                                from Certificate as c, TypeCertificate tc
                                where c.idTypeCer = tc.idTypeCer and c.idEmp = ${requestScope.Employee.idEmp}
                            </sql:query>


                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">id Certificate</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Day of get</th>
                                        <th scope="col">Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var = "rowcer" items = "${listcer.rows}">
                                        <tr>
                                            <td>${rowcer.cerID}</td>
                                            <td>${rowcer.cerName}</td>
                                            <td>${rowcer.doi}</td>
                                            <td>${rowcer.type}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>



                        </div>
                    </div>
                </div>

                <!-- Item 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            List Dependent
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">


                            <sql:query dataSource = "${snapshot}" var = "listdepen">
                                select idDepen, name, gender, dob, ralationship
                                from Dependent
                                where idEmp = ${requestScope.Employee.idEmp}
                            </sql:query>



                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID Dependent</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Day Of Birth</th>
                                        <th scope="col">Relationship</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var = "rowdepen" items = "${listdepen.rows}">
                                        <tr>
                                            <td>${rowdepen.idDepen}</td>
                                            <td>${rowdepen.name}</td>
                                            <td>${rowdepen.gender}</td>
                                            <td>${rowdepen.dob}</td>
                                            <td>${rowdepen.ralationship}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>

            </div>

        </div>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
