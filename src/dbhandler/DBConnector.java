package dbhandler;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import security.BCrypt;

public class DBConnector {
	private String driverName;
	private String url;
	private String dbName;
	private String username;
	private String password;
	private Connection connection;
	private static DBConnector instance = null;

	/*
	  	DBManager test = new DBManager("com.mysql.jdbc.DriverManager"
									,"jdbc:mysql://127.0.0.1:3306/"
									,"db_hpq","root","fuckmedikotopassword");
	*/
	
	private DBConnector(String driverName,String url,String dbName
						,String username,String password) {
		this.driverName = driverName; //com.mysql.jdbc.DriverManager
		this.url = url; //jdbc.mysql://127.0.0.1:3306/
		this.dbName = dbName; //db_hpq
		this.username = username; //root
		this.password = password;
	}
	
	/**
     * This method is used to instantiate a connection with the database server
     */
    public void connectToDB() throws ClassNotFoundException, SQLException{
        //Instantiate MySQL driver and create connection
        connection = getConnection();
    }
    
    public void disconnectDB() throws SQLException{
        this.connection.close();
    }

	public Connection getConnection() {
		try {
			return DriverManager.getConnection(url + dbName,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static DBConnector getInstance(){
		if(instance!=null){
			return instance;
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			instance = new DBConnector("com.mysql.jdbc.DriverManager"
					,"jdbc:mysql://127.0.0.1:3306/"
					,"foobar","root","");
			return instance;
		}
	}
}
