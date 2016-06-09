/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import dbhandler.User;
import org.owasp.esapi.errors.AccessControlException;

/**
 *
 * @author miguelgomez
 */
public class AccessManager implements org.owasp.esapi.AccessController{

    //System permissions
    public static final String CREATE_USER = "0";
    public static final String EDIT_USER = "1";
    public static final String DELETE_USER = "2";
    public static final String POST_MESSAGE = "3";
    public static final String VIEW_MESSAGE = "4";
    public static final String DELETE_MESSAGE = "5";
    
    protected User loggedInUser;
    
    public AccessManager(User loggedInUser){
        this.loggedInUser = loggedInUser;
    }
    
    @Override
    public boolean isAuthorized(Object o, Object o1) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void assertAuthorized(Object o, Object o1) throws AccessControlException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isAuthorizedForURL(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isAuthorizedForFunction(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isAuthorizedForData(String string, Object o) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isAuthorizedForFile(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isAuthorizedForService(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void assertAuthorizedForURL(String string) throws AccessControlException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void assertAuthorizedForFunction(String string) throws AccessControlException {
        //Authorize for user creation
        if(string.equals(CREATE_USER) && !loggedInUser.getCreateUserRight()){
            throw new AccessControlException("You cannot create a new user", 
                                             "Unauthorized user creation attempted");
        //Authorize for user editing
        }if(string.equals(EDIT_USER) && !loggedInUser.getEditUserRight()){
            throw new AccessControlException("You cannot edit an existing user", 
                                             "Unauthorized user modification attempted");
        //Authorize for user deletion
        }if(string.equals(DELETE_USER) && !loggedInUser.getDeleteUserRight()){
            throw new AccessControlException("You cannot delete an existing user", 
                                             "Unauthorized user deletion attempted");
        //Authorize for message creation
        }if(string.equals(POST_MESSAGE) && !loggedInUser.getPostMsgRight()){
            throw new AccessControlException("You cannot post a new message", 
                                             "Unauthorized message construction attempted");
        //Authorize for message viewing
        }if(string.equals(VIEW_MESSAGE) && !loggedInUser.getViewMsgRight()){
            throw new AccessControlException("You cannot view an existing message", 
                                             "Unauthorized message viewing attempted");
        //Authorize for messae deletion
        }if(string.equals(DELETE_MESSAGE) && !loggedInUser.getDeleteMsgRight()){
            throw new AccessControlException("You cannot delete an existing message", 
                                             "Unauthorized message deleting attempted");
        //Disable all authorization
        }
    }

    @Override
    public void assertAuthorizedForData(String string, Object o) throws AccessControlException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void assertAuthorizedForFile(String string) throws AccessControlException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void assertAuthorizedForService(String string) throws AccessControlException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
