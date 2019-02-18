package com.daesungra.component;

import java.sql.Connection;
import java.sql.DriverManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DBConn {
	
	private static final Logger logger = LoggerFactory.getLogger(DBConn.class);
	
	private Connection conn = null;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userId = "daesungRa";
	private String userPwd = "0000";
	
	public DBConn () {
		try {
			Class.forName(driver);
			this.conn = DriverManager.getConnection(url, userId, userPwd);
			
			logger.info("conn 객체 생성 완료!");
		} catch (Exception ex) { ex.printStackTrace(); }
	}
	
	public Connection getConn () {
		return this.conn;
	}
}