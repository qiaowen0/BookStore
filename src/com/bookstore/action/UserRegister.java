package com.bookstore.action;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.util.Map;

import com.mysql.jdbc.Driver;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserRegister extends ActionSupport {
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


		String sql = "select * from user where id_email=\"" + email + "\"";
		rs = stmt.executeQuery(sql);	
		if(rs.next()==true)//邮箱重复
		{
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>) context
					.getSession();
			session.put("isRegeEmailSuccess", "Failure");
			return "reg_fail";
		}
		sql = "select * from user where nick_name=\"" + nickname + "\"";
		rs = stmt.executeQuery(sql);
		if(rs.next()==true)
		{
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>) context
					.getSession();
			session.put("isRegeNickSuccess", "Failure");
			return "reg_fail";
		}
		//确认插入数据
		sql="INSERT INTO user (`id_email`, `nick_name`, `password`) VALUES ('"+email+"', '"+nickname+"', '"+pwd+"');";
		stmt.executeUpdate(sql);
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>) context
				.getSession();
		session.put("username", nickname);
		return SUCCESS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	private String email;
	private String nickname;
	private String pwd;

}
