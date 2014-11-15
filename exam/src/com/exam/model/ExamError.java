package com.exam.model;

public class ExamError {

	private String err_code;
	private String err_msg;
	private Object result;
	
	public ExamError()
	{
		err_msg = "";
		result = null;
	}
	
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	public String getErr_code() {
		return err_code;
	}
	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}
	public String getErr_msg() {
		return err_msg;
	}
	public void setErr_msg(String err_msg) {
		this.err_msg = err_msg;
	}
}
