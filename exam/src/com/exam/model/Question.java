package com.exam.model;

import java.sql.Date;

public class Question {
	private long questionId;
	private String title;
	private String detail;
	private String ans;
	private String act_ans;
	private String created;
	private String updated;
	private long Examid;
	private int eval;
	private int Qno;
	
	public Question()
	{
		detail="";
		act_ans="";
		eval=0;
	}
	
	public int getEval() {
		return eval;
	}
	public void setEval(int eval) {
		this.eval = eval;
	}
	public int getQno() {
		return Qno;
	}
	public void setQno(int qno) {
		Qno = qno;
	}
	
	public long getExamid() {
		return Examid;
	}
	public void setExamid(long examid) {
		Examid = examid;
	}
	public long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(long questionId) {
		this.questionId = questionId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getAct_ans() {
		return act_ans;
	}
	public void setAct_ans(String act_ans) {
		this.act_ans = act_ans;
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
