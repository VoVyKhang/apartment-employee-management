<%-- 
    Document   : Hall
    Created on : May 29, 2022, 1:33:53 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>

        <style>
            .hall-img{
                position: relative;
                background-image: url(images/waitingscreen.jpg);
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .hall-link{
                position: absolute;
                top: 40px;
                right: 60px;
                font-size: 24px;
                padding: 4px 12px;
                background-color: #fff;
                border-radius: 4px
            }

            .hall-link a{
                text-decoration: none;
                color: #1c3c53;
                font-weight: 600
            }

            .hall-link a:hover{
                cursor: pointer;
                opacity: 0.7
            }


            .hall-title{
                position: absolute;
                top: 24px;
                left: 10px;
                font-size: 24px;
                border: 2px solid #fff;
                padding: 10px 56px
            }

            .hall-title h3{
                margin: 0;
                color: #fff
            }
        </style>
    </head>
    <body>
        <div>
            <div class="hall-img">

            </div>

            <div class="hall-title">
                <h3>HAPPINESS DEPARTMENT</h3>
            </div>


            <div class="hall-link">
                <a  href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:3030/apartment-employee-management/LoginGoogleController&response_type=code
                    &client_id=981322887444-l8jbe7meq63lgooss90ks3o1en14nom3.apps.googleusercontent.com&approval_prompt=force">
                    Login 
                </a>
            </div>    
        </div>
    </body>
</html>
