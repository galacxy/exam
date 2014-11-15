<jsp:include page="header.jsp" />
<%@ page import="com.exam.control.*"%>
<%@ page import="com.exam.model.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	String search = request.getParameter("search-term");
	Operations ops = new Operations();
	if(search==null || search=="")
	{
		ExamError err = ops.getExams();
		ArrayList<Exam> exams = (ArrayList<Exam>)err.getResult();
		if(exams!=null)
		{%>
<div style="margin-top:65px">
	<div class="jumbotron" style="padding: 10px 150px">
		<table class="table table-striped table-hover tablesorter" id="table">
			<thead>
				<tr style="cursor: pointer;">
					<th class="headerSortUp header">Exam Name</th>
					<th style="text-align: center">No. of Questions</th>
					<th style="text-align: center">Updated</th>
					<th style="text-align: center">Created</th>
				</tr>
			</thead>
			<tbody>
				<%for(Exam exam : exams)
						{%>
				<tr>
					<td><a
						href="questions.jsp?exam=<%out.print(exam.getExamid());%>"><b>
								<% out.print(exam.getExamname());%>
						</b></a></td>
					<td align="center">
						<%int num = ops.getNumQuestions(exam.getExamid());if(num==0){%>
						<a href="questions.jsp?exam=<%out.print(exam.getExamid());%>"><span
							title="Add Question" class="glyphicon glyphicon-upload"
							aria-hidden="true"></span></a>
						<%}else{out.print(num);} %>
					</td>
					<td align="center">
						<%out.print(exam.getUpdated()); %>
					</td>
					<td align="center">
						<%out.print(exam.getCreated()); %>
					</td>
				</tr>
				<%}%>
			</tbody>
		</table>
	</div>
	<%} 
			else 
			{%>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">No exams in record</h3>
		</div>
		<div class="panel-body">
			<a href="newexam.jsp">Add an exam</a>
		</div>
	</div>
	<%} %>
	<div class="panel panel-default">
		<div class="panel-body">
			<%out.print(err.getErr_code()+" : "+err.getErr_msg()); %>
		</div>
	</div>
</div>
<%} 
	else{%>
<%try{out.print("<h4>"+session.getAttribute("message")+"</h4>");}catch(Exception ex){} %>
<div class="jumbotron" style="padding: 10px 0">
	<h4>
		Search results for "<% out.print(search);%>"
	</h4>
	<div>
		<table class="table table-striped table-hover tablesorter " id="table">
			<thead>
				<tr style="cursor: pointer;">
					<th>Questions</th>
					<th>Exams</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><div>
							<ul>
								<%
						ExamError err = ops.SearchQuestion(search);
						if(err.getResult()==null)
						{%>
								<h3>No results on Question Section</h3>
								<%}
						else
						{
							ArrayList<Question> questions = (ArrayList<Question>)err.getResult();
							%>
								<p>
									<%out.print(questions.size()); %>-Results
								</p>
								<%
							for(Question quest : questions)
							{ %>
								<li><div>
										<a href="questions.jsp?exam=<%out.print(quest.getExamid());%>">
											<%out.print(quest.getTitle()+" - " + ops.getTitle(quest.getExamid(), 'e')); %>
										</a>
										<p>
											Marked Answer:
											<%out.print(quest.getAns()) ;%>
										</p>
										<p>
											<%if(quest.getDetail()!=null){out.print(quest.getDetail());}out.print("   created: " + quest.getCreated()+" updated: "+quest.getUpdated()); %>
										</p>
									</div></li>
								<%}
							} %>
							</ul>
						</div></td>
					<td><div>
							<ul>
								<%
					ExamError err2 = ops.SearchExam(search);
					if(err2.getResult()==null)
					{%>
								<h3>No results on Exam Section</h3>
								<%}
					else
					{
						ArrayList<Exam> exams = (ArrayList<Exam>)err2.getResult();%>
								<p>
									<%out.print(exams.size()); %>-Results
								</p>
								<%
						for(Exam exam : exams)
						{ %>
								<li>
									<div>
										<a href="questions.jsp?exam=<%out.print(exam.getExamid());%>">
											<%out.print(exam.getExamname()); %>
										</a>
										<p>
											No. of Questions:
											<%out.print(ops.getNumQuestions(exam.getExamid())) ;%>
										</p>
										<p>
											<%out.print(exam.getResult()+"   created: " + exam.getCreated()+" updated: "+exam.getUpdated()); %>
										</p>
									</div>
								</li>
								<%} 
					} %>
							</ul>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<%}%>
</body>
</html>