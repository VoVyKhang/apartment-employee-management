<%-- 
    Document   : addNewCertificate
    Created on : Jun 7, 2022, 4:53:38 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Certificate</title>
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

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import> 

        <c:if test="${filedBlank != null}">
            <h3 style="color: red" ><c:out value="${filedBlank}"/></h3> 
        </c:if>
        <c:if test="${Success != null}">
            <h3 style="color: green" ><c:out value="${Success}"/></h3> 
        </c:if>
        <c:if test="${Fail != null}">
            <c:out value="${Fail}"/>
        </c:if>        
        <div style="width: 100%">
            <form action="mainController" style="margin: 0 32px" class="form-position">            

                <div class="form-group">
                    <span> Name certificate</span>
                    <input class="form-control" name="cerName" value="${param.cerName}">              
                </div>
                <div class="form-group">
                    <span>Date of isuess</span>
                    <input class="form-control" name="cerDoi" type="date" value="${param.cerDoi}">                  
                </div>
                <div class="form-group ">
                    <div style="margin-bottom: 4px">Type</div>

                    <select name="idTypeCer" class="certificate-select">
                        <c:forEach var="listTypeCer" items="${requestScope.listTypeCer}">
                            <option value="${listTypeCer.idTypeCer}" ><c:out value="${listTypeCer.type}"/></option>                        
                        </c:forEach>
                    </select> 

                </div>
                <div style="margin-top: 20px">
                    <input type="hidden" name="action" value="addNewCertEmp"/>
                    <input type="hidden" name="empID" value="${sessionScope.USER_LOGGIN.idEmp}"/>
                    <input class="btn btn-secondary btn-sm" type="submit" value="Save">
                </div>

            </form>
        </div>
    </body>
</html>
