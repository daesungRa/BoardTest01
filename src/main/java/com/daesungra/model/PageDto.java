package com.daesungra.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PageDto {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	int listSize;
	int blockSize;
	int nowPage;
	
	int totSize;
	int totPage;
	int totBlock;
	int nowBlock;
	
	int startNo;
	int endNo;
	int startPage;
	int endPage;
	
	public PageDto (int listSize, int blockSize, int nowPage) {
		this.listSize = listSize;
		this.blockSize = blockSize;
		this.nowPage = nowPage;
		this.conn = new DBConn().getConn();
	}
	
	public void boardPageCompute (String search) {
		String sql = " select count(*) cnt from board "
						+ "	where userId like ? title like ? and content like ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");
			rs = ps.executeQuery();
			
			if (rs.next()) {
				this.totSize = rs.getInt("cnt");
				
				this.totPage = (int) Math.ceil(this.totSize / (double) this.listSize);
				this.totBlock = (int) Math.ceil(this.totPage / (double) this.blockSize);
				this.nowBlock = (int) Math.ceil(this.nowPage / (double) this.blockSize);
				this.endNo = this.nowPage * this.listSize;
				this.startNo = this.endNo - this.listSize + 1;
				if (this.endNo > this.totSize) this.endNo = this.totSize;
				this.endPage = this.nowBlock * this.blockSize;
				this.startPage = this.endPage - this.blockSize + 1;
				if (this.endPage > this.totPage) this.endPage = this.totPage;
				System.out.println("boardPageConpute 완료");
			}
			
			System.out.println("listSize: " + listSize);
			System.out.println("blockSize: " + blockSize);
			System.out.println("nowPage: " + nowPage);
			System.out.println("totSize: " + totSize);
			System.out.println("totPage: " + totPage);
			System.out.println("totBlock: " + totBlock);
			System.out.println("nowBlock: " + nowBlock);
			System.out.println("endNo: " + endNo);
			System.out.println("startNo: " + startNo);
			System.out.println("endPage: " + endPage);
			System.out.println("startPage: " + startPage);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception ex) { ex.printStackTrace(); }
		}
	}
	
	public void guestbookPageCompute (String search) {
		String sql = " select count(*) cnt from guestbook"
						+ "	where userId like ? and content like ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");
			rs = ps.executeQuery();
			
			if (rs.next()) {
				this.totSize = rs.getInt("cnt");
				
				this.totPage = (int) Math.ceil(this.totSize / (double) this.listSize);
				this.totBlock = (int) Math.ceil(this.totPage / (double) this.blockSize);
				this.nowBlock = (int) Math.ceil(this.nowPage / (double) this.blockSize);
				this.endNo = this.nowPage * this.listSize;
				this.startNo = this.endNo - this.listSize + 1;
				if (this.endNo > this.listSize) this.endNo = this.listSize;
				this.endPage = this.nowBlock * this.blockSize;
				this.startPage = this.endPage - this.blockSize + 1;
				if (this.endPage > this.totPage) this.endPage = this.totPage;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception ex) { ex.printStackTrace(); }
		}
	}
}
