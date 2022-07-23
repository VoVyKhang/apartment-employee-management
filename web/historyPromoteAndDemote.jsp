<%-- 
    Document   : historyPromoteAndDemote
    Created on : Jun 6, 2022, 3:32:01 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 mt-3">
                        <select class="form-select form-select-md-5 mb-1 list-options" name="typehispos"> 
                            <option value="" <c:if test="${null eq sessionScope.typehispos}">selected=""</c:if>>All Type</option>
                            <option value="1" <c:if test="${0 eq sessionScope.typehispos}">selected="0"</c:if>>Promote</option>
                            <option value="0" <c:if test="${1 eq sessionScope.typehispos}">selected="1"</c:if>>Demote</option>
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
            </c:if>
        </c:if>
    </body>
</html>
