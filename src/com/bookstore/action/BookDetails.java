package com.bookstore.action;

public class BookDetails {
	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getBookauthor() {
		return bookauthor;
	}

	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}

	public String getRecommenduser() {
		return recommenduser;
	}

	public void setRecommenduser(String recommenduser) {
		this.recommenduser = recommenduser;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	
	private int bookid; 
	private String bookname;
	private String bookauthor;
	private String recommenduser;
	private String comment;
	private String imgname;

}
