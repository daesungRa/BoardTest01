package com.daesungra.domain;

public class BoardReportVo {

	// report column
	private int serial;
	private String rUserId;
	private int fSerial;
	private String rContent;
	private int isDelete;
	private int gSerial;
	private int pSerial;
	private int depth;
	private int indent;
	private String rDate;
	
	// board data
	private BoardVo bvo;
	
	// report
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getrUserId() {
		return rUserId;
	}
	public void setrUserId(String rUserId) {
		this.rUserId = rUserId;
	}
	public int getfSerial() {
		return fSerial;
	}
	public void setfSerial(int fSerial) {
		this.fSerial = fSerial;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public int getgSerial() {
		return gSerial;
	}
	public void setgSerial(int gSerial) {
		this.gSerial = gSerial;
	}
	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	
	// board data
	public BoardVo getBvo() {
		return bvo;
	}
	public void setBvo(BoardVo bvo) {
		this.bvo = bvo;
	}
	
}
