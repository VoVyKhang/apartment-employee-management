<%-- 
    Document   : rewardpenalty
    Created on : May 31, 2022, 1:34:28 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="management.dto.RewardPenaltyDTO"%>
<%@page import="management.dao.RewardPenaltyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/listRewardPenalty.css">


        <!--        <style>
                    .form-inline {  
                        display: flex;
                        flex-flow: row wrap;
                        align-items: center;
                    }
        
                    .form-inline input {
                        vertical-align: middle;
                        margin: 5px 10px 5px 0;
                        padding: 10px;
                        border: 1px solid #ddd;
                        width: 190.5px;
                        height: 50px;
                    }
        
                    .button1 {width: 190.5px;
                              height: 50px;
                    }
                </style>-->
    </head>
    <body>

        <%@include file="header.jsp" %>
        <c:import url="sidebar.jsp"></c:import>


            <div style="margin: 0 32px; width: 100%">
                <div >
                    <form action="mainController" method="post" class="form-reward-penalty">
<!--                        <div >
                            <div >
                                <label for="floatingInput">Employee ID</label>
                                <input type="text" name="txtSearchIdemp" value="<%= (request.getParameter("txtSearchIdemp") == null) ? "" : request.getParameter("txtSearchIdemp")%>"  id="floatingInput" placeholder="name@example.com">
                        </div>
                    </div>  -->
                    <div >
                        <div >
                            <label for="name">Employee Name</label>
                            <input type="text" name="txtSearchName" value="<%= (request.getParameter("txtSearchName") == null) ? "" : request.getParameter("txtSearchName")%>"  id="name" placeholder="name@example.com">
                            
                        </div>
                    </div>  
                    <div class="col-sm-6 col-md-4"> 
                        
                        <div class="form-group form-focus select-focus">
                            <label >Department</label>
                            <select class="form-select form-select-md-5 mb-1 list-options"> 
                                <option>Select Department</option>
                                <option>Web Developer</option>
                                <option>Web Designer</option>
                                <option>Android Developer</option>
                                <option>Ios Developer</option>
                            </select>
                        </div>
                    </div>        
                    <div class="col-sm-6 col-md-3 button-rp">
                        <input type="submit" value="searchID" name="action" class="btn btn-secondary btn-sm">
                    </div>

                </form>               
            </div>

            <div>
                <table class="table table-striped list-reward-penalty">
                    <thead>
                        <tr>
                            <th scope="col">ID </th>
                            <th scope="col">Image </th>
                            <th scope="col">Name </th>
                            <th scope="col">Gender </th>
                            <th scope="col">Type </th>
                            <th scope="col">Times</th>
                            <th scope="col">Date</th>
                            <th scope="col">Reason </th>
                            <th scope="col">Deparment </th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listrp" varStatus="counter" items="${requestScope.listrp}">
                        <form action="mainController">
                            <tr>

                                <td >${listrp.idEmp}</td> 
                                <td>
                                    <img class="align-self-center img-fluid rp-image" src='${listrp.imgPath}'>
                                </td>
                                <td>${listrp.name}</td>
                                <td>${listrp.gender}</td>
                                <td><c:choose>
                                        <c:when test="${listrp.status eq  1}">Reward</c:when>
                                        <c:otherwise>Penalty</c:otherwise>
                                    </c:choose></td>
                                <td>${listrp.times}</td>
                                <td>${listrp.applicableDate}</td>
                                <td>${listrp.reason}</td> 
                                <td>${listrp.depName}</td>
                                
                                <td>
                                    <form action="mainController" method="POST">
                                        <input type="hidden" value="${listrp.idEmp}" name="idemp">
                                        <input type="hidden" value="${listrp.name}" name="nameemp">
                                        <input type="hidden" name="updatetype" value="updaterp">
                                        <input type="hidden" name="action" value="pushss" >
                                        <input type="submit" class="btn btn-secondary btn-sm" value="UpdateRp">
                                    </form>
                                </td>
                                <td>
                                    <form action="mainController" method="POST">
                                        <input type="hidden" value="${listrp.idEmp}" name="idemp">
                                        <input type="submit" class="btn btn-secondary btn-sm" name="action" value="DeleteRp">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <c:if test="${requestScope.updateSuccess != null}">
                            <c:out value="${requestScope.updateSuccess}"/>
                        </c:if>
                </table> 
            </div> 
        </div>

    </body>
</html>
