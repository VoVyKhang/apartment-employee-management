<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dependent</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
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
            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 5px;
                color: #fff;
                font-weight: 500;
                text-decoration: none;
                cursor: pointer;
                width: 100%;
                height: 38px;
                background-color: #55ce63;
                text-transform: uppercase;
                margin-top: 15px
            }
            .search-btn:hover{
                transform: scale(0.98);
                opacity: 0.9
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
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>


        <c:if test="${requestScope.updateFail != null}" >
            <c:out value="${requestScope.updateFail}" />
        </c:if>
        <c:if test="${requestScope.listDependent != null}">

            <div style="margin: 0 16px; width: 100%">
                <div class="page-header">
                    <div class="row">
                        <h3 class="page-title">Employee</h3>
                        <div class="col-sm-12 list-employee__actions">                       
                            <div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                    <li class="breadcrumb-item active">Dependent</li>
                                </ul>
                            </div>
                            <div style="margin-right: 8px">          
                                <a class="add-btn" href="mainController?action=addNewDependent" >
                                    <i class="ri-add-fill list__employee-icon"></i>
                                    Add new dependent</a>

                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${requestScope.updateSuccess != null}" >
                    <h3 style="color: green" ><c:out value="${requestScope.updateSuccess}" /></h3>
                </c:if>
                <form action="mainController" method="post" class="form-reward-penalty">
                    <div class="row filter-row">
                        <div class="col-sm-6 col-md-4">
                            <div class="form-group mb-3 mt-3">
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchIdemp") == null) ? "" : request.getParameter("txtSearchIdemp")%>" placeholder="Enter employee id..." name="txtSearchIdemp">                               
                            </div>
                        </div>  
                        <div class="col-sm-6 col-md-4">
                            <div class="form-group mb-3 mt-3">
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>" placeholder="Enter employee name..." name="txtSearchName">                               
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 ">
                            <input type="hidden" name="action" value="searchDependent"/>
                            <input type="submit" value="Search"  class="btn search-btn">
                        </div>
                    </div>  
                </form>
                <h5>${requestScope.SearchRS}</h5>
                <table class="table table-striped">
                    <thead>
                        <tr style="text-align: center">
                            <th scope="col">Employee ID</th>                           
                            <th scope="col">Employee name</th>                                                  
                            <th scope="col">Dependent ID</th>
                            <th scope="col">Dependent name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Relationship</th>
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody>                  
                        <c:forEach var="listDependent" items="${requestScope.listDependent}">
                            <tr style="text-align: center">
                                <td scope="row">${listDependent.idEmp}</td>                            
                                <td>${listDependent.empName}</td>
                                <td>${listDependent.idDepen}</td>
                                <td>${listDependent.name}</td> 
                                <td>${listDependent.gender}</td> 
                                <td>${listDependent.dob}</td> 
                                <td>${listDependent.relationship}</td> 
                                <td>  
                                    <a href="mainController?action=updateDependent&&idEmp=${listDependent.idEmp}&&idDepen=${listDependent.idDepen}"><i class="fas fa-edit"></i></a>
                                </td>
                                
                            </tr>                           
                        </c:forEach>
                    </tbody>
                </table>       
            </div>
        </c:if>
    </body>
</html>