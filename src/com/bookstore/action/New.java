package com.bookstore.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class New extends ActionSupport {
	List<BookDetails> booklist=new ArrayList<BookDetails>();
	
	public List<BookDetails> getBooklist() {
		return booklist;
	}

	public void setBooklist(List<BookDetails> booklist) {
		this.booklist = booklist;
	}

	@Override
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
		String sql = "SELECT count(*) FROM booktable;";
		rs = stmt.executeQuery(sql);
		
		rs.next();
		String ColSum=rs.getString(1);
		int colsum=Integer.parseInt(ColSum);
		
		if(colsum<8)
		{
			return "failure";
		}
		
		//确认可以显示。向前台导入数据
		sql = "SELECT * FROM booktable order by BookID desc limit 8;";
		rs = stmt.executeQuery(sql);
		rs.next();
		for(int i=0;i<8;i++)
		{
			BookDetails bookdetails=new BookDetails();
			bookdetails.setBookid(rs.getInt(1));
			bookdetails.setBookname(rs.getString(2));
			bookdetails.setBookauthor(rs.getString(3));
			bookdetails.setRecommenduser(rs.getString(4));
			rs.next();
			booklist.add(bookdetails);
		}
		
		
		return SUCCESS;

	}
}
