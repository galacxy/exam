package com.exam.model;

import java.sql.Date;

public class Exam {
	private String examname;
	private double correct;
	private double incorrect;
	private double marks;
	private String result;
	private String created;
	private String updated;
	private long examid;
	private double obtained;
	
	public Exam()
	{
		correct = incorrect = 0;
		obtained = marks = 0.0;
		result = "00-00-00";
	}
	
	public double getObtained() {
		return obtained;
	}

	public void setObtained(double obtained) {
		this.obtained = obtained;
	}

	public long getExamid() {
		return examid;
	}
	public void setExamid(long examid) {
		this.examid = examid;
	}
	public String getExamname() {
		return examname;
	}
	public void setExamname(String examname) {
		this.examname = examname;
	}
	public double getCorrect() {
		return correct;
	}
	public void setCorrect(double correct) {
		this.correct = correct;
	}
	public double getIncorrect() {
		return incorrect;
	}
	public void setIncorrect(double incorrect) {
		this.incorrect = incorrect;
	}
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
	
}
