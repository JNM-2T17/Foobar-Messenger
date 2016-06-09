<%-- 
    Document   : main
    Created on : Jan 15, 2012, 11:57:26 AM
    Author     : miguelgomez
--%>

<%@page import="dbhandler.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validate.jsp" %>
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
                        <tr><td>Profile</td></tr>
                        <tr><td>Users</td></tr>
                        <tr><td><a href="doComposeMessage">Compose</a></td></td>
                        <tr><td><a href="LogoutServ">Logout</a></td></tr>
                    </table>
                </td>
                <td width="75%">
                    <table width="100%">
                        <%
                            int index = 0;
                            Object[] inbox = null;
                            Message message = null;
                            inbox = (Object[])session.getAttribute("session_inbox");
                            if(inbox != null){
                                for(index = 0; index < inbox.length; index++){
                                    message = (Message)inbox[index];
                                    out.print("<tr><td><a href=messenger.jsp?mid="
                                              +message.getMsgID()
                                              +"&rid="
                                              +message.getSenderID()
                                              +">");
                                    out.print(message.getSenderName()
                                              +":"
                                              +message.getMsgSubject());
                                    out.print("</a></td></tr>");
                                }
                            }
                        %>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
