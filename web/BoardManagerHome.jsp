<%-- 
    Document   : BoardManagerHome
    Created on : May 29, 2022, 1:11:25 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management Hall Page</title>   
        <style>
            .statistics{
                margin-left: -17px;
                flex: 0 0 32.8% !important;
            }
            
            .statistics-department{
               padding-left: 0 !important;
               flex: 0 0 31.5% !important;
               margin-right: 6px
            }

            .stats-info p {
                display: flex;
                font-size: 12px;
                justify-content: space-between;
                margin-bottom: 2px;
                color: #000;
                font-weight: 500
            }

            .stats-info {
                background-color: #fff;
                border: 1px solid #e5e5e5;
                border-radius: 4px;
                margin-bottom: 20px;
                padding: 10px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <c:if test="${sessionScope.USER_LOGGIN == null or sessionScope.USER_LOGGIN.role ne 1}">
            <c:redirect url="Hall.jsp">
            </c:redirect>
        </c:if>

        <div style="width: 100%; margin-left: 40px; overflow: hidden">
            <div>
                <div class="container">
                    <div class="row">

                        <div style="max-width: 30%" class="card-item col-xl-4 col-sm-6 col-12 ">
                            <div class="card-item_employee">
                                <i style="color: #00c5fb" class="fas fa-building"></i>
                            </div>

                            <div>
                                <p class="card-item_number">
                                    ${requestScope.lengthDep}
                                </p>
                                <a 
                                    class="card-item_link"
                                    href="mainController?action=showlist&type=dep">Department</a>
                            </div>

                        </div>
                        <div style="width: 20px"></div>

                        <div style="max-width: 30%" class="card-item col-xl-4 col-sm-6 col-12">
                            <div class="card-item_employee">
                                <i style="color: #00c5fb" class="fas fa-user"></i>
                            </div>

                            <div>
                                <p class="card-item_number">
                                    ${requestScope.lengthEmp}
                                </p>
                                <a 
                                    class="card-item_link"
                                    href="mainController?action=showlist&type=emp">Employee</a>
                            </div>    
                        </div>
                        <div style="width: 20px"></div>
                        <div style="max-width: 30%" class="card-item col-xl-4 col-sm-6 col-12">
                            <div class="card-item_employee">
                                <i style="color: #00c5fb" class="fas fa-book-open"></i>
                            </div>

                            <div>
                                <p class="card-item_number">${requestScope.lengthReg}</p>
                                <a                         
                                    class="card-item_link"
                                    href="mainController?action=showlist&type=reg">
                                    Regulation
                                </a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" >
                <div class="row" style="margin-top: 32px">
                    <div class="col-md-12 col-lg-12 col-xl-4 d-flex statistics-department">
                        <div class="card flex-fill dash-statistics" >
                            <div class="card-body" >
                                <h5 class="card-title">Department Statistics</h5>
                                <div class="stats-list">
                                    <div class="stats-info">
                                        <p>Today Leave <strong>4</strong></p>
                                    </div>
                                    <div class="stats-info">
                                        <p>Pending Invoice <strong>15</strong></p>    
                                    </div>
                                    <div class="stats-info">
                                        <p>Completed Projects <strong>85 </strong></p>
                                    </div>
                                    <div class="stats-info">
                                        <p>Open Tickets <strong>190 </strong></p>
                                    </div>
                                    <div class="stats-info">
                                        <p>Closed Tickets <strong>22</strong></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-12 col-lg-6 col-xl-4 d-flex statistics" style="height: 100%">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <h4 class="card-title" style="font-size: 20px">Reward & Penalty Statistics</h4>
                                <div class="statistics">
                                    <div class="row">
                                        <div class="col-md-6 col-6 text-center">
                                            <div class="stats-box mb-4">
                                                <p style="color: #007bff">Reward</p>
                                                <h3>385</h3>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-6 text-center">
                                            <div class="stats-box mb-4">
                                                <p style="color: #dc3545">Penalty</p>
                                                <h3>19</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-purple" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>                            
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 70%" aria-valuenow="14" aria-valuemin="0" aria-valuemax="100">70%</div>                                   
                                </div>                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
