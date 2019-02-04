package com.daesungra.model;

public class MemberVo {

	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String postal;
	private String address;
	private String photo;
	private String photoOri;
	private String mDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostal() {
		return postal;
	}
	public void setPostal(String postal) {
		this.postal = postal;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPhotoOri() {
		return photoOri;
	}
	public void setPhotoOri(String photoOri) {
		this.photoOri = photoOri;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	
	public String toJson() {
		return "{\"userId\":\"" + userId + "\", \"userPwd\":\"" + userPwd + "\", \"userName\":\"" + userName + "\", \"email\":\"" + email
				+ "\", \"postal\":\"" + postal + "\", \"address\":\"" + address + "\", \"photo\":\"" + photo + "\", \"photoOri\":\"" + photoOri
				+ "\", \"mDate\":\"" + mDate + "\"}";
	}
	
	
}
