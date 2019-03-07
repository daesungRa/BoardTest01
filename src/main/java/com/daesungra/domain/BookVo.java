package com.daesungra.domain;

public class BookVo {

	private String bookNo;
	private String title_kor;
	private String title_eng;
	private String introduce;
	private String author;
	private int category;
	private String publisher;
	private String country;
	private String coverImg;
	private String pDate;
	private int isPermitted;
	
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getTitle_kor() {
		return title_kor;
	}
	public void setTitle_kor(String title_kor) {
		this.title_kor = title_kor;
	}
	public String getTitle_eng() {
		return title_eng;
	}
	public void setTitle_eng(String title_eng) {
		this.title_eng = title_eng;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getIsPermitted() {
		return isPermitted;
	}
	public void setIsPermitted(int isPermitted) {
		this.isPermitted = isPermitted;
	}

	public String toJson() {
		/*String jsonResult = String.format("{\"bookNo\":\"%s\", "
											+ "'title_kor':\"%s\", "
											+ "'title_eng':\"%s\", "
											+ "'introduce':\"%s\", "
											+ "'author':\"%s\", "
											+ "'category':\"%d\", "
											+ "'publisher':\"%s\", "
											+ "'country':\"%s\", "
											+ "'coverImg':\"%s\", "
											+ "'pDate':\"%s\", "
											+ "\"isPermitted\":\"%d\"}", bookNo, title_kor, title_eng, introduce, author, category, publisher, country, coverImg, pDate, isPermitted);*/
		
		String jsonResult = String.format("{\"title_kor\":\"%s\", "
											+ "\"bookNo\":\"%s\", "
											+ "\"title_eng\":\"%s\", "
											+ "\"category\":\"%d\", "
											+ "\"coverImg\":\"%s\", "
											+ "\"pDate\":\"%s\"}", title_kor, bookNo, title_eng, category, coverImg, pDate);
		return jsonResult;
		
		/*"{'bookNo':'" + bookNo + "', 'title_kor':'" + title_kor + "', 'title_eng':'" + title_eng + "', 'introduce':'"
		+ introduce + "', 'author':'" + author + "', 'category':'" + category + "', 'publisher':'" + publisher
		+ "', 'country':'" + country + "', 'coverImg':'" + coverImg + "', 'pDate':'" + pDate + "', 'isPermitted':'"
		+ isPermitted + "'}"*/
	}
	
	
	
}
