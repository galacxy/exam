<%@page import="java.util.HashMap"%>
<%@ page session="true"%>
<%@ page import="com.exam.model.*"%>
<%@ page import="com.exam.control.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	String examid = request.getParameter("examid");
	String[] act_ans = request.getParameterValues("act_ans");
	String[] qid = request.getParameterValues("qid");
	String[] old_ans = request.getParameterValues("old-ans");
	if(examid!=null && examid!=""){
		if(qid!=null)
		{
				Operations ops = new Operations();
				try{
					if(act_ans.length==old_ans.length && old_ans.length==qid.length && qid.length > 0)
					{
						HashMap<String,String> new_ans = new HashMap<String,String>();
						for(int i=0;i<old_ans.length;i++)
						{
							if(old_ans[i].equals(act_ans[i])==false)
							{
								new_ans.put(qid[i], act_ans[i]);
							}
						}
						ExamError err = ops.postAnswer(examid, new_ans);
						session.setAttribute("message", err.getErr_code()+" : "+ err.getErr_msg());
					}
					else
					{
						session.setAttribute("message", "Answers not Set ");
					}
				}
				catch(Exception ex)
				{
					session.setAttribute("message", ex.getMessage());
				}
		}
		else
		{
			session.setAttribute("message", "Question not Set");
		}

	}
	else
	{
		session.setAttribute("message", "Exam not Set");
	}
	response.sendRedirect("questions.jsp?exam="+examid);
	
%>