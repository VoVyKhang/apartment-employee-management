<%-- 
    Document   : listReg
    Created on : May 29, 2022, 8:06:32 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Regulation</title>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            .breadcrumb{
                background-color: #f7f7f7 !important;
                margin-left: -12px;
                display: inline-flex
            }
            
            .list-regulation__actions{
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            
            .form__regulation{
                display: flex;
                align-items: center
            }
            
            .btn-primary{
                height: 38px
            }
            
            .list-regulation__link{
                font-weight: 600;
                padding: 4px 8px;
                border: 1px solid #333;
                border-radius: 5px
            }
            
            .list-regulation__link:hover{
                background-color: #000;
                color: #fff
            }

        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div style="margin: 0 16px" class="list-regulation">
                <div class="row">
                    <h3 class="page-title" style="margin: 0 16px 16px 16px">Regulation</h3>
                    <div class="col-sm-12 list-regulation__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item active">Regulation</li>
                            </ul>
                        </div>
                        <div style="width: 385px">
                            <form action="mainController" method="POST" class="form-position form__regulation">
                                <div class="form-group" style="width: 180px; margin-right: 20px">
                                    <select name="regType" class="form-control">
                                        <option value="2" selected>All</option>
                                        <option value="1">Reward</option>
                                        <option value="0">Penalty</option>
                                    </select>
                                </div>
                                <div style="margin-top: -6px; margin-bottom: 16px">
                                    <input style="width: 180px" class="btn btn-primary btn-sm" type="submit" value="Filter"/>
                                    <input type="hidden" name="action" value="filterReg"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            <c:if test="${requestScope.listReg != null}">
                <c:if test="${not empty requestScope.listReg}">

                    <table class="table table-striped" style="margin-top: 20px">
                        <thead>
                            <tr>
                                <th scope="col">id Regulation</th>
                                <th scope="col">Name</th>
                                <th scope="col">Type</th>
                                <th scope="col">Update</th>
                            </tr>
                        </thead>
                        <tbody>
                        <a class="list-regulation__link" href="mainController?action=addReg">Add new regulation</a>
                        <c:if test="${requestScope.message ne ''}">
                            <c:out value="${requestScope.message}"/>
                        </c:if>
                        <c:forEach var="listReg" varStatus="counter" items="${requestScope.listReg}">
                            <form  action="mainController">
                                <tr>


                                    <td scope="row">${listReg.idReg}</td>                            
                                    <td>${listReg.name}</td>

                                    <c:choose>
                                        <c:when test="${listReg.status eq 0}">
                                            <td>Penalty</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Reward</td>
                                        </c:otherwise>
                                    </c:choose>


                                    <td>
                                        <c:url var="update" value="mainController">
                                            <c:param name="action" value="UpdateReg"> </c:param>

                                            <c:param name="idRegUpdate" value="${listReg.idReg}"> </c:param>
                                            <c:param name="nameRegUpdate" value="${listReg.name}"> </c:param>
                                            <c:param name="statusRegUpdate" value="${listReg.status}"> </c:param>

                                        </c:url>
                                        <a href="${update}"><i class="fas fa-edit"></i></a>

                                    </td>

                                </tr>
                            </form> 

                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
