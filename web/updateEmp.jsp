<%-- 
    Document   : createNewEmp
    Created on : Jun 10, 2022, 4:17:53 PM
    Author     : lehon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
        <style>
            .form__title{
                padding: 4px 0
            }

            .form__select{
                width: 586.6px !important;
                height: 38px !important;
                background-clip: padding-box;
                border: 1px solid #ced4da;
            }

            .day-of-birth{
                margin-left: 15px
            }

            .image{
                width: 100px;
                height: 100px;
                border-radius: 50%
            }

            .btn-primary{
                background: linear-gradient(to right, #00c0f9, #0255cd);
                border: 1px solid #01a3ed !important;
                border-radius: 20px !important;
                font-size: 18px;
                font-weight: 600;
                min-width: 150px;
                padding: 10px 20px;
                margin-top: 16px
            }
            
            .btn-primary:hover{
                transform: scale(0.9);
                opacity: 0.9
            }
        </style>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="modal-content" style="margin: 0 16px">

                <div class="modal-header">
                    <h5 class="modal-title">Update Employee</h5>
                </div>

                <div>
                    <div>
                        <p style="margin: 16px 16px 0 16px">The employee being updated is: ${requestScope.Employee.name}</p>
                    </div>
                </div>

            <div class="modal-body">
                <form action="mainController" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Name</label>
                                <input class="form-control" type="text" name="empname"
                                       <c:choose>
                                           <c:when test="${not empty requestScope.Employee.name}">
                                               value="${requestScope.Employee.name}"
                                           </c:when>
                                           <c:otherwise>
                                               value="${requestScope.namereg}"
                                           </c:otherwise>
                                       </c:choose>                                                  
                                       >
                                <p style="color: red">${requestScope.WARNINGNAME}</p>    
                            </div>                  
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Address</label>
                                <input class="form-control" type="text" name="empadd"
                                       <c:choose>
                                           <c:when test="${not empty requestScope.Employee.address}">
                                               value="${requestScope.Employee.address}"
                                           </c:when>
                                           <c:otherwise>
                                               value="${requestScope.addreg}"
                                           </c:otherwise>  
                                       </c:choose> 
                                       >
                                <p style="color:red">${requestScope.WARNINGADD}</p>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Phone</label> 
                                <input class="form-control" type="text" name="empphone"
                                       <c:choose>
                                           <c:when test="${not empty requestScope.Employee.phoneNum}">
                                               value="${requestScope.Employee.phoneNum}"
                                           </c:when>
                                           <c:otherwise>
                                               value="${requestScope.phonereg}"
                                           </c:otherwise>
                                       </c:choose>                                                                                                                        
                                       >
                                <p style="color:red">${requestScope.WARNINGPHONE}</p>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="col-form-label form__title">Gender</div>  
                                <select name="empgen  " class="form__select">
                                    <option value="Male" 
                                            <c:choose>
                                                <c:when test="${not empty requestScope.Employee.gender}">
                                                    <c:if test="${requestScope.Employee.gender == 'Male'}">selected=""</c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${requestScope.genreg == 'Male'}">selected=""</c:if>
                                                </c:otherwise>
                                            </c:choose>                                    
                                            >
                                        Male
                                    </option>

                                    <option value="Female" 
                                            <c:choose>
                                                <c:when test="${not empty requestScope.Employee.gender}">
                                                    <c:if test="${requestScope.Employee.gender == 'Female'}">selected=""</c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${requestScope.genreg == 'Female'}">selected=""</c:if>
                                                </c:otherwise>
                                            </c:choose>                            
                                            >Female
                                    </option>

                                    <option value="Other" 
                                            <c:choose>
                                                <c:when test="${not empty requestScope.Employee.gender}">
                                                    <c:if test="${requestScope.Employee.gender == 'Other'}">selected=""</c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${requestScope.genreg == 'Other'}">selected=""</c:if>
                                                </c:otherwise>
                                            </c:choose>                                                                                                     
                                            >Other
                                    </option>

                                </select>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="form-group day-of-birth">
                            <label class="col-form-label">Day of birth</label>
                            <input class="form-control form__select" type="date" name="empdob"
                                   <c:choose>
                                       <c:when test="${not empty requestScope.Employee.dob}">
                                           value="${requestScope.Employee.dob}"
                                       </c:when>
                                       <c:otherwise>
                                           value="${requestScope.dobreg}"
                                       </c:otherwise>
                                   </c:choose>    
                                   >
                            <p style="color:red">${requestScope.WARNINGDOB}</p>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-6">
                            <div>
                                <label class="col-form-label">Current image</label>
                                <img class="align-self-center img-fluid image" 
                                     <c:choose>
                                         <c:when test="${not empty requestScope.Employee.imgPath}">
                                             src='images/${requestScope.Employee.imgPath}'
                                         </c:when> 
                                         <c:otherwise>
                                             src='images/${requestScope.imgreg}'
                                         </c:otherwise>
                                     </c:choose>           
                                     >
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="col-form-label">New Image</div>
                                <input class="form-control" type="file" name="empimg" value="" accept="image/*">
                            </div>
                        </div>
                    </div>

                    <div>
                        <p style="color:red">${requestScope.WARNINGFIELD}</p>
                        <p style="color:green">${requestScope.COMPLETED}</p>
                        <p style="color: red">${requestScope.FAILINSERT}</p>
                    </div>

                    <div>
                        <input type="hidden" name="action" value="updateEmp">
                        <input type="hidden" name="oldimg"
                               <c:choose>
                                   <c:when test="${not empty requestScope.Employee.imgPath}">
                                       value="${requestScope.Employee.imgPath}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.imgreg}"
                                   </c:otherwise>
                               </c:choose>    
                               >
                        <input type="hidden" name="idemp"
                               <c:choose>
                                   <c:when test="${not empty requestScope.Employee.idEmp}">
                                       value="${requestScope.Employee.idEmp}"
                                   </c:when>
                                   <c:otherwise>
                                       value="${requestScope.idreg}"
                                   </c:otherwise>
                               </c:choose>   
                               >
                        <div>
                            <input class="btn btn-primary" type="submit" value="Update">
                            <input class="btn btn-primary" type="reset" value="Reset">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
