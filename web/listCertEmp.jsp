<%-- 
    Document   : listCertEmp
    Created on : Jun 21, 2022, 11:06:04 AM
    Author     : VyNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
        <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Certificate</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap');
            body{
                font-family: 'Poppins', sans-serif !important;
                background-color: #f7f7f7 !important;
            }

            #sidebar{
                height: 100vh
            }

            .breadcrumb{
                background-color: #f7f7f7 !important;
                margin-left: -16px
            }

            .page-title{
                margin-top: 8px;
                display: inline-block
            }

            .dataTables_length{
                display: flex;
                margin-top: -20px;
            }
            .dataTables_info{
                display: flex;
            }

            #sidebar{
                height: 100vh
            }

            .list-employee__actions{
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .add-btn{
                background-color: #00a8ef;
                border: 1px solid #00c5fb;
                border-radius: 50px;
                color: #fff;
                font-weight: 500;
                min-width: 140px;
                text-decoration: none;
                cursor: pointer;
                padding: 4px 10px;
                display: flex;
            }

            .add-btn:hover{
                opacity: 0.9;
                transform: scale(0.95)
            }
        </style>
    </head>
    <body>
        <c:import url="headerEmp.jsp"></c:import>
        <c:import url="sidebarEmp.jsp"></c:import>
            <div style="margin: 0 16px; width: 100%" class="list__rp">
            <c:if test="${updateSuccess != null}" >
                <h3 style="color: green" ><c:out value="${updateSuccess}" /></h3>
            </c:if>
            <c:if test="${updateFail != null}" >
                <h3 style="color: red" > <c:out value="${updateFail}" /></h3>
            </c:if>
            <sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                               url = "jdbc:sqlserver://localhost:1433;databaseName=EmployeeManagement"
                               user = "sa"  password = "12345"/>

            <sql:query dataSource = "${snapshot}" var = "listcer">
                select cerID, cerName, doi, tc.name as type
                from Certificate as c, TypeCertificate tc
                where c.idTypeCer = tc.idTypeCer and c.idEmp = ${sessionScope.USER_LOGGIN.idEmp}
            </sql:query>
            <div class="page-header">
                <div class="row">
                    <h3 class="page-title">Certificate</h3>
                    <div class="col-sm-12 list-employee__actions">                       
                        <div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="EmployeeHome.jsp">Home</a></li>
                                <li class="breadcrumb-item">Account</li>
                                <li class="breadcrumb-item active"><a href="mainController?action=listCertEmp">Certificate</a></li>
                            </ul>
                        </div>
                        <div style="margin-right: 8px">          
                            <a class="add-btn" href="mainController?action=addNewCertPage">
                                <i class="ri-add-fill list__employee-icon"></i>
                                Add new certificate
                            </a>
                        </div>
                    </div>
                </div>
            </div>


            <div >
                <form action="mainController" method="post" class="form-reward-penalty">
                    <div class="row justify-content-center" style=" margin-bottom: -16px">
                        <div class="col-md-auto"> 
                            <br>
                            <select class="form-select form-select-md-5 mb-1 list-options" name="month" id="month"> 
                                <option value="all" >All Month</option>
                                <option value="1" >January</option>
                                <option value="2" >February</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >August</option>
                                <option value="9" >September</option>
                                <option value="10" >October</option>
                                <option value="11" >November</option>
                                <option value="12" >December</option>
                            </select>
                        </div> 
                    </div>  
                </form>
                <table class="table table-bordered list__rp-table" id="mydatatable">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Day of get</th>
                            <th scope="col">Type</th>
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody id="listRp">
                        <c:forEach var = "rowcer" items = "${listcer.rows}">
                        <form action="mainController" method="POST">
                            <tr>
                                <td><input type="hidden" name="cerName" value="${rowcer.cerName}"/>${rowcer.cerName}</td>
                                <td><input type="hidden" name="cerDoi" value="${rowcer.doi}"/>${rowcer.doi}</td>
                                <td><input type="hidden" name="cerType" value="${rowcer.type}"/>${rowcer.type}</td>
                                <td>
                                    <input type="hidden" name="action" value="updateCertPage"/>
                                    <input type="hidden" name="cerID" value="${rowcer.cerID}"/>
                                    <input class="btn btn-secondary btn-sm" type="submit" value="Edit"/>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

            <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script> 
            <script>
                $('.list__rp').on("change", 'select', function () {
                    var month = $('#month').val();
                    var table = $("#listRp");
                    var trs = table.find('tr');
                    trs.hide();

                    var filtered = trs.filter(function (index, elem) {
                        var tds = $(elem).find('td');
                        const d = new Date(tds.eq(1).text().trim().toLowerCase());
                        var mo = d.getMonth() + 1;
                        if (month == "all") {
                            return true;
                        }
                        if (mo == month) {
                            return true;
                        }
                    })
                    filtered.show();
                    if (filtered.length == 0) {
                        alert("No Records Found!!!");
                    }
                });
            </script>
            <script>
                $('#mydatatable').DataTable({
                    ordering: false,
                    lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    searching: false
                });
            </script>
            <script>
                $(document).ready(function () {
                    var value = $("div.dataTables_length").closest("div");
                    value.closest("div").removeClass('col-sm-12 col-md-6').addClass('col-sm-12 col-md-1');
                });
            </script>  
    </body>
</html>
