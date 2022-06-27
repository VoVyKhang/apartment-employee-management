<%-- 
    Document   : ListPosition
    Created on : Jun 1, 2022, 12:18:29 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }
            
            .breadcrumb{
                background-color: #f7f7f7 !important;
                display: inline-flex !important;
                margin-left: -16px;
            }
            
            .list-position__actions{
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 8px
            }
            
            .page-title{
                text-align: initial !important;
                margin-left: 12px !important;
                margin-top: 8px
            }
            
            .position-link{
                font-weight: 600;
                padding: 4px 8px;
                border: 1px solid #333;
                border-radius: 5px
            }
            
            .position-link:hover{
                background-color: #000;
                color: #fff
            }
        </style>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
        <c:import url="sidebar.jsp"></c:import>

        <c:if test="${requestScope.listPosition != null}">

            <div style="margin: 0 16px; width: 100%">
                
                <div class="page-header">
                <div class="row">
                    <h3 class="page-title">Position</h3>
                    <div class="col-sm-12 list-position__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listHallManagerController">Home</a></li>
                                <li class="breadcrumb-item active">Position</li>
                            </ul>
                        </div>
                        <div>
                             <a class="position-link" href="mainController?action=searchPro">Promote/demote</a>
                        </div>
                    </div>
                </div>
            </div>
                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Position name</th>                           
                            <th scope="col">Description</th>                                                  
                            <th scope="col">Creator</th>
                            <th scope="col">Date Create</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                   
                    <c:forEach var="listPosition" items="${requestScope.listPosition}">
                        <tr>
                            <td>${listPosition.posName}</td>                            
                            <td>${listPosition.description}</td>
                            <td>${listPosition.creator}</td>
                            <td>${listPosition.dateCreated}</td>                          
                            <td >  
                                <a  href="mainController?action=ssPosition&&idPos=<c:out value="${listPosition.idPos}"/>&&posName=<c:out value="${listPosition.posName}"/>"><i class="fas fa-edit"></i></a>
                            </td>
                            <td>
                                <c:url var="delete" value="mainController">
                                    <c:param name="action" value="Delete"> </c:param>
                                    <c:param name="id" value="${listDep.depNum}"> </c:param>
                                </c:url>
                                <a href="${delete}"><i class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>                           
                    </c:forEach>
                    </tbody>
                </table>       
            </div>
        </c:if>
    </body>
</html>
