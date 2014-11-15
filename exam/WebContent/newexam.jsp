<jsp:include page="header.jsp" />
<%@ page import="com.exam.control.*"%>
<%@ page import="com.exam.model.*"%>
<%@ page session="true"%>
<%
		String examname = request.getParameter("examname");
		String correct = request.getParameter("correct");
		String incorrect = request.getParameter("incorrect");
		ExamError message = null;
		if(examname!=null && examname!="")
		{
			Operations ops = new Operations();
			message = ops.AddExam(examname, Double.parseDouble(correct), Double.parseDouble(incorrect));
			if(message!=null)
			{
				if(message.getResult()!=null)
					response.sendRedirect("questions.jsp?exam="+message.getResult());
			}
		}
%>
<div class="panel panel-info">
  <div class="panel-heading">
    <h3 class="panel-title">New Examination</h3>
  </div>
    <%if(message!=null && message.getErr_msg()!="") {%>
    <div class="panel-body">
	<h4 style="color: red">
		<%out.print(message.getErr_code()+" : "+message.getErr_msg()) ;%>
	</h4>
	</div>
<%} %>
</div>
<div class="well well-sm" id="div-add-exam">
			<form class="form-horizontal" action="newexam.jsp" method="post" id="addExam" name="addexam" spellcheck="true" title="Add Exam">
			  <fieldset>
			    <div class="form-group">
			      <label for="inputEmail" class="col-lg-2 control-label">Exam Name<span style="color:red;font-weight: bold">*</span></label>
			      <div class="col-lg-10">
			        <input type="text" class="form-control"  onchange="" autofocus="autofocus" id="examname" name="examname" placeholder="Exam Name" required="required" maxlength="3" style="width: 20%;text-transform: uppercase">
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="inputEmail" class="col-lg-2 control-label">Marks for Correct Ans<span style="color:red;font-weight: bold">*</span></label>
			      <div class="col-lg-10">
			        <input type="number" class="form-control"  id="correct" name="correct" placeholder="Correct"
					value="0" required="required" maxlength="2" style="width: 20%;">
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="inputPassword" class="col-lg-2 control-label">Marks for Incorrect Ans<span style="color:red;font-weight: bold">*</span></label>
			      <div class="col-lg-10">
			        <input type="number" class="form-control" id="incorrect" name="incorrect"
					placeholder="Incorrect" value="0" required="required" maxlength="2" style="width: 20%;">
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
</body>
</html>