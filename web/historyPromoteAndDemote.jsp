<%-- 
    Document   : historyPromoteAndDemote
    Created on : Jun 6, 2022, 3:32:01 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Promote and demote</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            .breadcrumb{
                background-color: #f7f7f7 !important;
                margin-left: -30px !important
            }
            .search-btn{
                border: 1px solid #00c5fb;
                border-radius: 50px;
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
                transform: scale(0.9)
            }

            .pd-body td{
                padding: 0 !important;
                vertical-align: middle !important
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

        <c:if test="${requestScope.listHisPos != null}">
            <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                               url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                               user = "sa"  password = "12345"/>

            <sql:query dataSource = "${snapshot}" var = "listDep">
                select depName
                from Department
            </sql:query>


            <sql:query dataSource = "${snapshot}" var = "listEmp">
                select e.idEmp, name
                from Employee as e, HistoryDep as hd, Department as d, HistoryPos as hp, Position as p, Contract as c, HistoryContract as hc
                where e.idEmp = hd.idEmp and hd.depNum = d.depNum and
                e.idEmp = hp.idEmp and hp.idPos = p.idPos and
                hd.status = 1 and hp.status = 1 and c.idContract=hc.idContract and hc.idEmp=e.idEmp and
                statusLog = 1 and role = 0 and hc.status = 1
                order by idEmp ASC
            </sql:query>

            <div style="margin: 0 16px; width: 100%">

                <div class="modal-header">
                    <div>
                        <h4 style="margin-left: -12px" class="page-title">History of promote and demote</h4>
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a> </li>
                                <li class="breadcrumb-item "><a href="mainController?action=listPosition">Position</a></li>
                                <li class="breadcrumb-item "><a href="mainController?action=searchPro">Promote/Demote</a></li>
                                <li class="breadcrumb-item active">History of promote and demote</li>
                            </ul>
                        </div>
                    </div>
                </div>


                <form action="mainController" method="post" >
                    <div class="row filter-row" style="margin-bottom: 8px">
                        <div class="col-sm-6 col-md-3">
                            <div class="form-group mb-3 mt-3">
                                <input type="text" class="form-control" id="email" value="<%= (request.getParameter("empname") == null) ? "" : request.getParameter("empname")%>" placeholder="Enter employee name..." name="empname">
<<<<<<< HEAD
                            </div>
=======
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 mt-3">
                        <select class="form-select form-select-md-5 mb-1 list-options" name="typehispos"> 
                            <option value="" <c:if test="${null eq sessionScope.typehispos}">selected=""</c:if>>All Type</option>
                            <option value="1" <c:if test="${0 eq sessionScope.typehispos}">selected="0"</c:if>>Promote</option>
                            <option value="0" <c:if test="${1 eq sessionScope.typehispos}">selected="1"</c:if>>Demote</option>
                            </select>
>>>>>>> 3b6182e680e6804289a874bb983a1b1b75a2ec66
                        </div>
                        <div class="col-sm-6 col-md-3 mt-3">
                            <select class="form-select form-select-md-5 mb-1 list-options" name="typehispos"> 
                                <option value="" <c:if test="${null eq sessionScope.typehispos}">selected=""</c:if>>All Type</option>
                                <option value="0" <c:if test="${0 eq sessionScope.typehispos}">selected="0"</c:if>>Promote</option>
                                <option value="1" <c:if test="${1 eq sessionScope.typehispos}">selected="1"</c:if>>Demote</option>
                                </select>
                            </div>
                            <div class="col-sm-6 col-md-3 mt-3">
                                <select class="form-select form-select-md-5 mb-1 list-options" name="statushispos"> 
                                    <option value="" <c:if test="${null eq sessionScope.statushispos}">selected=""</c:if>>All Status</option>
                                <option value="1" <c:if test="${1 eq sessionScope.statushispos}">selected="1"</c:if>>Active</option>
                                <option value="0" <c:if test="${0 eq sessionScope.statushispos}">selected="0"</c:if>>Inactive</option>
                                </select>
                            </div> 
                            <div class="col-sm-6 col-md-3 ">
                                <input type="hidden" value="searchHisPos" name="action" class="btn search-btn">
                                <input type="submit" value="Search" class="btn search-btn">
                            </div>
                        </div>
                    </form>

<<<<<<< HEAD
                    <!--begin for each-->              

                <c:forEach var="listEmp" items="${listEmp.rows}">
                    <div class="accordion accordion-flush" id="accordionFlush${listEmp.idEmp}">
                        <div class="accordion-item">
                            <c:if test="${requestScope.empId ne null || requestScope.nameEmp ne null}">
                                <c:if test="${requestScope.empId eq listEmp.idEmp && fn:contains(fn:toLowerCase(listEmp.name),fn:toLowerCase(requestScope.nameEmp)) || fn:contains(fn:toLowerCase(listEmp.name),fn:toLowerCase(requestScope.nameEmp)) && requestScope.nameEmp ne null}">
                                    <h2 class="accordion-header" id="flush-headingOne">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${listEmp.idEmp}" aria-expanded="false" aria-controls="flush-collapse${listEmp.idEmp}">
                                            <div class="dependent-name">
                                                <span>Id ${listEmp.idEmp} - </span>
                                                <p>${listEmp.name}</p>
                                            </div>
                                        </button>
                                    </h2>
                                </c:if>
                            </c:if>
                            <c:if test="${requestScope.empId eq null && requestScope.nameEmp eq null}">
                                <h2 class="accordion-header" id="flush-headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${listEmp.idEmp}" aria-expanded="false" aria-controls="flush-collapse${listEmp.idEmp}">
                                        <div class="dependent-name">
                                            <span>Id ${listEmp.idEmp} - </span>
                                            <p>${listEmp.name}</p>
                                        </div>
                                    </button>
                                </h2>
                            </c:if>
                            <div id="flush-collapse${listEmp.idEmp}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush${listEmp.idEmp}">
                                <div class="accordion-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>                 
                                                <th>ID history</th>
                                                <th>ID Position</th>
                                                <th>Position</th>
                                                <th>Delivery date</th>
                                                <th>Exact Date</th>
                                                <th>Type</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="listHisPos" items="${requestScope.listHisPos}">
                                            <c:if test="${listEmp.idEmp eq listHisPos.idEmp}">
                                                <tbody>
                                                    <tr>
                                                        <td>${listHisPos.idHisPos}</td>
                                                        <td>${listHisPos.idPos}</td>
                                                        <td>${listHisPos.posName}</td>
                                                        <td>${listHisPos.deliveryDate}</td>
                                                        <td>${listHisPos.exactDate}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${listHisPos.type eq 0}">
                                                                    <p style="color: red">Demote</p>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <p style="color:green">Promote</p>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${listHisPos.status eq 0}">
                                                                    <p style="color: red">Inactive</p>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <p style="color:green">Active</p>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
=======
            <c:if test="${requestScope.listHisPos != null}">
                <c:if test="${not empty requestScope.listHisPos}">

                    <table class="table table-bordered">
                        <thead >
                            <tr style="text-align: center">
                                <th scope="col">ID History</th>
                                <th scope="col">Employee</th>
                                <th scope="col">Position</th>
                                <th scope="col">Delivery Date</th>
                                <th scope="col">Exact Date</th>
                                <th scope="col">Type</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <c:forEach var="listHisPos" varStatus="counter" items="${requestScope.listHisPos}">    
                            <tr style="text-align: center" class="pd-body">
                                <td>${listHisPos.idHisPos}</td>                            
                                <td>${listHisPos.nameEmp}</td>
                                <td>${listHisPos.posName}</td>
                                <td>${listHisPos.deliveryDate}</td>
                                <td>${listHisPos.exactDate}</td>
                                <td> <c:choose>
                                        <c:when test="${listHisPos.type eq 1}">
                                            Promote
                                        </c:when>
                                        <c:otherwise>
                                            Demote
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td >
                                    <c:choose>
                                        <c:when test="${listHisPos.status eq 1}">
                                            <p style="color:green; margin-bottom: 0">Active</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p style="color:red; margin-bottom: 0">Inactive</p>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>                        
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!--                    <table class="table table-bordered">
                                        <thead >
                                            <tr style="text-align: center">
                                                <th scope="col">ID History</th>
                                                <th scope="col">Employee</th>
                                                <th scope="col">Position</th>
                                                <th scope="col">Delivery Date</th>
                                                <th scope="col">Exact Date</th>
                                                <th scope="col">Type</th>
                                                <th scope="col">Status</th>
                                            </tr>
                                        </thead>
                <c:forEach var="listHisPos" varStatus="counter" items="${requestScope.listHisPos}">    
                    <tr style="text-align: center" class="pd-body">
                        <td>${listHisPos.idHisPos}</td>                            
                        <td>${listHisPos.nameEmp}</td>
                        <td>${listHisPos.posName}</td>
                        <td>${listHisPos.deliveryDate}</td>
                        <td>${listHisPos.exactDate}</td>
                        <td> <c:choose>
                        <c:when test="${listHisPos.type eq 0}">
                            Promote
                        </c:when>
                        <c:otherwise>
                            Demote
                        </c:otherwise>
                    </c:choose>
                </td>
                <td >
                    <c:choose>
                        <c:when test="${listHisPos.status eq 1}">
                            <p style="color:green; margin-bottom: 0">Active</p>
                        </c:when>
                        <c:otherwise>
                            <p style="color:red; margin-bottom: 0">Inactive</p>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>                        
                </c:forEach>
                </tbody>
            </table>-->


                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                Id 1 - Nguyen Phuoc Thinh
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <table class="table table-bordered">
                                    <thead >
                                        <tr style="text-align: center">
                                            <th scope="col">ID History</th>
                                            <th scope="col">Employee</th>
                                            <th scope="col">Department</th>
                                            <th scope="col">Delivery Date</th>
                                            <th scope="col">Exact Date</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr style="text-align: center">
                                            <td>2</td>                            
                                            <td>Nguyen Phuoc Thinh</td>
                                            <td>technical</td>
                                            <td>22/7/2022</td>
                                            <td>23/7/2022</td>
                                            <td>
                                                <p style="color:green">Active</p>
                                            </td>
                                        </tr>                        
                                    </tbody>
                                </table>
>>>>>>> 3b6182e680e6804289a874bb983a1b1b75a2ec66
                            </div>
                        </div>

                    </div>
<<<<<<< HEAD
                </c:forEach>

                <!--End for each-->

            </div>
=======
                </div>
            </c:if>

>>>>>>> 3b6182e680e6804289a874bb983a1b1b75a2ec66
        </c:if>
    </body>
</html>
