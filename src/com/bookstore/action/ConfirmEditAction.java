package com.bookstore.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ConfirmEditAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	// 代表上传文件的File对象
	private File upload;

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

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	// 上传文件名
	private String uploadFileName;
	// 上传文件的MIME类型
	private String uploadContentType;
	// 保存上传文件的目录，相对于WEB应用程序的根路径，在struts.xml中配置
	private String uploadDir;

	private String bookid;
	private String bookname;
	private String bookauthor;
	private String comment;

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
		// 得到当前用户名
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>) context
				.getSession();
		String username = (String) session.get("username");

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

		String sql = "UPDATE booktable SET `Bookname`='" + bookname
				+ "', `BookAuthor`='" + bookauthor + "', `RecommendUser`='"
				+ username + "', `Comment`='" + comment + "', `imgName`='"
				+ newFileName + "' WHERE `BookId`='" + bookid + "';";
		
		stmt.executeUpdate(sql);

		return SUCCESS;
	}
}
