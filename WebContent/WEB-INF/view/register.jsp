<%-- 
    Document   : register
    Created on : Jan 14, 2012, 3:50:26 PM
    Author     : miguelgomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <form name="registrator" method="post" action="doRegister">
            <table>
                <tr>
                    <td>Username: </td>
                    <td><input type="text" name="user_name"/></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="user_password"/></td>
                </tr>
                <tr>
                    <td>First Name: </td>
                    <td><input type="text" name="user_first_name"/></td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td><input type="text" name="user_last_name"/></td>
                </tr>
                <tr>
                    <td>E-Mail: </td>
                    <td><input type="text" name="user_email"/></td>
                </tr>
                <tr>
                    <td>Snail Mail: </td>
                    <td><input type="text" name="user_mail_address"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="bt_submit"/></td>
                    <td><input type="reset" name="bt_clear"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
