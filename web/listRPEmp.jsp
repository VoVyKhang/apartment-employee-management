<%-- 
    Document   : rewardpenalty
    Created on : May 31, 2022, 1:34:28 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="management.dto.RewardPenaltyDTO"%>
<%@page import="management.dao.RewardPenaltyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reward And Penalty</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/globalstyles.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/rowgroup/1.2.0/css/rowGroup.dataTables.min.css">
        <style>
            .title{
                margin-top: 14px
            }

            .btn-primary{
                margin-top: 44px
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:import url="sidebarEmp.jsp"></c:import>
            <div style="margin: 0 16px; width: 100%" class="list__rp">
                <table  class="table table-striped list__rp-table" id="mydatatable">
                    <thead>
                        <tr>
                            <th style="display:none;">Type</th>
                            <th>Name</th>
                            <th>Times</th>
                            <th>Date</th>
                            <th>Reason </th>
                        </tr>
                    </thead>
                    <tbody id="listRp">
                    <c:forEach var="listRpEmp" varStatus="counter" items="${requestScope.listRpEmp}">
                        <tr>
                            <td style="display:none;"><c:choose>
                                    <c:when test="${listRpEmp.status eq  1}">Reward</c:when>
                                    <c:otherwise>Penalty</c:otherwise>
                                </c:choose></td>
                            <td>${listRpEmp.namere}</td> 
                            <td>${listRpEmp.times}</td>
                            <td>${listRpEmp.applicableDate}</td>
                            <td>${listRpEmp.reason}</td> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table> 
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script> 
        <script src="https://cdn.datatables.net/rowgroup/1.2.0/js/dataTables.rowGroup.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#mydatatable').DataTable({
                    order: [[0, 'asc']],
                    rowGroup: {
                        endRender: null,
                        startRender: function (rows, group) {
                            return group + ' (' + rows.count() + ')';
                        },
                        dataSrc: 0
                    }
                });
            });
        </script>
    </body>
</html>
