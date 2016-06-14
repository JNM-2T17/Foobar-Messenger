<%-- 
    Document   : main
    Created on : Jan 15, 2012, 11:57:26 AM
    Author     : miguelgomez
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="dbhandler.Message"%>
<jsp:include page="header.jsp"/>

    	<h1 id="dockHeader">Messenger Dock</h1>
        <div id="sidebar">
			<ul>
				<li>Welcome, ${sessionScope.session_user.userName }</li>
				<li>Profile</li>
				<li>Users</li>
				<li><a href="doComposeMessage">Compose</a></li>
				<li><a href="LogoutServ">Logout</a></li>
			</ul>
		</div>                    
		<div id="content">
			<h2 id="inboxLabel">Inbox</h2>
        	<table id="inbox">
           	<c:forEach items="${sessionScope.session_inbox }" var="message">
          		<tr><td>
          			<a href="message?mid=${message.msgID }&rid=${message.senderID }">
          				${message.senderName } : ${message.msgSubject }
          			</a>
          		</td></tr>
           	</c:forEach>
			</table>
		</div>
    </body>
</html>
