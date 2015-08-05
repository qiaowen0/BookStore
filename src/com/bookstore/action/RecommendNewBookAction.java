package com.bookstore.action;

import java.util.*;
import java.io.*;
import java.sql.*;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.Driver;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecommendNewBookAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	// 代表上传文件的File对象
	private File upload;
	// 上传文件名
	private String uploadFileName;
	// 上传文件的MIME类型
	private String uploadContentType;
	// 保存上传文件的目录，相对于WEB应用程序的根路径，在struts.xml中配置
	private String uploadDir;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadDir() {
		return uploadDir;
	}

	public void setUploadDir(String uploadDir) {
		this.uploadDir = uploadDir;
	}
	
	@Override
	public String execute() throws Exception {
		// 先处理图片，最后得到正式的文件名

		String newFileName = null;

		// 得到当前时间自1970年1月1日0时0分0秒开始走过的毫秒数
		long now = System.currentTimeMillis();

		// 得到保存上传文件的目录的真实路径
		File dir = new File(ServletActionContext.getServletContext()
				.getRealPath(uploadDir));

		// 如果该目录不存在，就创建
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 为避免重名文件覆盖，判断上传文件是否有扩展名，以时间戳作为新的文件名
		int index = uploadFileName.lastIndexOf(".");
		if (index != -1) {
			newFileName = now + uploadFileName.substring(index);
		} else {
			newFileName = Long.toString(now);
		}
		// 读取保存在临时目录下的上传文件，写入到新的文件中
		InputStream is = new FileInputStream(upload);
		OutputStream os = new FileOutputStream(new File(dir, newFileName));
		byte[] buf = new byte[1024];
		int len = -1;
		while ((len = is.read(buf)) != -1) {
			os.write(buf, 0, len);
		}
		is.close();
		os.close();
		

		// 下面先连上数据库再说
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

		return SUCCESS;
	}



}