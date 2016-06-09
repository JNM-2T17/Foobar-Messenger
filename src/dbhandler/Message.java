/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbhandler;

import java.sql.Date;

/**
 * This class represents a message received by a user.
 * @author miguelgomez
 */
public class Message {
    //These represent attributes of a message
    protected int msg_id;
    protected int sender_id;
    protected Date msg_date;
    protected String msg_body;
    protected int receiver_id;
    protected String sender_name;
    protected String msg_subject;
   
    //These are the necessary getter and setter methods for the above attributes
    public void setMsgID(int msg_id){
        this.msg_id = msg_id;
    }
    
    public int getMsgID(){
        return this.msg_id;
    }
    
    public void setSenderID(int sender_id){
        this.sender_id = sender_id;
    }
    
    public int getSenderID(){
        return this.sender_id;
    }
    
    public void setMsgDate(Date msg_date){
        this.msg_date = msg_date;
    }
    
    public Date getMsgDate(){
        return this.msg_date;
    }
    
    public void setMsgBody(String msg_body){
        this.msg_body = msg_body;
    }
    
    public String getMsgBody(){
        return this.msg_body;
    }
    
    public void setReceiverID(int receiver_id){
        this.receiver_id = receiver_id;
    }
    
    public int getReceiverID(){
        return this.receiver_id;
    }
    
    public void setSenderName(String sender_name){
        this.sender_name = sender_name;
    }
    
    public String getSenderName(){
        return this.sender_name;
    }
    
    public void setMsgSubject(String msg_subject){
        this.msg_subject = msg_subject;
    }
    
    public String getMsgSubject(){
        return this.msg_subject;
    }
}
