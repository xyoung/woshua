package com.fivewood.print.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	private String savePath;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	private String getSavePath() throws Exception{
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	@Override
	public String execute() throws Exception {
		FileOutputStream fos = new FileOutputStream(getSavePath() + "\\"
				+ getUploadFileName());
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer =new byte[1024];
		int len = 0;
		while((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
		return SUCCESS;
	}
	
	
	
	
	
	
	

}
