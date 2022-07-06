<%-- 
    Document   : AddNewDependent
    Created on : Jun 21, 2022, 7:20:37 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Dependent</title>
        <style>
            .certificate-select{
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                width: 100%;
                height: 42px
            }

            .btn-primary{
                background: linear-gradient(to right, #00c0f9, #0255cd);
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                padding: 5px 10px;
                margin-top: 16px;
                width: 100%
            }

            .btn-primary:hover{
                transform: scale(0.99);
                opacity: 0.9
            }
            
             .breadcrumb{
                background-color: #fff !important;  
                margin-bottom: 0 !important;
                margin-left: -14px
            }
        </style>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

        <c:if test="${requestScope.listEmp != null}">          
            <div style="width: 100%; margin: 0 8px" class="modal-content">
                <div class="modal-header" style="margin-bottom: 16px">
                    <div>
                        <h5 class="modal-title">Create new dependent</h5>
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item"><a href="mainController?action=listDependent">Dependent</a></li>
                                <li class="breadcrumb-item active">Create new dependent</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <c:if test="${filedBlank != null}">
                    <h3 style="color: red" ><c:out value="${filedBlank}"/></h3> 
                </c:if>
                <c:if test="${Success != null}">
                    <h3 style="color: green" ><c:out value="${Success}"/></h3> 
                </c:if>
                <c:if test="${Fail != null}">
                    <c:out value="${Fail}"/>
                </c:if>
                <form action="mainController" style="margin: 0 16px" class="form-position">            

                    <div class="form-group">
                        <span>Dependent name</span>
                        <input class="form-control" name="name" value="${param.name}">   
                        <c:if test="${nameInvalid != null}">
                            <h3 style="color: red" ><c:out value="${nameInvalid}"/></h3> 
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span>Gender</span>                        
                        <select name="gender" class="form-control">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>                                                                                     
                    </div>
                    <div class="form-group ">
                        <div style="margin-bottom: 4px">Date of birth</div>
                        <input class="form-control" name="dob" value="${param.dob}" type="date">
                        <c:if test="${requestScope.checkDob != null}" >
                            <h3 style="color: red" ><c:out value="${requestScope.checkDob}" /></h3>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span>Relationship</span>
                        <input class="form-control" name="relationship" value="${param.relationship}"> 
                        <c:if test="${checkRelationship != null}">
                            <h3 style="color: red" ><c:out value="${checkRelationship}"/></h3> 
                        </c:if>
                    </div>
                    <div class="form-group">
                        <div style="margin-bottom: 4px">Select employee</div>                                      

                        <select name="idEmp" class="certificate-select">
                            <c:forEach var="listEmp" items="${requestScope.listEmp}">
                                <option value="${listEmp.idEmp}"> id:<c:out value="${listEmp.idEmp}"/> - name:<c:out value="${listEmp.name}"/></option>                        
                            </c:forEach>
                        </select> 

                    </div>
                    <div style="margin-top: 20px">

                        <input class="btn btn-primary" type="submit" value="Save">
                        <input type="hidden" name="action" value="saveNewDependent">               
                    </div>
                </form>

            </div>
        </c:if>
    </body>
</html>
