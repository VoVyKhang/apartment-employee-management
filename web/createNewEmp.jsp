<%-- 
    Document   : createNewEmp
    Created on : Jun 10, 2022, 4:17:53 PM
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
                <form action="mainController" method="post" class="form-position" style=" width: 100%">

                    <div class="row form-group" >
                        <div class="col-6">
                            <label for="formGroupExampleInput">Name</label>
                            <input class="form-control" id="formGroupExampleInput" type="text" name="empname">
                        </div>
                        <div class="col-6">
                            <label for="formGroupExampleInput1">Address</label> 
                            <input class="form-control" id="formGroupExampleInput1" type="text" name="empadd">
                        </div>
                    </div>
                    </br>

                    <div class="row form-group" >
                        <div class="col-6">
                            <label for="formGroupExampleInput2">Age</label> 
                            <input class="form-control" type="text" id="formGroupExampleInput2" name="empage">
                        </div>
                        <div class="col-6">
                            <label for="formGroupExampleInput3">Gender</label> 
                            <input class="form-control" id="formGroupExampleInput3" type="text" name="empgen"></div>
                    </div>
                    </br>

                    <div class="row form-group" >
                        <div class="col-6">
                            <label for="formGroupExampleInput4">Phone</label> 
                            <input class="form-control" id="formGroupExampleInput4" type="text" name="empphone"></div>
                        <div class="col-6">
                            <label for="formGroupExampleInput5">Day of birth</label> 
                            <input class="form-control" id="formGroupExampleInput5" type="date" name="empdob"></div>
                    </div>
                    </br>

                    <div class="row form-group" >
                        <div class="col-6">
                            <label for="formGroupExampleInput6">Image</label> 
                            <input class="form-control" id="formGroupExampleInput6" type="file" name="empimg" accept="image/*"></div>
                        <div class="col-6">
                            <label for="formGroupExampleInput7">Join Day</label> 
                            <input class="form-control"  id="formGroupExampleInput7" type="date" name="empjoin"></div>
                    </div>
                    </br>

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
                        <select name="empdep" class="select-options">
                            <c:forEach var = "rowdep" items = "${listdep.rows}">
                                <option value="${rowdep.depNum}">${rowdep.depName}</option>
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
                        <select name="emppos" class="select-options" >
                            <c:forEach var = "rowpos" items = "${listpos.rows}">
                                <option   value="${rowpos.idPos}">${rowpos.posName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                </br>

                <div class="row">
                    
                    <div class="col-6">
                        <input class="btn btn-secondary btn-xl emp-button" type="submit" value="Create">
                        <input class="btn btn-secondary btn-xl emp-button" type="reset" value="Reset">
                    </div>
                   
                    
                </div>
            </form>
        </div>
    </body>
</html>
