<%-- 
    Document   : updateDep
    Created on : May 31, 2022, 9:21:10 AM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Department Page</title>
        <style>
            .btn-primary{
                background: linear-gradient(to right, #00c0f9, #0255cd);
                border: 1px solid #01a3ed !important;
                border-radius: 10px !important;
                font-size: 18px;
                font-weight: 600;
                padding: 5px 10px;
                margin-top: 16px;
                width: 100%
            }

            .btn-primary:hover{
                transform: scale(0.99);
                opacity: 0.9
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="modal-content" style="margin: 0 8px">
                <div class="modal-header" >
                    <h5 class="modal-title">Update Department</h5>
                </div>
                <div>
                    <div>
                        <p style="margin: 16px 32px 0 32px">Department is being updated: ${requestScope.Dep.depName}</p>
                </div>
            </div>
            <div class="modal-body">
                <form action="mainController" method="POST" class="form-position" style="margin: 0 16px">
                    <div class="form-group">
                        <label for="formGroupExampleInput">Name</label>
                        <input type="text" class="form-control" id="formGroupExampleInput" name="depname" placeholder="Example input"

                               <c:choose>
                                   <c:when test="${not empty requestScope.Dep.depName}">
                                       value="${requestScope.Dep.depName}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.namereg}"
                                   </c:otherwise>
                               </c:choose>
                               >

                        <p style="color:red">${requestScope.messName}</p>
                        <p style="color:red">${requestScope.WARNINGEXIST}</p>
                    </div>


                    <div class="form-group">
                        <label for="formGroupExampleInput2">Description</label>
                        <input type="text" name="depdes" class="form-control" id="formGroupExampleInput2" placeholder="Another input"

                               <c:choose>
                                   <c:when test="${not empty requestScope.Dep.description}">
                                       value="${requestScope.Dep.description}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.desreg}"
                                   </c:otherwise>
                               </c:choose>
                               >

                        <p style="color:red">${requestScope.messDes}</p>
                    </div>


                    <div class="form-group">
                        <label for="formGroupExampleInput2">Location</label>
                        <input type="text" name="deploc" class="form-control" id="formGroupExampleInput2" placeholder="Another input"


                               <c:choose>
                                   <c:when test="${not empty requestScope.Dep.location}">
                                       value="${requestScope.Dep.location}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.locreg}"
                                   </c:otherwise>
                               </c:choose>
                               >

                        <p style="color:red"> ${requestScope.messLoc}</p>
                        <p style="color:red">${requestScope.WARNING}</p>
                    </div>


                    <div class="form-position__btn">
                        <input type="hidden" name="depnum"

                               <c:choose>
                                   <c:when test="${not empty requestScope.Dep.depNum}">
                                       value="${requestScope.Dep.depNum}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.idreg}"
                                   </c:otherwise>
                               </c:choose> 
                               >

                        <input type="hidden" name="depcheck"
                               <c:choose>
                                   <c:when test="${not empty requestScope.Dep.depName}">
                                       value="${requestScope.Dep.depName}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.nameregcheck}"
                                   </c:otherwise>
                               </c:choose>
                               >

                        <input type="submit" class="btn btn-primary " name="action" value="Update"/> 
                    </div>
                    <c:if test="${requestScope.updateSuccess != null}">
                        <c:out value="${requestScope.updateSuccess}"/>
                    </c:if>
                </form>
            </div>

        </div>
    </body>
</html>
