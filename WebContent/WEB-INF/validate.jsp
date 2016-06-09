<%-- 
    Document   : validate
    Created on : Jan 19, 2012, 1:04:44 PM
    Author     : miguelgomez
--%>

<%@page import="dbhandler.Hasher"%>
<%@page import="dbhandler.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String challenge = "";
    User loggedInUser = null;
    String storedSalt = "";
    String clientToken = "";
    String clientAddress = "";
    Hasher hashGenerator = null;
    //Check if user is already logged in
    loggedInUser = (User)session.getAttribute("session_user");
    //If not logged in, redirect to the login page. 
    
    if(loggedInUser == null || 
       !loggedInUser.isLoggedIn()){
        response.sendRedirect("/SECPROG-SAMPLE");
    }else{
        //Get session salt
        storedSalt = (String)session.getAttribute("session_salt");
        //Get user address
        clientAddress = request.getRemoteAddr();
        //Initialize hash generator
        hashGenerator = new Hasher(Hasher.SHA256);
        hashGenerator.updateHash(clientAddress, "UTF-8");
        hashGenerator.updateHash(storedSalt, "UTF-8");
        challenge = hashGenerator.getHashBASE64();
        //Get client token
        clientToken = (String)session.getAttribute("session_token");
        //Check if the token does not exist or does not match
        if(clientToken == null || !clientToken.equals(challenge)){
            response.sendRedirect("index.jsp");
        }
    }
%>
