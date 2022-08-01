<%-- 
    Document   : listDependent
    Created on : Jun 12, 2022, 8:26:09 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dependent</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            .btn-primary{
                background-color: #01a3ed !important;
                border: 1px solid #01a3ed !important;
                border-radius: 20px !important;
                font-size: 18px;
                font-weight: 600;
                min-width: 150px;
                padding: 6px 20px !important;
                margin-top: 48px;
            }

            .list-employee__actions{
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .breadcrumb{
                background-color: #f7f7f7 !important;
                display: inline-flex !important;
                float: left !important;
                margin-left: -16px;
            }

            .page-title{
                text-align: initial !important;
                margin-left: 2px !important;
                margin-top: 8px
            }

            .add-btn{
                background-color: #00a8ef;
                border: 1px solid #00c5fb;
                border-radius: 50px;
                color: #fff;
                font-weight: 500;
                min-width: 140px;
                text-decoration: none;
                cursor: pointer;
                padding: 4px 10px;
                display: flex;
            }

            .add-btn:hover{
                opacity: 0.9;
                transform: scale(0.95)
            }

            #sidebar{
                height: 100vh
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.USER_LOGGIN eq null}">
            <c:redirect url="Hall.jsp"/>
        </c:if>
        <c:import url="headerEmp.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import>


        <c:if test="${requestScope.updateFail != null}" >
            <c:out value="${requestScope.updateFail}" />
        </c:if>
        <c:if test="${requestScope.listDependent != null}">

            <div style="margin: 0 16px; width: 100%">
                <div class="page-header">
                    <div class="row">
                        <h3 class="page-title">Dependent</h3>
                        <div class="col-sm-12 list-employee__actions">                       
                            <div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="EmployeeHome.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Dependent</li>
                                </ul>
                            </div>
                            <div style="margin-right: 8px">          
                                <a class="add-btn" href="AddNewDependentEmp.jsp">
                                    <i class="ri-add-fill list__employee-icon"></i>
                                    Add new dependent
                                </a>
                                <c:if test="${requestScope.updateSuccess != null}" >
                                    <h3 style="color: green" ><c:out value="${requestScope.updateSuccess}" /></h3>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <h5 style="color:green">${requestScope.Success}</h5>
                <table class="table table-striped">
                    <thead>
                        <tr style="text-align: center">
                            <th scope="col">ID dependent</th>
                            <th scope="col">Dependent name</th>
                            <th scope="col">gender</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Relationship</th>
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody>                  
                        <c:forEach var="listDependent" items="${requestScope.listDependent}">
                            <tr style="text-align: center">
                                <td>${listDependent.idDepen}</td>
                                <td>${listDependent.name}</td> 
                                <td>${listDependent.gender}</td> 
                                <td>${listDependent.dob}</td> 
                                <td>${listDependent.relationship}</td> 
                                <td>  
                                    <a href="mainController?action=updateDependentEmp&&idEmp=${listDependent.idEmp}&&idDepen=${listDependent.idDepen}"><i class="fas fa-edit"></i></a>
                                </td>
                                <td>
                                    <c:url var="delete" value="mainController">
                                        <c:param name="action" value="Delete"> </c:param>
                                        <c:param name="id" value="${listDep.depNum}"> </c:param>
                                    </c:url>

                                </td>
                            </tr>                           
                        </c:forEach>
                    </tbody>
                </table>       
            </div>
        </c:if>
    </body>
</html>
