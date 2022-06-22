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
        
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <c:if test="${sessionScope.USER_LOGGIN == null or sessionScope.USER_LOGGIN.role ne 1}">
            <c:redirect url="Hall.jsp">

            </c:redirect>
        </c:if>
<!--        <h2>Hello <c:out value="${sessionScope.USER_LOGGIN.name}"/> </h2>-->
        <section style="width: 100%; overflow: hidden">

            <div class="container">
                <div class="row">

                    <div style="max-width: 30%" class="card-item col-xl-4 col-sm-6 col-12">
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
                            <p class="card-item_number">
                                ${requestScope.lengthReg}
                            </p>
                            
                            <a                         
                                class="card-item_link"
                                href="mainController?action=showlist&type=reg">
                                Regulation
                            </a>
                        </div>    
                    </div>



                </div>
            </div>

            

        </section>

    </body>
</html>
