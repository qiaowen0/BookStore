package com.bookstore.action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.*;

public class Logout extends ActionSupport{
	public String execute() throws Exception{
		//È¥µôsession
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		session.remove("username");
		return SUCCESS;
	}
}
