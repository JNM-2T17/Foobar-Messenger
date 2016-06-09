<%-- 
    Document   : index
    Created on : Jan 7, 2012, 1:39:14 PM
    Author     : miguelgomez
--%>

<%@page import="dbhandler.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foobar Messenger</title>
    </head>
    <body>
        <br/>
        <br/>
        <%
            User loggedInUser = null;
            //Check if user is already logged in
            loggedInUser = (User)session.getAttribute("session_user");
            //If logged in, redirect to main page. Otherwise, return to this page
            if(loggedInUser != null && loggedInUser.isLoggedIn()){
                response.sendRedirect("main.jsp");
            }
        %>
        <br/>
        <center>
            <form name="login" action="AuthenticateSrv" method="post">
                <table>
                    <tr>
                        <td>Login Page</td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="user_name" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="user_password" size="15"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="bt_login" value="Login"/></td>
                        <td><input type="reset" name="bt_reset" value="Clear"/></td>
                    </tr>
                    <tr><td colspan="2"><a href="register.jsp">Register Here</a></td></tr>
                </table>
            </form>
        </center>
    </body>
</html>
