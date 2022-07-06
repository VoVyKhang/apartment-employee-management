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
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }
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

            .search-btn{
                border-radius: 5px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                width: 100%;
                height: 38px;
                background: linear-gradient(to right, #00c0f9, #0255cd);
                text-transform: uppercase;
            }

            .search-btn:hover{
                transform: scale(0.99);
                opacity: 0.9
            }
            
             .breadcrumb{
                background-color: #fff !important;
                margin-left: -12px;   
                margin-bottom: 0 !important
            }
        </style>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 


        <c:if test="${requestScope.listEmp != null}">          
            <div style="width: 100%; margin: 0 8px" class="modal-content">
                <div class="modal-header">
                    <div>
                        <h4 style="margin-left: 4px" class="page-title">Add new certificate</h4>
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item"><a href="mainController?action=listCertificate">Certificate</a></li>
                                <li class="breadcrumb-item active">Add new Certificate</li>
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

                    <div class="form-group" style="margin-top: 16px">
                        <span> Name certificate</span>
                        <input class="form-control" name="nameCer" value="${param.nameCer}">   
                        <c:if test="${nameInvalid != null}">
                            <h3 style="color: red" ><c:out value="${nameInvalid}"/></h3> 
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span>Date of isuess</span>
                        <input class="form-control" name="doi" type="date" value="${param.doi}"> 
                        <c:if test="${requestScope.checkDoi != null}" >
                            <h3 style="color: red" ><c:out value="${requestScope.checkDoi}" /></h3>
                        </c:if>
                    </div>
                    <div class="form-group ">
                        <div style="margin-bottom: 4px">Type</div>

                        <select name="type" class="certificate-select">
                            <c:forEach var="listTypeCer" items="${requestScope.listTypeCer}">
                                <option value="${listTypeCer.idTypeCer}" ><c:out value="${listTypeCer.type}"/></option>                        
                            </c:forEach>
                        </select> 

                    </div>
                    <div class="form-group">
                        <div style="margin-bottom: 4px">Select employee</div>                                      

                        <select name="idEmp" class="certificate-select">
                            <c:forEach var="listEmp" items="${requestScope.listEmp}">
                                <option value="${listEmp.idEmp}" > id:<c:out value="${listEmp.idEmp}"/> - name:<c:out value="${listEmp.name}"/> </option>                        
                            </c:forEach>
                        </select> 

                    </div>
                    <div style="margin-top: 20px">

                        <input class="btn search-btn" type="submit" value="Save">
                        <input type="hidden" name="action" value="saveNewCertificate">
                    </div>

                </form>
            </div>

        </c:if>
    </body>
</html>
