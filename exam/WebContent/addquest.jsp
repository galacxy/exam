<%@ page import="com.exam.model.*"%>
<%@ page import="com.exam.control.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page session="true"%>
<%
String qtitle = request.getParameter("qtitle");
String qans = request.getParameter("qans");
String qdesc = request.getParameter("qdesc");
String examid = request.getParameter("examid");
String qno = request.getParameter("qno");
if(examid!=null && examid!=""){
	if(qtitle!=null && qtitle!="")
	{
		if(qans!=null && qans!="")
		{
			qdesc = qdesc==null?"":qdesc;
			Operations ops = new Operations();
			ExamError err = ops.AddQuest(qno,qtitle, qans, qdesc, examid);
			if(err.getErr_code().contains("ALL_OK"))
			{
				response.sendRedirect("questions.jsp?exam="+examid);
			}
		}
	}
}
%>