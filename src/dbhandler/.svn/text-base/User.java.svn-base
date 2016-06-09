/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbhandler;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.owasp.esapi.errors.EncryptionException;
import org.owasp.esapi.errors.AuthenticationException;
import org.owasp.esapi.errors.AuthenticationHostException;
import security.AccessManager;

/**
 * This class represents user attributes present in the application
 * @author miguelgomez
 */
public class User implements org.owasp.esapi.User{
    /**
     * User attributes identical to those in the database.
     */
    protected int user_id;
    protected boolean isLoggedIn;
    protected String user_name;
    protected String user_first_name;
    protected String user_last_name;
    protected String user_email;
    protected String user_mail_address;/*
    protected boolean create_user_right;
    protected boolean edit_user_right;
    protected boolean delete_user_right;
    protected boolean post_msg_right;
    protected boolean view_msg_right;
    protected boolean delete_msg_right;*/
    protected boolean[] access_rules;
    protected HttpSession session;
    
    //The following lists get and set methods for the attributes above
    
    public User(){
        this.access_rules = new boolean[6];
    }
    
    public void setLoggedIn(boolean isLoggedIn){
        this.isLoggedIn = isLoggedIn;
    }
    
    public void setUserID(int user_id){
        this.user_id = user_id;
    }
    
    public int getUserID(){
        return this.user_id;
    }
    
    public void setUserName(String user_name){
        this.user_name = user_name;
    }
    
    public String getUserName(){
        return this.user_name;
    }
    
    public void setUserFirstName(String user_first_name){
        this.user_first_name = user_first_name;
    }
    
    public String getUserFirstName(){
        return this.user_first_name;
    }
    
    public void setUserLastName(String user_last_name){
        this.user_last_name = user_last_name;
    }
    
    public String getUserLastName(){
        return this.user_last_name;
    }
    
    public void setUserEmail(String user_email){
        //Validate user email first via ESAPI
        this.user_email = user_email;
    }
    
    public String getUserEmail(){
        return this.user_email;
    }
    
    public void setUserMailAddress(String user_mail_address){
        this.user_mail_address = user_mail_address;
    }
    
    public String getUserMailAddress(){
        return this.user_mail_address;
    }
    
    public void setCreateUserRight(boolean create_user_right){
        this.access_rules[Integer.parseInt(AccessManager.CREATE_USER)] = create_user_right;
    }
    
    public boolean getCreateUserRight(){
        return this.access_rules[Integer.parseInt(AccessManager.CREATE_USER)];
    }
    
    public void setEditUserRight(boolean edit_user_right){
        this.access_rules[Integer.parseInt(AccessManager.EDIT_USER)] = edit_user_right;
    }
    
    public boolean getEditUserRight(){
        return this.access_rules[Integer.parseInt(AccessManager.EDIT_USER)];
    }
    
    public void setDeleteUserRight(boolean delete_user_right){
        this.access_rules[Integer.parseInt(AccessManager.DELETE_USER)] = delete_user_right;
    }
    
    public boolean getDeleteUserRight(){
        return this.access_rules[Integer.parseInt(AccessManager.DELETE_USER)];
    }
    
    public void setPostMsgRight(boolean post_msg_right){
        this.access_rules[Integer.parseInt(AccessManager.POST_MESSAGE)] = post_msg_right;
    }
    
    public boolean getPostMsgRight(){
        return this.access_rules[Integer.parseInt(AccessManager.POST_MESSAGE)];
    }
    
    public void setViewMsgRight(boolean view_msg_right){
        this.access_rules[Integer.parseInt(AccessManager.VIEW_MESSAGE)] = view_msg_right;
    }
    
    public boolean getViewMsgRight(){
        return this.access_rules[Integer.parseInt(AccessManager.VIEW_MESSAGE)];
    }
    
    public void setDeleteMsgRight(boolean delete_msg_right){
        this.access_rules[Integer.parseInt(AccessManager.DELETE_MESSAGE)] = delete_msg_right;
    }
    
    public boolean getDeleteMsgRight(){
        return this.access_rules[Integer.parseInt(AccessManager.DELETE_MESSAGE)];
    }

    @Override
    public Locale getLocale() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setLocale(Locale locale) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void addRole(String string) throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void addRoles(Set<String> set) throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void changePassword(String string, String string1, String string2) throws AuthenticationException, EncryptionException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void disable() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void enable() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public long getAccountId() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getAccountName() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getCSRFToken() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Date getExpirationTime() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int getFailedLoginCount() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getLastHostAddress() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Date getLastFailedLoginTime() throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Date getLastLoginTime() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Date getLastPasswordChangeTime() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Set<String> getRoles() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getScreenName() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void addSession(HttpSession hs) {
        this.session = hs;
    }

    @Override
    public void removeSession(HttpSession hs) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Set getSessions() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void incrementFailedLoginCount() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isAnonymous() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isEnabled() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isExpired() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isInRole(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isLocked() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isLoggedIn() {
        return this.isLoggedIn;
    }

    @Override
    public boolean isSessionAbsoluteTimeout() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isSessionTimeout() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void lock() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void loginWithPassword(String string) throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void logout() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void removeRole(String string) throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String resetCSRFToken() throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setAccountName(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setExpirationTime(Date date) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setRoles(Set<String> set) throws AuthenticationException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setScreenName(String string) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void unlock() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean verifyPassword(String string) throws EncryptionException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setLastFailedLoginTime(Date date) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setLastHostAddress(String string) throws AuthenticationHostException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setLastLoginTime(Date date) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void setLastPasswordChangeTime(Date date) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public HashMap getEventMap() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getName() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
