<%-- 
    Document   : messenger
    Created on : Jan 12, 2012, 6:53:36 PM
    Author     : miguelgomez
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="validate.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foobar Messenger</title>
    </head>
    <body>
        <center>
            <h1>Messenger</h1>
            <form name="messenger" method="post" action="doSendMessage">
                <table>
                    <tr>
                        <td>From:</td>
                        <td><%out.print(loggedInUser.getUserName());%></td>
                    </tr>
                    <tr>
                        <td>To:</td>
                        <td>
                            <select name="msg_to">
                                <%
                                    int index = 0;
                                    int userID = -1;
                                    String userName = null;
                                    HashMap recipients = (HashMap)session.getAttribute("session_recipients");
                                    Object[] keys = recipients.keySet().toArray();
                                    for(index = 0; index < keys.length; index++){
                                        userID = Integer.parseInt(String.valueOf(keys[index]));
                                        userName = (String)recipients.get(userID);
                                        out.print("<option value='"+userID+"'>");
                                        out.print(userName);
                                        out.println("</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Subject:</td>
                        <td><input type="text" name="msg_subj"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea name="msg_body" value="Hellow World"></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="bt_submit"/></td>
                        <td><input type="reset" name="bt_reset"/></td>
                    </tr>
                </table>
            </form>
        </center>
    </body>
</html>
