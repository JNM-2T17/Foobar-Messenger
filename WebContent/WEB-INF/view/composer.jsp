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
        <h1>Messenger</h1>
        <form name="messenger" method="post" action="doSendMessage">
            <table>
                <tr>
                    <td>From:</td>
                    <td>${sessionScope.session_user.userName }</td>
                </tr>
                <tr>
                    <td>To:</td>
                    <td>
                        <select name="msg_to">
                        <c:forEach items="${sessionScope.session_recipients }" var="recip">
                        	<option value="${recip.key }">${recip.value }</option>
                        </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Subject:</td>
                    <td><input type="text" name="msg_subj"/></td>
                </tr>
                <tr>
                    <td colspan="2"><textarea name="msg_body">Hello World</textarea></td>
                </tr>
                <tr>
                    <td><input type="submit" name="bt_submit"/></td>
                    <td><input type="reset" name="bt_reset"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
