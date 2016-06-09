/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbhandler;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * This class manages all the connections to the backend database
 * @author miguelgomez
 */
public class DBConnector {
    protected int port;
    protected String user;
    protected String dbname;
    protected String server;
    protected String password;
    protected String connString;
    protected Connection connection;
    
    /**
     * This is the constructor, it initializes the necessary server attributes.
     * @param server String representing the server
     * @param port Integer representing the server port number
     * @param user String representing the DB user
     * @param password String representing the DB password
     * @param dbname String representing the DB name
     */
    public DBConnector(String server, int port, String user, String password, String dbname){
        this.server = server;
        this.port = port;
        this.user = user;
        this.password = password;
        this.dbname = dbname;
    }
    
    /**
     * This method is used to instantiate a connection with the database server
     */
    public void connectToDB() throws ClassNotFoundException, SQLException{
        //Instantiate MySQL driver and create connection
        Class.forName("com.mysql.jdbc.Driver");
        connString = "jdbc:mysql://"
                   +this.server
                   +":"
                   +this.port
                   +"/"
                   + this.dbname
                   + "?user="
                   + this.user
                   + "&password="
                   + this.password;
        connection = DriverManager.getConnection(connString);
    }
    
    public void disconnectDB() throws SQLException{
        this.connection.close();
    }
    
    /**
     * This method is used to validate if the user has the appropriate credentials to
     * use the system
     * @param username String representing the user name
     * @param password String representing the hash of the password
     * @return Integer representing the User ID
     * @throws SQLException 
     */
    public int authenticateUser(String username, String password) throws SQLException, ClassNotFoundException{
        int userID = -1;
        CallableStatement callable = null;
        ResultSet result = null;
        String authCall = "{ call validate_user(?,?) }";
        //Connect to the DB
        this.connectToDB();
        //Validate username and password formats
        //Create callable statement to validate user
        callable = this.connection.prepareCall(authCall);
        callable.setString(1, username);
        callable.setString(2, password);
        result = callable.executeQuery();
        //Iterate through result set
        while(result.next()){
            userID = result.getInt("user_id");
        }
        //Close DB connection
        this.disconnectDB();
        return userID;
    }
    
    /**
     * This method extracts essential user information once the user has been authenticated
     * this includes the necessary authorization matrix.
     * @param userID Integer representing the User ID
     * @return User instance containing user information
     * @throws SQLException 
     */
    public User getUserDetails(int userID) throws SQLException, ClassNotFoundException{
        User userDetails = null;
        ResultSet result = null;
        CallableStatement callable = null;
        String detailCall = "{ call get_user(?) }";
        //Connect to DB
        this.connectToDB();
        //Validate user ID
        //Create callable statement to get user details
        callable = this.connection.prepareCall(detailCall);
        callable.setInt(1, userID);
        result = callable.executeQuery();
        //Itereate through result set
        while(result.next()){
            userDetails = new User();
            userDetails.setUserID(userID);
            userDetails.setUserName(result.getString("user_name"));
            userDetails.setUserFirstName(result.getString("user_first_name"));
            userDetails.setUserLastName(result.getString("user_last_name"));
            userDetails.setUserEmail(result.getString("user_email"));
            userDetails.setCreateUserRight(result.getBoolean("create_user_right"));
            userDetails.setEditUserRight(result.getBoolean("edit_user_right"));
            userDetails.setDeleteUserRight(result.getBoolean("delete_user_right"));
            userDetails.setPostMsgRight(result.getBoolean("post_msg_right"));
            userDetails.setViewMsgRight(result.getBoolean("view_msg_right"));
            userDetails.setDeleteMsgRight(result.getBoolean("delete_msg_right"));
        }
        //Close DB connection
        this.disconnectDB();
        return userDetails;
    }
    
    /**
     * This method returns the collection of messages associated to a given user.
     * @param userID Integer representing a user's ID
     * @return An array of Message objects representing the user's inbox.
     */
    public Object[] getUserMessages(int userID) throws ClassNotFoundException, SQLException{
        ArrayList<Message> messageList = null;
        Message message = null;
        ResultSet result = null;
        CallableStatement callable = null;
        String inboxCall = "{ call get_inbox(?) }";
        //Connect to DB
        this.connectToDB();
        //Validate user ID
        //Create callable statement to get inbox
        callable = this.connection.prepareCall(inboxCall);
        callable.setInt(1, userID);
        result = callable.executeQuery();
        //Iterate through the result set
        messageList = new ArrayList<Message>();
        while(result.next()){
            message = new Message();
            message.setMsgID(result.getInt("msg_id"));
            message.setSenderID(result.getInt("sender_id"));
            message.setReceiverID(result.getInt("receiver_id"));
            message.setSenderName(result.getString("sender_name"));
            message.setMsgDate(result.getDate("msg_date"));
            message.setMsgSubject(result.getString("msg_subject"));
            message.setMsgBody(result.getString("msg_body"));
            messageList.add(message);
        }
        this.disconnectDB();
        return messageList.toArray();
    }
    
    /**
     * This methods returns a list of users excluding the one specified as a parameter
     * @param userID Integer representing a usre to be excluded
     * @return HashMap representing user_id and user_name combinations
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public HashMap getRecipientList(int userID) throws SQLException, ClassNotFoundException{
        HashMap recipients = null;
        ResultSet result = null;
        CallableStatement callable = null;
        String recipientCall = "{ call get_recipient_list(?) }";
        //Connect to DB
        this.connectToDB();
        //Validate user ID
        //Create callable statement to get recipients
        callable = this.connection.prepareCall(recipientCall);
        callable.setInt(1, userID);
        result = callable.executeQuery();
        //Iterate through the result set
        recipients = new HashMap();
        while(result.next()){
            recipients.put(result.getInt("user_id"), 
                           result.getString("user_name"));
        }
        this.disconnectDB();
        return recipients;
    }
    
    /**
     * This method is used to send a message to another user
     * @param sender Integer representing the sender
     * @param receiver Integer representing the receiver
     * @param subject String representing the subject
     * @param body String representing the body
     * @throws ClassNotFoundException
     * @throws SQLException 
     */
    public void sendMessage(int sender, int receiver, String subject, String body) throws ClassNotFoundException, SQLException{
        CallableStatement callable = null;
        String sendCall = "{ call send_message(?,?,?,?) }";
        //Connect to DB
        this.connectToDB();
        //Create callable statement to send the message
        callable = this.connection.prepareCall(sendCall);
        callable.setInt(1, sender);
        callable.setInt(2, receiver);
        callable.setString(3, subject);
        callable.setString(4, body);
        callable.executeUpdate();
        this.disconnectDB();
    }
    
    /**
     * This method deletes a given message from the database.
     * @param msgID Integer representing the message to be deleted
     * @throws ClassNotFoundException
     * @throws SQLException 
     */
    public void deleteMessage(int msgID) throws ClassNotFoundException, SQLException{
        CallableStatement callable = null;
        String deleteCall = "{ call delete_message(?,?,?,?) }";
        //Connect to DB
        this.connectToDB();
        //Create callable statement to send the message
        callable = this.connection.prepareCall(deleteCall);
        callable.setInt(1, msgID);
        callable.executeUpdate();
        this.disconnectDB();
    }
    
    public void createUser(int type, String userName, String userPassword,
                           String userFirstName, String userLastName, 
                           String userEmail, String userMailAddress) throws ClassNotFoundException, SQLException{
        CallableStatement callable = null;
        String createCall = "{ call create_user(?,?,?,?,?,?,?) }";
        //Connect to DB
        this.connectToDB();
        //Create callable statement to create a new user
        callable = this.connection.prepareCall(createCall);
        callable.setInt(1, type);
        callable.setString(2, userName);
        callable.setString(3, userPassword);
        callable.setString(4, userFirstName);
        callable.setString(5, userLastName);
        callable.setString(6, userEmail);
        callable.setString(7, userMailAddress);
        callable.executeUpdate();
        this.disconnectDB();
    }
}
