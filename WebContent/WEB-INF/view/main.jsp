<%-- 
    Document   : main
    Created on : Jan 15, 2012, 11:57:26 AM
    Author     : miguelgomez
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="dbhandler.Message"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foobar Messenger</title>
    <body>
        <table width="100%">
            <th>Messenger Dock</th>
            <tr>
                <td width="25%">
                    <table width="100%">
                        <%--
                        Check user authorizations here
                        --%>
                        <tr><td>Welcome, ${sessionScope.session_user.userName }</td></tr>
                        <tr><td>Profile</td></tr>
                        <tr><td>Users</td></tr>
                        <tr><td><a href="doComposeMessage">Compose</a></td></td>
                        <tr><td><a href="LogoutServ">Logout</a></td></tr>
                    </table>
                </td>
                <td width="75%">
                    <table width="100%">
                    	<c:forEach items="${sessionScope.session_inbox }" var="message">
                   		<tr><td>
                   			<a href="message?mid=${message.msgID }&rid=${message.senderID }">
                   				${message.senderName } : ${message.msgSubject }
                   			</a>
                   		</td></tr>
                    	</c:forEach>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
