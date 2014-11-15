package com.exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.exam.model.Exam;
import com.exam.model.ExamError;
import com.exam.model.Question;

public class Dao {
	
	private Connection conn;
	private java.sql.PreparedStatement stmt;
	private SimpleDateFormat SDF = new SimpleDateFormat("dd MMM yyyy  hh:mm:ss a");
	
	
	public ExamError createConnection()
	{
		ExamError err = new ExamError();
        try
        {
        	String connUrl="jdbc:mysql://localhost:3306/exams?";  
            String uname="root";  
            String password="1234";
            DriverManager.registerDriver (new com.mysql.jdbc.Driver());
        	//Class.forName("org.sqlite.JDBC");
        	//DriverManager.registerDriver(new org.sq);
	        conn = DriverManager.getConnection(connUrl,uname,password); 
			err.setErr_code("ALL_OK");
			err.setErr_msg("Connection succeded");
        }
        catch(Exception ex)
        {
        	err.setErr_code("CONN_FAILED");
        	err.setErr_msg(ex.getMessage());
        }
        return err;
	}
	
	private void closeConnection()
	{
		try {
			if(conn!=null)
			conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public ExamError Conn()
	{
		ExamError err = createConnection();
		closeConnection();
		return err;
	}
	
	public ExamError getAllExams()
	{
		ArrayList<Exam> exams = null;
		ExamError err = createConnection();
		if(err.getErr_code() == "ALL_OK")
		{
			try{
				String query = "select id,title,correct,incorrect,maximum,result,created,updated from exam order by updated desc;";
				stmt = conn.prepareStatement(query);
				ResultSet res = stmt.executeQuery();
				if(res!=null)
				{
					exams = new ArrayList<>();
					while(res.next())
					{
						Exam temp = new Exam();
						temp.setExamid(res.getLong(1));
						temp.setExamname(res.getString(2));
						temp.setCorrect(res.getInt(3));
						temp.setIncorrect(res.getInt(4));
						temp.setMarks(res.getDouble(5));
						temp.setResult(res.getString(6));
						Timestamp ts = res.getTimestamp(7);
						temp.setCreated(SDF.format(ts));
						ts = res.getTimestamp(8);
						temp.setUpdated(SDF.format(ts));
						exams.add(temp);
					}
					res.close();
					err.setErr_code("ALL_OK");
					err.setResult(exams);
				}
				stmt.close();
			}
			catch(Exception exp)
			{
				err.setErr_code("FAILED TO READ DATABASE");
				err.setErr_msg(exp.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	
	public ExamError getExam(String examid)
	{
		ExamError err = createConnection();
		if(err.getErr_code() == "ALL_OK")
		{
			try{
				String query = "select id,title,correct,incorrect,maximum,result,created,updated from exam where id = ?;" ;
				stmt = conn.prepareStatement(query);
				stmt.setString(1, examid);
				ResultSet res = stmt.executeQuery();
				Exam temp = null;
				while(res.next())
				{
					temp = new Exam();
					temp.setExamid(res.getLong(1));
					temp.setExamname(res.getString(2));
					temp.setCorrect(res.getDouble(3));
					temp.setIncorrect(res.getDouble(4));
					temp.setMarks(res.getDouble(5));
					temp.setResult(res.getString(6));
					Timestamp ts = res.getTimestamp(7);
					temp.setCreated(SDF.format(ts));
					ts = res.getTimestamp(8);
					temp.setUpdated(SDF.format(ts));
				}
				res.close();
				if(temp==null)
					err.setErr_code("EXAM_NOT_FOUND");
				err.setResult(temp);
				stmt.close();
			}
			catch(Exception exp)
			{
				err.setErr_code("FAILED TO READ DATABASE");
				err.setErr_msg(exp.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	
	public ExamError addExam(Exam exam)
	{
		ExamError err = createConnection();
		if(err.getErr_code()=="ALL_OK")
		{
			try
			{
				String query = "insert into exam(title,correct,incorrect) values(?,?,?) ";
				stmt = conn.prepareStatement(query);
				stmt.setString(1, exam.getExamname());
				stmt.setDouble(2, exam.getCorrect());
				stmt.setDouble(3, exam.getIncorrect());
				int rows = stmt.executeUpdate();
				if(rows>0)
				{
					err.setErr_code("ALL_OK");
					err.setErr_msg("Exam "+ exam.getExamname()+" added");
					stmt.close();
					query = "select id from exam where title = ? ;";
					stmt = conn.prepareStatement(query);
					stmt.setString(1, exam.getExamname());
					ResultSet res = stmt.executeQuery();
					if(res.first()==true)
					{
						err.setResult(res.getString(1));
					}
				}
				stmt.close();
			} 
			catch (SQLException e)
			{
				err.setErr_code("INSERTION FAILED");
				err.setErr_msg(e.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	
	public ExamError addQuest(Question Quest)
	{
		ExamError err = createConnection();
		if(err.getErr_code()=="ALL_OK")
		{
			try
			{
				String query = "insert into question(examid,title,ans,detail,qno) values(?,?,?,?,?) ";
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, Quest.getExamid());
				stmt.setString(2, Quest.getTitle());
				stmt.setString(3, Quest.getAns());
				stmt.setString(4, Quest.getDetail());
				stmt.setInt(5, Quest.getQno());
				int rows = stmt.executeUpdate();
				if(rows>0)
				{
					err.setErr_code("ALL_OK");
					err.setErr_msg("Question "+ Quest.getTitle()+" added");
				}
				stmt.close();
				query = "update exam set updated=now() where id=?";
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, Quest.getExamid());
				stmt.executeUpdate();
				stmt.close();
			} 
			catch (SQLException e)
			{
				err.setErr_code("INSERTION FAILED");
				err.setErr_msg(e.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	
	public ExamError getQuestions(String id)
	{
		ExamError err = createConnection();
		if(err.getErr_code()=="ALL_OK")
		{
			try{
				String query = "select id,title,detail,ans,act_ans,qno from question where examid = ? order by updated desc;";
				stmt = conn.prepareStatement(query);
				stmt.setString(1, id);
				ResultSet res = stmt.executeQuery();
				if(res!=null)
				{
					ArrayList<Question> questions = new ArrayList<>();
					while(res.next())
					{
						Question quest = new Question();
						quest.setQuestionId(res.getInt(1));
						quest.setTitle(res.getString(2));
						quest.setDetail(res.getString(3));
						quest.setAns(res.getString(4));
						quest.setAct_ans(res.getString(5));
						quest.setQno(res.getInt(6));
						questions.add(quest);
					}
					err.setErr_code("ALL_OK");
					err.setResult(questions);
				}
				stmt.close();
			}
			catch(Exception ex)
			{
				err.setErr_code("READ_FAIL");
				err.setErr_msg(ex.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	
	public ExamError SearchExam(String term)
	{
		ArrayList<Exam> exams = null;
		ExamError err = createConnection();
		if(err.getErr_code().contains("ALL_OK"))
		{
			try{
				String query = "select id,title,correct,incorrect,maximum,obtained,created,updated from exam where title like '%"+term+"%' or detail like '%"+term+"%'";
				stmt = conn.prepareStatement(query);
				ResultSet res = stmt.executeQuery();
				if(res!=null)
				{
					exams = new ArrayList<>();
					while(res.next())
					{
						Exam temp = new Exam();
						temp.setExamid(res.getLong(1));
						temp.setExamname(res.getString(2));
						temp.setCorrect(res.getDouble(3));
						temp.setIncorrect(res.getDouble(4));
						temp.setMarks(res.getDouble(5));
						temp.setObtained(res.getDouble(6));
						Timestamp ts = res.getTimestamp(7);
						temp.setCreated(SDF.format(ts));
						ts = res.getTimestamp(8);
						temp.setUpdated(SDF.format(ts));
						exams.add(temp);
					}
					res.close();
				}
				err.setErr_code("ALL_OK");
				err.setResult(exams);
				stmt.close();
			}
			catch(Exception ex)
			{
				err.setErr_code("DATABASE_READ_FAIL");
				err.setErr_msg(ex.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	public ExamError SearchQuestion(String term)
	{
		ArrayList<Question> questions = null;
		ExamError err = createConnection();
		if(err.getErr_code().contains("ALL_OK"))
		{
			try{
				String query = "select q.examid,q.id,q.title,q.detail,q.ans,q.act_ans,q.created,q.updated,q.qno from question q where (title like '%"+term+"%' or detail like '%"+term+"%')";
				stmt = conn.prepareStatement(query);
				ResultSet res = stmt.executeQuery();
				if(res!=null)
				{
					questions = new ArrayList<>();
					while(res.next())
					{
						Question temp = new Question();
						temp.setExamid(res.getLong(1));
						temp.setQuestionId(res.getLong(2));
						temp.setTitle(res.getString(3));
						temp.setDetail(res.getString(4));
						temp.setAns(res.getString(5));
						temp.setAct_ans(res.getString(6));
						Timestamp ts = res.getTimestamp(7);
						temp.setCreated(SDF.format(ts));
						ts = res.getTimestamp(8);
						temp.setUpdated(SDF.format(ts));
						temp.setQno(res.getInt(9));
						questions.add(temp);
					}
					res.close();
				}
				err.setErr_code("ALL_OK");
				err.setResult(questions);
				stmt.close();
			}
			catch(Exception ex)
			{
				err.setErr_code("DATABASE_READ_FAIL");
				err.setErr_msg(ex.getMessage());
			}
			finally
			{
				closeConnection();
			}
		}
		return err;
	}
	
	public int getNumQuestion(long id)
	{
		int num = 0;
		ExamError err = createConnection();
		if(err.getErr_code().contains("ALL_OK"))
		{
			try{
				String query = "select count(id) from question where examid = ?";
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, id);
				ResultSet res = stmt.executeQuery();
				if(res.first())
				{
					num = res.getInt(1);
					res.close();
				}
				stmt.close();
			}
			catch(Exception ex)
			{
				err.setErr_code("DATABASE_READ_FAIL");
				err.setErr_msg(ex.getMessage());
			}
			finally{
				closeConnection();
			}
		}
		return num;
	}
	
	public String getTitle(long id, char domain)
	{
		String title = null;
		ExamError err = createConnection();
		if(err.getErr_code().contains("ALL_OK"))
		{
			try{
				String query = "";
				switch(domain)
				{
				case 'e' : query =  "select title from exam where id = ?";
				break; 
				case 'q' : query =  "select title from question where id = ?";
				break;
				}
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, id);
				ResultSet res = stmt.executeQuery();
				if(res.first())
				{
					title = res.getString(1);
					res.close();
				}
				stmt.close();
			}
			catch(Exception ex)
			{
				err.setErr_code("DATABASE_READ_FAIL");
				err.setErr_msg(ex.getMessage());
			}
			finally{
				closeConnection();
			}
		}
		return title;
	}
	
	public ExamError postAnswer(long examid, String[] act_ans, String[] qid)
	{
		ExamError err = createConnection();
		if(err.getErr_code().contains("ALL_OK"))
		{
			try{
				conn.setAutoCommit(false);
				String query = "update question set updated=now(), act_ans =  ?  where examid = ? and id = ?";
				stmt = conn.prepareStatement(query);
				stmt.setLong(2, examid);
				for(int i=0;i<act_ans.length;i++)
				{
					stmt.setString(1, act_ans[i]);
					stmt.setString(3, qid[i]);
					stmt.addBatch();
				}
				int count[] = stmt.executeBatch();
				stmt.close();
				stmt = conn.prepareStatement("update exam set updated=now() where id=2?");
				stmt.setLong(1, examid);
				stmt.executeUpdate();
				conn.commit();
				int total = 0;
				for(int i:count)
				{
					total+=i;
				}
				err.setErr_msg(total + " answers stored");
				err.setResult(total + " answers stored");
				}
				catch(Exception ex)
				{
					err.setErr_code("DATABASE_UPDATE_FAIL");
					err.setErr_msg(ex.getMessage());
				}
				finally{
					try{
					conn.setAutoCommit(true);
					}
					catch(Exception ex)
					{
						err.setErr_code("CONN_AUTO_COMMIT_FAIL");
						err.setErr_msg(ex.getMessage());
					}
					finally{
					closeConnection();
					}
				}
			}
		else
		{
			err.setErr_code("CONN_FAIL");
			err.setErr_msg("Failed to establish connection");
		}
		return err;
	}
	
	public ExamError getStatus(long examid)
	{
		ExamError err = createConnection();
		if(err.getErr_code().contains("ALL_OK"))
		{
			try{
				String query = "select count(id) from question where act_ans is not null and act_ans!='' and act_ans=ans and examid=?;";
				ArrayList<Integer> status = new ArrayList<>();
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, examid);
				ResultSet res = stmt.executeQuery();
				if(res.first())
				{
					status.add(res.getInt(1));
					res.close();
				}
				stmt.close();
				query = "select count(id) from question where act_ans is not null and act_ans!='' and act_ans!=ans  and examid=?;";
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, examid);
				res = stmt.executeQuery();
				if(res.first())
				{
					status.add(res.getInt(1));
					res.close();
				}
				stmt.close();
				query = "select count(id) from question where act_ans is null or act_ans=''  and examid=?;";
				stmt = conn.prepareStatement(query);
				stmt.setLong(1, examid);
				res = stmt.executeQuery();
				if(res.first())
				{
					status.add(res.getInt(1));
					res.close();
				}
				err.setResult(status);
				stmt.close();
			}
			catch(Exception ex)
			{
				err.setErr_code("DATABASE_READ_FAILED");
				err.setErr_msg(ex.getMessage());
			}
			finally{
				closeConnection();
			}
		}
		return err;
	}
}
