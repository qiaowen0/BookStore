package com.bookstore.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Profileaction extends ActionSupport {
	List<BookDetails> booklist = new ArrayList<BookDetails>();
	public List<BookDetails> getBooklist() {
		return booklist;
	}
	public void setBooklist(List<BookDetails> booklist) {
		this.booklist = booklist;
	}
	public String execute() throws Exception {
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
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>) context.getSession();
		String recommenderuser=(String) session.get("username");	
		String sql = "SELECT count(*) FROM booktable where RecommendUser=\""+ recommenderuser + "\";";
		rs = stmt.executeQuery(sql);
		rs.next();
		String ColSum = rs.getString(1);
		int colsum = Integer.parseInt(ColSum);		
		sql = "SELECT BookId,Bookname FROM booktable where RecommendUser=\""+ recommenderuser + "\";";
		rs = stmt.executeQuery(sql);
		rs.next();
		// 这里是否要先next？
		for (int i = 0; i < colsum; i++) {
			BookDetails bookdetails = new BookDetails();
			bookdetails.setBookid(rs.getInt(1));
			bookdetails.setBookname(rs.getString(2));
			rs.next();
			booklist.add(bookdetails);
		}
		return SUCCESS;
		
	}
}