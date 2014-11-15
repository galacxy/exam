package com.exam.control;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import com.exam.dao.Dao;
import com.exam.model.Exam;
import com.exam.model.ExamError;
import com.exam.model.Question;

public class Operations {

	Dao AccessObject = new Dao();
	
	public ExamError AddExam(String examname, double correct, double incorrect)
	{
		Exam exam = new Exam();
		exam.setCorrect(correct);
		exam.setExamname(examname.toUpperCase());
		exam.setIncorrect(incorrect);
		ExamError err = AccessObject.addExam(exam);
		//ExamError err = AccessObject.Conn();
		return err;
	}
	
	public ExamError AddQuest(String qno,String title, String ans, String desc, String examid)
	{
		Question quest = new Question();
		quest.setQno(Integer.parseInt(qno));
		quest.setAns(ans);
		quest.setDetail(desc);
		quest.setTitle(title);
		quest.setExamid(Long.parseLong(examid));
		ExamError err = AccessObject.addQuest(quest);
		//ExamError err = AccessObject.Conn();
		return err;
	}
	
	public ExamError getExam(String examid)
	{
		ExamError err = AccessObject.getExam(examid);
		return err;
	}
	
	public ExamError getExams()
	{
		ExamError err = AccessObject.getAllExams();
		return err;
	}
	
	public ExamError getQuestions(String examid)
	{
		ExamError err = AccessObject.getQuestions(examid);
		return err;
	}
	
	public ExamError SearchExam(String term)
	{
		ExamError result = AccessObject.SearchExam(term);
		return result;
	}
	
	public ExamError SearchQuestion(String term)
	{
		ExamError result = AccessObject.SearchQuestion(term);
		return result;
	}
	
	public int getNumQuestions(long examid)
	{
		int num = AccessObject.getNumQuestion(examid);
		return num;
	}
	
	public String getTitle(long id, char domain)
	{
		String title = AccessObject.getTitle(id, domain);
		return title;
	}
	
	public ExamError postAnswer(String examid, HashMap<String,String> new_ans)
	{
		ArrayList<String> Act_Ans = new ArrayList<>();
		ArrayList<String> qid = new ArrayList<>();
		for(Entry<String, String> pair:new_ans.entrySet())
		{
			Act_Ans.add(pair.getValue());
			qid.add(pair.getKey());
		}
		ExamError err = AccessObject.postAnswer(Long.parseLong(examid), (String[])Act_Ans.toArray(new String[Act_Ans.size()]), (String[])qid.toArray(new String[qid.size()]));
		return err;
	}
	
	public ExamError getStatus(String examid)
	{
		ExamError err = AccessObject.getStatus(Long.parseLong(examid));
		//String status = (String)err.getResult();
		//return status.split("|");
		return err;
	}
	
	public double getObtained(ArrayList<Integer> status, Exam exam)
	{
		double marks = 0;
		String str_marks = "0.00";
		try{
		marks = (exam.getCorrect()*status.get(0)-exam.getIncorrect()*status.get(1));
		DecimalFormat df = new DecimalFormat("0.00");
		str_marks = df.format(marks);
		marks = (Double) df.parse(str_marks);
		}
		catch(Exception ex)
		{}
		return marks;
	}
}
