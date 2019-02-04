package com.daesungra.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	
	private Connection conn = null;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userId = "daesungRa";
	private String userPwd = "0000";
	
	public DBConn () {
		try {
			Class.forName(driver);
			this.conn = DriverManager.getConnection(url, userId, userPwd);
		} catch (Exception ex) { ex.printStackTrace(); }
	}
	
	public Connection getConn () {
		return this.conn;
	}
}