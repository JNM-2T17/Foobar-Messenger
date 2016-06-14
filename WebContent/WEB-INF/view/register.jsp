<%-- 
    Document   : register
    Created on : Jan 14, 2012, 3:50:26 PM
    Author     : miguelgomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="header.jsp"/>

    	<div id="contentFull">
    		<h1 id="loginHeader">Register User</h1>
	        <form name="registrator" method="post" action="doRegister">
	            <table id="register">
	                <tr>
	                    <td class="inputLabel">Username: </td>
	                    <td class="inputContent"><input type="text" name="user_name"/></td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">Password: </td>
	                    <td class="inputContent"><input type="password" name="user_password"/></td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">First Name: </td>
	                    <td class="inputContent"><input type="text" name="user_first_name"/></td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">Last Name: </td>
	                    <td class="inputContent"><input type="text" name="user_last_name"/></td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">E-Mail: </td>
	                    <td class="inputContent"><input type="text" name="user_email"/></td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">Snail Mail: </td>
	                    <td class="inputContent"><input type="text" name="user_mail_address"/></td>
	                </tr>
	            </table>
	            <div class="centerButtons">
                    <input type="submit" class="formButton" name="bt_submit"/>
                    <input type="reset" class="formButton" name="bt_clear"/>
	                <a href="/Foobar-Messenger" class="linkButton">Back</a>
                </div>
	        </form>
		</div>
    </body>
</html>
