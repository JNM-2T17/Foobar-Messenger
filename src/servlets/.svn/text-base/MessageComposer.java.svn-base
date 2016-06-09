/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dbhandler.DBConnector;
import dbhandler.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.owasp.esapi.errors.AuthenticationException;
import security.Authenticator;

/**
 *
 * @author miguelgomez
 */
@WebServlet(name = "MessageComposer", urlPatterns = {"/MessageComposer"})
public class MessageComposer extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User loggedInUser = null;
        HttpSession userSession = null;
        HashMap recipients = null;
        DBConnector dbConnector = null;
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
                dbConnector = new DBConnector("localhost", 3306, "root", "sandb0x1234", "foobar");
                recipients = dbConnector.getRecipientList(loggedInUser.getUserID());
                //Add recipient list to session
                userSession.setAttribute("session_recipients", recipients);
                //Redirect to messenger page
                response.sendRedirect("composer.jsp");
            }else{
                response.sendRedirect("index.jsp");
            }
        } catch (AuthenticationException ex) {
            Logger.getLogger(MessageComposer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(MessageComposer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(MessageComposer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Extract.class.getName()).log(Level.SEVERE, null, ex);
            //Log this properly
        } catch (SQLException ex) {
            Logger.getLogger(Extract.class.getName()).log(Level.SEVERE, null, ex);
            //Log this properly
        } finally {            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
