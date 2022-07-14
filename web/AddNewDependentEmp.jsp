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
        </style>
    </head>
    <body>

        <c:import url="headerEmp.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import> 
            <div style="width: 100%">
            <c:if test="${filedBlank != null}">
                <h3 style="color: red" ><c:out value="${filedBlank}"/></h3> 
            </c:if>
            <c:if test="${Success != null}">
                <h3 style="color: green" ><c:out value="${Success}"/></h3> 
            </c:if>
            <c:if test="${Fail != null}">
                <c:out value="${Fail}"/>
            </c:if>
            <form action="mainController" style="margin: 0 32px" class="form-position">            

                <div class="form-group">
                    <span>Dependent name</span>
                    <input class="form-control" name="name" value="${param.name}">   
                    <c:if test="${nameInvalid != null}">
                        <h3 style="color: red" ><c:out value="${nameInvalid}"/></h3> 
                    </c:if>
                </div>
                <div class="form-group">
                    <span>Gender</span>                        
                    <select name="gender">
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
                <div style="margin-top: 20px">

                    <input class="btn btn-secondary btn-sm" type="submit" value="Save">
                    <input type="hidden" name="action" value="saveNewDependentEmp"
                </div>

            </form>
        </div>
    </body>
</html>
