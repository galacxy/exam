<jsp:include page="header.jsp" />
<%@ page import="com.exam.model.*"%>
<%@ page import="com.exam.control.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page session="true" %>
<div style="margin-top:65px">
<%
	String examid = request.getParameter("exam");
	if(examid==null || examid=="")
	{%>
	<div class="panel panel-default">
	  <div class="panel-body">
	    No such exam
	  </div>
	</div>
	<div class="well well-lg">
	<%}
	else
	{
		Operations ops = new Operations();
		ExamError err = ops.getExam(examid);
		Exam exam = (Exam)err.getResult();
		if(exam==null)
		{%>
			<div class="panel panel-danger">
			  <div class="panel-heading">No such exam</div>
			  <div class="panel-body">
			    <%out.print(err.getErr_code()+" : "+err.getErr_msg()); %>
			  </div>
			</div>
		<%}
		else
		{%>
		<div class="panel panel-default" >
		<div class="panel-heading" style="padding-left: 100px">
			<span style="font-weight:bold;font-size:30px"><%out.print(exam.getExamname()); %></span>
			<%out.print("(Scheme : +"+exam.getCorrect()+",-"+exam.getIncorrect()+" )  "+"                    Created on "+exam.getCreated()); %>
		</div>
		  <div class="panel-body" style="padding:5px 0 5px 100px">
		  <div style="float:left">
		  <a href="postanswers.jsp?exam=<%out.print(examid);%>" class="btn btn-info" style="padding-left:20px">Post Answers</a>
		  <a class="btn btn-success" id="btn-addquest">Add New Question</a>
		  </div>
		  <%ExamError sterr = ops.getStatus(examid);
		  if(sterr.getResult()!=null){
			  try{
			  ArrayList<Integer> status = (ArrayList<Integer>)sterr.getResult();
		  %>
		  <div style="float:left;padding-left:100px">
				 <ul class="list-group" style="margin-bottom:0px">
				  <li class="list-group-item">
				    <span class="badge" style="font-size: 20px;vertical-align: middle;"><%out.print(ops.getObtained(status,exam)); %></span>
				    <b>Marks : &nbsp;</b>
				  </li>
				</ul>
			</div>
		  <div style="float:right;padding-right:400px">
		   	<a style="float:right;margin-left:5px" class="btn btn-warning" title="Not Evaluated"><%out.print(status.get(2)); %></a>
		   	<a style="float:right;margin-left:5px" class="btn btn-danger" title="Incorrect"><%out.print(status.get(1)); %></a>&nbsp;
			<a style="float:right" class="btn btn-success" title="Correct"><%out.print(status.get(0)); %></a>&nbsp;
		  <%
			  }
			  catch(Exception ex)
			  {
				  out.print("<p>"+ex.getMessage()+"</p>");
			  }
		  }else{
			  out.print("<p>"+sterr.getErr_code()+" : "+sterr.getErr_msg()+"</p>");
			  }%></div>
		  </div>
		</div>
		<%if(session.getAttribute("message")!=null)
		{ 
			if(String.valueOf(session.getAttribute("message")).contains("ALL_OK")){%>
		<div class="panel panel-success" id="message-panel">
		<%}else{ %>
		<div class="panel panel-warning" id="message-panel">
		<%} %>
		  <div class="panel-heading" style="padding-left:100px">
		    <h3 class="panel-title"><%out.print("<h4>"+session.getAttribute("message")+"</h4>"); session.setAttribute("message", null);%></h3>
		  </div>
		</div>
		<%} %>
		<div class="well well-sm" id="div-add" <%if(ops.getNumQuestions(Long.parseLong(examid))!=0){ %>style="display:none"<%} %>>
			<form class="form-horizontal" action="addquest.jsp" method="get" id="addquest" name="addquest">
			  <fieldset>
			    <input type="hidden" value="<%out.print(examid);%>" name="examid">
			    <div class="form-group">
			      <label for="inputEmail" class="col-lg-2 control-label">Question No.<span style="color:red;font-weight: bold">*</span></label>
			      <div class="col-lg-10">
			        <input type="number" class="form-control" step="1"  name="qno" id="qno" placeholder="Question No." required="required" maxlength="3" style="width: 20%;">
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="inputEmail" class="col-lg-2 control-label">Question<span style="color:red;font-weight: bold">*</span></label>
			      <div class="col-lg-10">
			        <input type="text" class="form-control"  name="qtitle" id="qtitle" placeholder="Question title" required="required" maxlength="25" style="width: 80%;text-transform: uppercase;">
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="textArea" class="col-lg-2 control-label">Description</label>
			      <div class="col-lg-10">
			        <textarea class="form-control" name="qdesc" id="qdesc" placeholder="Question Description (optional)" rows="1" cols="100" dir="ltr"></textarea>
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="inputPassword" class="col-lg-2 control-label">Your Answer<span style="color:red;font-weight: bold">*</span></label>
			      <div class="col-lg-10">
			        <input type="text" class="form-control" name="qans" id="qans" placeholder="Answer" required="required" maxlength="2" style="width: 20%;">
			      </div>
			    </div>
			    <div class="form-group">
			      <div class="col-lg-10 col-lg-offset-2">
			        <button class="btn btn-default" type="reset">Reset</button>
			        <button type="submit" class="btn btn-primary">Add</button>
			      </div>
			    </div>
			  </fieldset>
			</form>
		</div>
			<%
			ExamError err2 = ops.getQuestions(String.valueOf(exam.getExamid()));
			ArrayList<Question> Questions = (ArrayList<Question>)err2.getResult();
			if(Questions!=null && Questions.size()>0)
			{
			%>
			<div style="border-radius:3px;padding:0 400px 0 100px">
			<table class="table table-striped table-hover tablesorter" style="border: 1px solid black;" id="table">
			<thead>
		    <tr style="cursor: pointer;">
		      <th style="text-align:center;font-size: medium;">Question No.</th>
		      <th style="font-size: medium;">Question</th>
		      <th width="20px" style="text-align:right;font-size: medium;">Answer</th>
		    </tr>
		  </thead>
			<tbody>
				<%for(Question quest:Questions)
				{%>
				<tr>
				<td align="center"><span style="font-weight: bolder;"><%out.print(quest.getQno()); %></span></td>
					<td valign="middle">
						  <span style="font-weight: bolder;"><%out.print(quest.getTitle()); %></span>
						  <%if(quest.getDetail()!=null && quest.getDetail()!=""){
						  out.print("<p style=\"margin-bottom:0px\">"+quest.getDetail()+"</p>"); 
						  }%>
							</td>
							<td style="text-align:center">
		  						<input name="ans" id="ans" disabled="disabled" class="form-control" width="15px" size="2"
									value="<%if(quest.getAns()==null){out.print("");}else{out.print(quest.getAns()) ;}%>" 
							<%if(quest.getAct_ans().equalsIgnoreCase(quest.getAns())) {%>style="background-color:#A3FFA8"<%}
							else if(quest.getAct_ans()==null || quest.getAct_ans().equals("")){ %>style="background-color:#ffeb9c" <%}
							else {%>style="background-color:#ffc7ce"<%} %>>
					</td>
				</tr>
				<%}%>
				</tbody>
			</table>
			</div>
			<%}
			else
			{%>
				<div class="panel panel-warning">
				  <div class="panel-heading"><h3>No questions yet</h3></div>
				  <div class="panel-body">
				  <h4>Add above</h4>
				    <%out.print(err2.getErr_code()+" : "+err2.getErr_msg()); %>
				  </div>
				</div>
			<%}%>
	<%}%>
<%}%>
</div>
</div>
</body>
</html>