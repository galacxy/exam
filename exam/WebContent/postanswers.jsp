<jsp:include page="header.jsp" />
<%@ page import="com.exam.control.*"%>
<%@ page import="com.exam.model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page session="true"%>
<div style="margin-top:65px">
	<%
	String examid = request.getParameter("exam");
	if(examid==null || examid=="")
	{%>
	<div class="panel panel-danger">
		<div class="panel-body">
			<h3>There is no such exam</h3>
		</div>
	</div>

	<%}
	else
	{
		Operations ops = new Operations();
		ExamError err = ops.getExam(examid);
		if(err.getErr_code().contains("ALL_OK"))
		{
			Exam exam = (Exam)err.getResult();
			%>
	<div class="panel panel-default">
		<div class="panel-heading" style="padding-left:100px">
			<span style="font-weight: bold; font-size: 30px">
				<%out.print(exam.getExamname()); %>
			</span>
			<%out.print("          Created on "+exam.getCreated()); %>
			<div style="float:left">
				  <a href="questions.jsp?exam=<%out.print(examid);%>" class="btn btn-warning" style="padding-left:20px">Back</a>
		  </div>
		</div>
	</div>
	<%
			err = ops.getQuestions(examid);
			ArrayList<Question> questions = (ArrayList<Question>)err.getResult();
			if(questions.size()>0)
			{
			%>
	<div style="border-radius: 3px; padding: 0 400px 0 165px">
		<form action="saveanswers.jsp" method="post">
			<input type="hidden" value="<%out.print(examid);%>" name="examid">
			<table class="table table-striped table-hover tablesorter" id="table">
				<thead>
					<tr style="cursor: pointer;">
						<th align="center">Question No.</th>
						<th>Question</th>
						<th width="20px">Answer</th>
					</tr>
				</thead>
				<tbody>
					<%for(Question quest:questions)
					{%>
					<tr>
					<td align="center"><span style="font-weight: bolder;"><%out.print(quest.getQno()); %></span></td>
						<td valign="middle"><span style="font-weight: bolder;">
								<%out.print(quest.getTitle()); %>
						</span> <%if(quest.getDetail()!=null && quest.getDetail()!="")
							  {
							  out.print("<p>"+quest.getDetail()+"</p>"); 
							  }%></td>
						<td><input type="hidden" value="<%out.print(quest.getQuestionId()); %>" name="qid">
						<input type="hidden" value="<%out.print(quest.getAct_ans()) ;%>" name="old-ans">
						<input name="act_ans" id="act_ans" class="form-control" width="15px" maxlength="1"
							value="<%if(quest.getAct_ans()==null || quest.getAct_ans()==""){out.print("");}else{out.print(quest.getAct_ans()) ;}%>">
						</td>
					</tr>
					<%}%>
<!-- 					<tr> -->
<!-- 						<td colspan="3" align="right"><button type="submit" class="btn btn-default">Post</button></td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
			<button type="submit" class="btn btn-default">Post</button>
		</form>
	</div>
	<%}
		else{%>
	<div class="panel panel-warning">
		<div class="panel-heading">
			No questions yet.....<a
				href="questions.jsp?exam=<%out.print(examid);%>">Add</a>
		</div>
		<p>
			<%out.print(err.getErr_code()+" : "+err.getErr_msg()); %>
		</p>
	</div>
	<%}
	}
		else
		{%>
	<div class="panel panel-warning">
		<div class="panel-heading">Error Occurred</div>
		<p>
			<%out.print(err.getErr_code()+" : "+err.getErr_msg()); %>
		</p>
	</div>
	<%}
	}
%>
</div>
</body>
</html>