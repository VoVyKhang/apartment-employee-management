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
        <link rel="stylesheet" href="./css/header.css"/>

    </head>
    <body>
        <div class="header__container">
            <div class="header__navbar">
                <div class="header__logo">
                    <a  href="mainController?action=showlist">
                        <img src="images/logo.jpg" class="header__logo-img">
                    </a>
                </div>
                
                <div class="header__user">
                    <img 
                        src="./images/sun.jpg" 
                        alt="" 
                        class="header__user-img"
                    >
                    <span class="header__user-name">Xuan Bach</span>
                      
                      <ul class="header__user-menu">
                        
                        <li class="header__user-item">
                          <a href="logoutController?action=logout">Logout</a>
                        </li>
                      </ul>
                    
                </div>
            </div>
        </div>
    </body>
</html>
