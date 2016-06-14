<%-- 
    Document   : messenger
    Created on : Jan 12, 2012, 6:53:36 PM
    Author     : miguelgomez
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foobar Messenger</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    </head>
    <body class="center">
    	<div id="contentFull">
	        <h1 id="loginHeader">Messenger</h1>
	        <form name="messenger" method="post" action="doSendMessage">
	            <table id="messenger">
	                <tr>
	                    <td class="inputLabel">From:</td>
	                    <td class="inputContent">${sessionScope.session_user.userName }</td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">To:</td>
	                    <td class="inputContent">
	                        <select name="msg_to">
	                        <c:forEach items="${sessionScope.session_recipients }" var="recip">
	                        	<option value="${recip.key }">${recip.value }</option>
	                        </c:forEach>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">Subject:</td>
	                    <td class="inputContent"><input type="text" name="msg_subj"/></td>
	                </tr>
	                <tr>
	                    <td class="inputLabel">Body:</td>
	                    <td class="inputContent"><textarea name="msg_body"></textarea></td>
	                </tr>
	            </table>
	            <div>
	            	<input type="submit" class="formButton" name="bt_submit"/>
	                <input type="reset" class="formButton" name="bt_reset"/>
	                <a href="/Foobar-Messenger" class="linkButton">Back</a>
	            </div>
	        </form>
	    </div>
    </body>
</html>
