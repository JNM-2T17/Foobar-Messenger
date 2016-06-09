/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dbhandler.DBConnector;
import dbhandler.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.owasp.esapi.errors.AccessControlException;
import security.AccessManager;

/**
 *
 * @author miguelgomez
 */
@WebServlet(name = "Sender", urlPatterns = {"/Sender"})
public class doSendMessage extends HttpServlet {

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
        int recipientID = -1;
        String body = null;
        String subject = null;
        User loggedInUser = null;
        HttpSession userSession = null;
        DBConnector dbConnector = null;
        AccessManager accessSession = null;
        PrintWriter out = response.getWriter();

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
                //Get input data
                recipientID = Integer.parseInt(request.getParameter("msg_to"));
                subject = request.getParameter("msg_subj");
                body = request.getParameter("msg_body");
                //Validate input data
                //Access DB and extract recipient list
                dbConnector = new DBConnector("localhost", 3306, "root", "sandb0x1234", "foobar");
                //Send message
                dbConnector.sendMessage(loggedInUser.getUserID(), 
                                        recipientID, 
                                        subject, 
                                        body);
                //Redirect to messenger page
                response.sendRedirect("main.jsp");
                
            }else{
                response.sendRedirect("index.jsp");
            }
        } catch (AccessControlException ex) {
            Logger.getLogger(doSendMessage.class.getName()).log(Level.SEVERE, null, ex);
            //Log this properly
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Extract.class.getName()).log(Level.SEVERE, null, ex);
            //Log this properly
        } catch (SQLException ex) {
            Logger.getLogger(Extract.class.getName()).log(Level.SEVERE, null, ex);
            //Log this properly
        } finally {            
            out.close();
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
