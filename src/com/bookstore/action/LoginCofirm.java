package com.bookstore.action;

import java.util.*;
import java.io.*;
import java.sql.*;
import java.util.Map;
import com.mysql.jdbc.Driver;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginCofirm extends ActionSupport {
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
		String sql = "select id_email,nick_name,password from user where id_email=\""
				+ email + "\"";
		rs = stmt.executeQuery(sql);
		
		
		if (rs.next() == false) {
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>) context
					.getSession();
			session.put("isLogin", "Failure");
			return "login_fail";
		}
		else {
			String Useremail = rs.getString("id_email");
			String Nickname = rs.getString("nick_name");
			String Password = rs.getString("password");
			if (Useremail.equals(email) && Password.equals(pwd)) {
				ActionContext context = ActionContext.getContext();
				Map<String, Object> session = (Map<String, Object>) context
						.getSession();
				session.put("username", Nickname);
				return SUCCESS;
			} 
			else {
				ActionContext context = ActionContext.getContext();
				Map<String, Object> session = (Map<String, Object>) context
						.getSession();
				session.put("isLogin", "Failure");
				return "login_fail";
			}

		}
		

		
	}

	private String email;

	private String pwd;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
