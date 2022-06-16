<%-- 
    Document   : header
    Created on : Feb 2, 2022, 5:37:31 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Header Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width= device-width, initial-scale = 1.0">
        <link rel="stylesheet" href="css/mycss.css" type = "text/css"/>

    </head>
    <body>
        <header>
            <nav class="header">
                <ul class="clearfix">
                    <li >
                        <a  href="mainController?action=showlist"><img style="margin-bottom: 5px" src="images/logo.jpg" id="logo" ></a>
                    </li>
                            
                    <li class="logout" style="float: right; margin-right: 16px">
                            <a href="logoutController?action=logout">Log out</a> 
                        </li>    
                </ul>
            </nav>
        </header>
    </body>
</html>
