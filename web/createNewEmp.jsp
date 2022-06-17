<%-- 
    Document   : createNewEmp
    Created on : Jun 10, 2022, 4:17:53 PM
    Author     : lehon
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Employee</title>
        <style>
            .select-options{
                width: 540px;
                height: 41.5px;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                padding: 0 4px;
                font-size: 1rem;
                color: #495057;

            }

            .emp-button{
                margin-right: 16px;
                padding: 6px 30px !important
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="container">
                <form action="mainController" method="post" enctype="multipart/form-data" class="form-position" style=" width: 100%">

                    <div class="row form-group" >
                        <div class="col-6">
                            <label for="formGroupExampleInput">Name</label>
                            <input class="form-control" id="formGroupExampleInput" type="text" name="empname"
                            <c:if test="${not empty requestScope.namereg}">value="${requestScope.namereg}"</c:if>></br>
                        <p style="color: red">${requestScope.WARNINGNAME}</p>
                    </div>
                    <div class="col-6">
                        <label for="formGroupExampleInput1">Address</label> 
                        <input class="form-control" id="formGroupExampleInput1" type="text" name="empadd"
                               <c:if test="${not empty requestScope.addreg}">value="${requestScope.addreg}"</c:if>></br>
                        <p style="color:red">${requestScope.WARNINGADD}</p>
                    </div>
                </div>


                <div class="row form-group" >
                    <div class="col-6">
                        <label for="formGroupExampleInput2">Age</label> 
                        <input class="form-control" type="text" id="formGroupExampleInput2" name="empage"
                               <c:if test="${not empty requestScope.agereg}">value="${requestScope.agereg}"</c:if>></br>
                        <p style="color: red">${requestScope.WARNINGAGE}</p>
                    </div>
                    <div class="col-6">
                        <label for="formGroupExampleInput3">Gender</label> 
                        <select name="empgen" class="form-control" id="formGroupExampleInput3">
                            <option value="Male" 
                                    <c:if test="${requestScope.genreg == 'Male'}">selected=""</c:if>>Male</option>
                                    <option value="Female" 
                                    <c:if test="${requestScope.genreg == 'Female'}">selected=""</c:if>>Female</option>
                                    <option value="Other" 
                                    <c:if test="${requestScope.genreg == 'Other'}">selected=""</c:if>>Other</option>
                            </select></br>
                        </div>
                    </div>


                    <div class="row form-group" >
                        <div class="col-6">
                            <label for="formGroupExampleInput4">Phone</label> 
                            <input class="form-control" id="formGroupExampleInput4" type="text" name="empphone"
                            <c:if test="${not empty requestScope.phonereg}">value="${requestScope.phonereg}"</c:if>></br>
                        <p style="color:red">${requestScope.WARNINGPHONE}</p>
                    </div>
                    <div class="col-6">
                        <label for="formGroupExampleInput5">Day of birth</label> 
                        <input class="form-control" id="formGroupExampleInput5" type="date" name="empdob"
                               <c:if test="${not empty requestScope.dobreg}">value="${requestScope.dobreg}"</c:if>></br>
                        <p style="color:red">${requestScope.WARNINGDOB}</p>
                    </div>
                </div>
                </br>

                <div class="row form-group" >
                    <div class="col-6">
                        <label for="formGroupExampleInput6">Image</label> 
                        <input class="form-control" id="formGroupExampleInput6" type="file" name="empimg" accept="image/*"></div>
                    <div class="col-6">
                        <%Date d = new Date();%>
                        <label for="formGroupExampleInput7">Join Day</label> 
                        <input class="form-control"  id="formGroupExampleInput7" type="text" name="empjoin" readonly="" value="<%=d%>"></div>
                </div>
                </br>

                <div class="row form-group" >
                    <div class="col-6">
                        <label for="formGroupExampleInput8">Email</label> 
                        <input class="form-control" id="formGroupExampleInput8" type="text" name="empmail" 
                               <c:if test="${not empty requestScope.emailreg}">value="${requestScope.emailreg}"</c:if>></br>
                        <p style="color:red">${requestScope.WARNINGMAIL}</p>

                    </div>
                    <div class="col-6">

                        <label for="formGroupExampleInput9">Password</label> 
                        <input class="form-control"  id="formGroupExampleInput9" type="text" name="emppass" 
                               <c:if test="${not empty requestScope.passreg}">value="${requestScope.passreg}"</c:if>></br>
                        <p style="color:red">${requestScope.WARNINGPASS}</p>
                    </div>    
                </div>

                <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                   url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                                   user = "sa"  password = "12345"/>
                <div class="row">

                    <!--list department-->
                    <div class="col-6">
                        <sql:query dataSource = "${snapshot}" var = "listdep">
                            select depNum, depName
                            from Department
                        </sql:query>

                        <div style="margin-bottom: 9px">Department</div> 
                        <fmt:parseNumber var="iddep" type="number" value="${requestScope.depreg}"></fmt:parseNumber>
                        <select name="empdep" class="select-options">
                            <c:forEach var = "rowdep" items = "${listdep.rows}">
                                <option value="${rowdep.depNum}"
                                        <c:if test="${rowdep.depNum eq iddep}">selected=""</c:if>>${rowdep.depName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!--list position-->
                    <div class="col-6">
                        <sql:query dataSource = "${snapshot}" var = "listpos">
                            select idPos, posName
                            from Position
                        </sql:query>

                        <div style="margin-bottom: 9px">Position</div> 
                        <fmt:parseNumber var="idpos" type="number" value="${requestScope.posreg}"></fmt:parseNumber>
                        <select name="emppos" class="select-options" >
                            <c:forEach var = "rowpos" items = "${listpos.rows}">
                                <option value="${rowpos.idPos}"
                                        <c:if test="${rowpos.idPos eq idpos}">selected=""</c:if>>${rowpos.posName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <p style="color:red">${requestScope.WARNINGFIELD}</p>
                    <p style="color:green">${requestScope.COMPLETED}</p>
                    <p style="color: red">${requestScope.FAILINSERT}</p>
                </div>
                </br>

                <div class="row">

                    <div class="col-6">
                        <input type="hidden" name="action" value="createEmp">
                        <input class="btn btn-secondary btn-xl emp-button" type="submit" value="Create">
                        <input class="btn btn-secondary btn-xl emp-button" type="reset" value="Reset">
                    </div>


                </div>
            </form>
        </div>
    </body>
</html>
