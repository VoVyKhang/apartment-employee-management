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
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import> 

            <div class="container">
                <form action="mainController" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <h1 style="text-align:center">Update Employee</h1>
                    </div>

                    <div class="row">
                        <div class="col-6"><p>The employee being updated is: ${requestScope.Employee.name}</p></div>

                </div>


                <div class="row" >
                    <div class="col-6">Name: <input type="text" name="empname"
                                                    <c:choose>
                                                        <c:when test="${not empty requestScope.Employee.name}">
                                                            value="${requestScope.Employee.name}"
                                                        </c:when>
                                                        <c:otherwise>
                                                            value="${requestScope.namereg}"
                                                        </c:otherwise>
                                                    </c:choose>                                                  
                                                    ></br>

                        <p style="color: red">${requestScope.WARNINGNAME}</p>                      
                    </div>

                    <div class="col-6">Address <input type="text" name="empadd"
                                                      <c:choose>
                                                          <c:when test="${not empty requestScope.Employee.address}">
                                                              value="${requestScope.Employee.address}"
                                                          </c:when>
                                                          <c:otherwise>
                                                              value="${requestScope.addreg}"
                                                          </c:otherwise>  
                                                      </c:choose> 
                                                      ></br>

                        <p style="color:red">${requestScope.WARNINGADD}</p>
                    </div>
                </div>    
                </br>

                <div class="row">
                    <div class="col-6">Age: <input type="text" name="empage"
                                                   <c:choose>
                                                       <c:when test="${not empty requestScope.Employee.age}">
                                                           value="${requestScope.Employee.age}"
                                                       </c:when>
                                                       <c:otherwise>
                                                           value="${requestScope.agereg}"
                                                       </c:otherwise>
                                                   </c:choose>
                                                   ></br>

                        <p style="color: red">${requestScope.WARNINGAGE}</p>
                    </div>

                    <div class="col-6">Gender: 
                        <select name="empgen">
                            <option value="Male" 
                                    <c:choose>
                                        <c:when test="${not empty requestScope.Employee.gender}">
                                            <c:if test="${requestScope.Employee.gender == 'Male'}">selected=""</c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${requestScope.genreg == 'Male'}">selected=""</c:if>
                                        </c:otherwise>
                                    </c:choose>                                    
                                    >Male</option>

                            <option value="Female" 
                                    <c:choose>
                                        <c:when test="${not empty requestScope.Employee.gender}">
                                            <c:if test="${requestScope.Employee.gender == 'Female'}">selected=""</c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${requestScope.genreg == 'Female'}">selected=""</c:if>
                                        </c:otherwise>
                                    </c:choose>                            
                                    >Female</option>

                            <option value="Other" 
                                    <c:choose>
                                        <c:when test="${not empty requestScope.Employee.gender}">
                                            <c:if test="${requestScope.Employee.gender == 'Other'}">selected=""</c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${requestScope.genreg == 'Other'}">selected=""</c:if>
                                        </c:otherwise>
                                    </c:choose>                                                                                                     
                                    >Other</option>

                        </select></br>
                    </div>
                </div>
                </br>


                <div class="row">
                    <div class="col-6">Phone: <input type="text" name="empphone"
                                                     <c:choose>
                                                         <c:when test="${not empty requestScope.Employee.phoneNum}">
                                                             value="${requestScope.Employee.phoneNum}"
                                                         </c:when>
                                                         <c:otherwise>
                                                             value="${requestScope.phonereg}"
                                                         </c:otherwise>
                                                     </c:choose>                                                                                                                        
                                                     ></br>

                        <p style="color:red">${requestScope.WARNINGPHONE}</p>
                    </div>
                    <div class="col-6">Date of birth <input type="date" name="empdob"
                                                            <c:choose>
                                                                <c:when test="${not empty requestScope.Employee.dob}">
                                                                    value="${requestScope.Employee.dob}"
                                                                </c:when>
                                                                <c:otherwise>
                                                                    value="${requestScope.dobreg}"
                                                                </c:otherwise>
                                                            </c:choose>    
                                                            ></br>

                        <p style="color:red">${requestScope.WARNINGDOB}</p>
                    </div>
                </div>
                </br>


                <div class="row">

                    <div class="col-6">Image: <img class="align-self-center img-fluid" 
                                                   <c:choose>
                                                       <c:when test="${not empty requestScope.Employee.imgPath}">
                                                           src='images/${requestScope.Employee.imgPath}'
                                                       </c:when> 
                                                       <c:otherwise>
                                                           src='images/${requestScope.imgreg}'
                                                       </c:otherwise>
                                                   </c:choose>           

                                                   width="120"
                                                   height="120"></div>
                    <div class="col-6">New Image: <input type="file" name="empimg" value="" accept="image/*"></div>
                </div>
                </br>


                <div class="row"><p style="color:red">${requestScope.WARNINGFIELD}</p>
                    <p style="color:green">${requestScope.COMPLETED}</p>
                    <p style="color: red">${requestScope.FAILINSERT}</p>
                </div>
                </br>


                <div class="row">
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
                    <div class="col-6"><input type="submit" value="Update"></div>
                    <div class="col-6"><input type="reset" value="Reset"></div>
                </div>
            </form>
        </div>
    </body>
</html>
