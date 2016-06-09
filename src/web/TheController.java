package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.esapi.errors.AccessControlException;
import org.owasp.esapi.errors.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import security.AccessManager;
import security.Authenticator;

import com.google.gson.Gson;

import dbhandler.DBManager;
import dbhandler.Hasher;
import dbhandler.Randomizer;
import dbhandler.User;

@Controller
public class TheController {
	@RequestMapping("/")
	public void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( checkUser(request,response) ) {
			request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request, response);
		}
	}
	
	@RequestMapping("/authenticate")
	public void authenticate(@RequestParam(value="user_name")String userName,
							 @RequestParam(value="user_password")String userPassword,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            response.setContentType("text/html;charset=UTF-8");
            User loggedInUser = null;
            String clientSalt = null;
            String clientToken = null;
            String clientAddress = null;
            HttpSession userSession = null;
            AccessManager accessSession = null;
            Hasher hashGenerator = new Hasher(Hasher.SHA256);
            Randomizer randomGenerator = new Randomizer(1234);
            Authenticator authenticator = new Authenticator();
            //Log in and return user details
            loggedInUser = (User) authenticator.login(request, response);
            //Create session information
            if(loggedInUser != null && loggedInUser.isLoggedIn()){
                //Generate a new session
                request.getSession().invalidate();
                userSession = request.getSession(true);
                //Set timeout to 10 minutes
                userSession.setMaxInactiveInterval(600);
                //Get client IP Address
                clientAddress = request.getRemoteAddr();
                //Generate unique salt value
                clientSalt = Long.toString(randomGenerator.getRandomLong());
                //Generate hash for client token
                hashGenerator.updateHash(clientAddress, "UTF-8");
                hashGenerator.updateHash(clientSalt, "UTF-8");
                clientToken = hashGenerator.getHashBASE64();
                //Save hash and salt in session
                userSession.setAttribute("session_salt", clientSalt);
                //Save token in session
                userSession.setAttribute("session_token", clientToken);
                //Create new access manager
                accessSession = new AccessManager(loggedInUser);
                //Save user to session
                userSession.setAttribute("session_user", loggedInUser);
                //Save access manager to session
                userSession.setAttribute("session_access", accessSession);
                loggedInUser.addSession(userSession);
                //Redirect to main page
                response.sendRedirect("Extract");
            }else{
                //Get client remote address
                //Get 
                //Redirect to log in page
            	if( checkUser(request,response) ) {
            		request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request,response);
            	}
            }
        } catch (NoSuchAlgorithmException ex) {
            //Log properly
            ex.printStackTrace();
        } catch (AuthenticationException ex) {
            //Log properly
            ex.printStackTrace();
        }
	}
	
	@RequestMapping("/deleter")
	public void deleter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO
	}
	
	@RequestMapping("/Extract")
	public void extract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loggedInUser = null;
        HttpSession userSession = null;
        Object[] inbox = null;
        DBManager dbConnector = null;
        try {
            //Extract user from session
            userSession = request.getSession();
            loggedInUser = (User) userSession.getAttribute("session_user");
            //Check if user is logged in
            if(loggedInUser != null &&
               loggedInUser.isLoggedIn()){
                //Assert authentication validity
                Authenticator.assertCurrentUser(userSession, request.getRemoteAddr());
                //Validate user rights first
                
                //Access DB and extract inbox
                dbConnector = DBManager.getInstance();
                inbox = dbConnector.getUserMessages(loggedInUser.getUserID());
                //Add inbox to session
                userSession.setAttribute("session_inbox", inbox);
                //Redirect to main page
                if( validate(request,response) ) {
                    request.getRequestDispatcher("WEB-INF/view/main.jsp").forward(request,response);
                }
            }else{
            	if( checkUser(request,response) ) {
            		request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request,response);
            	}
            }
        } catch (AuthenticationException ex) {
            ex.printStackTrace();
        } catch (NoSuchAlgorithmException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException ex) {
        	ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
        	ex.printStackTrace();
            //Log this properly
        } catch (SQLException ex) {
        	ex.printStackTrace();
            //Log this properly
        }
	}
	
	@RequestMapping("/LogoutServ")
	public void logoutServ(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = null;
        Cookie sessionCookie = null;
        HttpSession userSession = null;
        
        //Extract user from session
        userSession = request.getSession();
        //Invalidate user session
        userSession.invalidate();
        //Get cookies
        cookies = request.getCookies();
        for(int index = 0; index < cookies.length; index++){
            if(cookies[index].getName().equals("session_token")){
                sessionCookie = cookies[index];
                break;
            }
        }
        sessionCookie.setMaxAge(0);
        response.addCookie(sessionCookie);
        //Redirect back to login
        response.sendRedirect("/");
	}
	
	@RequestMapping("/MessageComposer")
	public void messageComposer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loggedInUser = null;
        HttpSession userSession = null;
        HashMap recipients = null;
        DBManager dbConnector = null;
        PrintWriter out = response.getWriter();

        try {
            //Extract user from session
            userSession = request.getSession();
            loggedInUser = (User) userSession.getAttribute("session_user");
            //Check if user is logged in
            if(loggedInUser != null &&
               loggedInUser.isLoggedIn()){
                //Assert authentication validity
                Authenticator.assertCurrentUser(userSession, request.getRemoteAddr());
                //Validate user rights first
                
                //Access DB and extract recipient list
                dbConnector = DBManager.getInstance();
                recipients = dbConnector.getRecipientList(loggedInUser.getUserID());
                //Add recipient list to session
                userSession.setAttribute("session_recipients", recipients);
                //Redirect to messenger page
                if( validate(request,response) ) {
                    request.getRequestDispatcher("WEB-INF/view/composer.jsp");
                }
            }else{
            	if( checkUser(request,response) ) {
            		request.getRequestDispatcher("WEB-INF/view/index.jsp");
            	}
            }
        } catch (AuthenticationException ex) {
            ex.printStackTrace();
        } catch (NoSuchAlgorithmException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException ex) {
        	ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
        	ex.printStackTrace();
            //Log this properly
        } catch (SQLException ex) {
        	ex.printStackTrace();
            //Log this properly
        }
	}
	
	@RequestMapping("/register")
	public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/register.jsp").forward(request,response);
	}
	
	public boolean checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loggedInUser = null;
        //Check if user is already logged in
        loggedInUser = (User)(request.getSession().getAttribute("session_user"));
        //If logged in, redirect to main page. Otherwise, return to this page
        if(loggedInUser != null && loggedInUser.isLoggedIn()){
        	if( validate(request,response) ) {
                request.getRequestDispatcher("WEB-INF/view/main.jsp").forward(request,response);
        	}
            return false;
        }
        return true;
	}
	
	public boolean validate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String challenge = "";
		    User loggedInUser = null;
		    String storedSalt = "";
		    String clientToken = "";
		    String clientAddress = "";
		    Hasher hashGenerator = null;
		    //Check if user is already logged in
		    loggedInUser = (User)(request.getSession().getAttribute("session_user"));
		    //If not logged in, redirect to the login page. 
		    
		    if(loggedInUser == null || 
		       !loggedInUser.isLoggedIn()){
		        home(request,response);
		    }else{
		        //Get session salt
		        storedSalt = (String)request.getSession().getAttribute("session_salt");
		        //Get user address
		        clientAddress = request.getRemoteAddr();
		        //Initialize hash generator
				hashGenerator = new Hasher(Hasher.SHA256);
		        hashGenerator.updateHash(clientAddress, "UTF-8");
		        hashGenerator.updateHash(storedSalt, "UTF-8");
		        challenge = hashGenerator.getHashBASE64();
		        //Get client token
		        clientToken = (String)request.getSession().getAttribute("session_token");
		        //Check if the token does not exist or does not match
		        if(clientToken == null || !clientToken.equals(challenge)){
		            request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request,response);
		        } else {
		        	return true;
		        }
		    }
	    } catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	@RequestMapping("/doRegister")
	@ResponseBody
	public void registrator(@RequestParam(value="user_name") String userName,
				            @RequestParam(value="user_password") String userPassword,
				            @RequestParam(value="user_first_name") String userFirstName,
				            @RequestParam(value="user_last_name") String userLastName,
				            @RequestParam(value="user_email") String userEmail,
				            @RequestParam(value="user_mail_address") String userMailAddress,
            HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBManager dbConnector = null;
        
        try {
            //Get user information
            //Validate user information
            dbConnector = DBManager.getInstance();
            //Create new user
            dbConnector.createUser(2, userName, userPassword, userFirstName, userLastName, userEmail, userMailAddress);
            //Redirect to login page
            if( checkUser(request,response) ) {
            	request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request,response);
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            //Log this properly
        } catch (SQLException ex) {
            ex.printStackTrace();
            //Log this properly
        } finally {        
        }
	}
	
	@RequestMapping("/registrator")
	@ResponseBody
	public void sender(@RequestParam(value="msg_to") int recipientID,
					   @RequestParam(value="msg_subj") String subject,
			           @RequestParam(value="msg_body") String body,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loggedInUser = null;
        HttpSession userSession = null;
        DBManager dbConnector = null;
        AccessManager accessSession = null;
        
        try {
            //Extract user from session
            userSession = request.getSession();
            loggedInUser = (User) userSession.getAttribute("session_user");
            accessSession = (AccessManager) userSession.getAttribute("session_access");
            //Check if user is logged in
            if(loggedInUser != null &&
               loggedInUser.isLoggedIn()){
                //Validate user rights first
                accessSession.assertAuthorizedForFunction(AccessManager.POST_MESSAGE);
                //Validate input data
                //Access DB and extract recipient list
                dbConnector = DBManager.getInstance();
                //Send message
                dbConnector.sendMessage(loggedInUser.getUserID(), 
                                        recipientID, 
                                        subject, 
                                        body);
                //Redirect to messenger page
                if( validate(request,response) ) {
                	request.getRequestDispatcher("WEB-INF/view/main.jsp").forward(request,response);
                }
            }else{
            	if(checkUser(request,response)) {
            		request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request,response);
            	}
            }
        } catch (AccessControlException ex) {
            ex.printStackTrace();
            //Log this properly
        } catch (ClassNotFoundException ex) {
        	ex.printStackTrace();
            //Log this properly
        } catch (SQLException ex) {
        	ex.printStackTrace();
            //Log this properly
        }
	}
}
