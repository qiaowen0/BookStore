package com.bookstore.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditAction_put extends ActionSupport {
	
	BookDetails bookdetails=new BookDetails();
	
	
	public BookDetails getBookdetails() {
		return bookdetails;
	}
	public void setBookdetails(BookDetails bookdetails) {
		this.bookdetails = bookdetails;
	}
	
	public String execute() throws Exception {
		//这个不可能出现失败情况
		Connection con;
		Statement stmt;
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		String dbUrl = "jdbc:mysql://localhost:3306/bookstoredb?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "BookStore";
		String dbPwd = "12345678";
		con = java.sql.DriverManager.getConnection(dbUrl, dbUser, dbPwd);
		stmt = con.createStatement();
		String sql = "SELECT * FROM booktable where BookId="+bookid+";";
		rs = stmt.executeQuery(sql);
		rs.next();
		bookdetails.setBookid(rs.getInt(1));
		bookdetails.setBookname(rs.getString(2));
		bookdetails.setBookauthor(rs.getString(3));
		bookdetails.setRecommenduser(rs.getString(4));
		bookdetails.setComment(rs.getString(5));
		bookdetails.setImgname(rs.getString(6));
		return SUCCESS;
	}
	private String bookid;
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
}
