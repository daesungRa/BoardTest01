package com.daesungra.domain;

public class MemberVo {

	// 기본 회원 정보
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String postal;
	private String address;
	private String photo;
	private String photoOri;
	private String mDate;
	private String addressAdd;
	
	// 프로필 정보
	private String introduce;
	private String interest;
	private String isPublic;
	
	
	// info
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getAddressAdd() {
		return addressAdd;
	}
	public void setAddressAdd(String addressAdd) {
		this.addressAdd = addressAdd;
	}
	
	// profile
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getIsPublic() {
		return isPublic;
	}
	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}
	
	// info json
	public String toJsonInfo() {
		return "{\"userId\":\"" + userId + "\", \"userPwd\":\"" + userPwd + "\", \"userName\":\"" + userName + "\", \"email\":\"" + email
				+ "\", \"postal\":\"" + postal + "\", \"address\":\"" + address + "\", \"photo\":\"" + photo + "\", \"photoOri\":\"" + photoOri
				+ "\", \"mDate\":\"" + mDate + "\", \"addressAdd:\":\"" + addressAdd + "\"}";
	}
	
	// profile json
	public String toJsonProfile() {
		return "{\"userId\":\"" + userId + "\", \"userName\":\"" + userName + "\", \"photo\":\"" + photo + "\", \"photoOri\":\"" + photoOri
					+ "\", \"introduce:\":\"" + introduce + "\", \"interest:\":\"" + interest + "\", \"isPublic\":\"" + isPublic + "\"}";
	}
	
	
}
