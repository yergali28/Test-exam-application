<%@page import="com.Entities.TestQuestion"%>
<%@page import="com.Entities.Courses_users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entities.Users"%>
<%@page import="com.Entities.Groups"%>
<%@page import="com.Entities.Courses"%>
<%@page import="java.util.List"%>
<jsp:include page="header.jsp"/>
<%                    	
	Users u = (Users)request.getSession().getAttribute("user");
	List <TestQuestion> allquestions = (List<TestQuestion>)request.getAttribute("allquestions");
%>
<script type="text/javascript">
		function hideOrShow(){				
			var x = document.getElementById('panel-body1');
		    if (x.style.display === 'none') {
		        x.style.display = 'block';
		    } else {
		        x.style.display = 'none';
		    }
		}
</script>

<div class="padding">
	<div class="full col-sm-9">
		<div class="row">
		<!-- main col left --> 
		                         
		<div class="col-sm-5">
		                           
			<div class="panel panel-default">
			<!-- <div class="panel-thumbnail"><img src="/assets/example/bg_5.jpg" class="img-responsive"></div> -->
				<div class="panel-body">
					<p class="lead"><% out.print(u.getUserData().getName() + " " + u.getUserData().getSurname()); %></p>
					<p><%out.print(allquestions.size()); %> Questions</p>
				</div>
			</div>
			
			<div class="well"> 
				<form class="form-horizontal" role="form" action="act?action=addQuestion" method="post">
                	<h4>Add a new question</h4>
                	<div class="form-group" style="padding:14px;">
                    	<textarea name="questionContent" class="form-control" placeholder="Enter content of question..." style="height: 80px;"></textarea><br>
						<textarea name="v1" class="form-control" placeholder="Variant one" style="width: 248px; display: inline-block;"></textarea>
						<textarea name="v2" class="form-control" placeholder="Variant two" style="width: 248px; display: inline-block;"></textarea><br><br>
						<textarea name="v3" class="form-control" placeholder="Variant three" style="width: 248px; display: inline-block;"></textarea>
						<textarea name="v4" class="form-control" placeholder="Variant four" style="width: 248px; display: inline-block;"></textarea><br>
						
						<h5>Assign correct answer</h5>
						<select class="form-control" name="correctAnswer">
		               		<option value="1">Variant one</option>
		               		<option value="2">Variant two</option>
		               		<option value="3">Variant three</option>
		               		<option value="4">Variant four</option>
               			</select>
                    </div>
                    <button class="btn btn-primary pull-right" type="submit">Add</button><ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
                </form>
            </div>	
                    
		</div>
		
		<!-- main col right -->
		<div class="col-sm-7">
        <%
			for(TestQuestion question: allquestions){
		%>
        <div class="well">            
          		<form action="act?action=deleteQuestion" method="post">
					<input type = "hidden" value = "<% out.println(question.getId()); %>" name="questionID">
			        <input type="submit" class="btn btn-primary pull-right" value="Delete"/>
			    </form>
			    
			    <form action="act?action=editQuestion" method="post">
				    <h4><%=question.getQuestion() %></h4>
				    <h5><b>a. </b><% out.println(question.getAnswerOne()); %></h5>
				    <h5><b>b. </b><% out.println(question.getAnswerTwo()); %></h5>
				    <h5><b>c. </b><% out.println(question.getAnswerThree()); %></h5>
				    <h5><b>d. </b><% out.println(question.getAnswerFour()); %></h5>
					
					<input type = "hidden" value = "<% out.println(question.getQuestion()); %>" name="question">
					<input type = "hidden" value = "<% out.println(question.getAnswerOne()); %>" name="v1">
					<input type = "hidden" value = "<% out.println(question.getAnswerTwo()); %>" name="v2">
					<input type = "hidden" value = "<% out.println(question.getAnswerThree()); %>" name="v3">
					<input type = "hidden" value = "<% out.println(question.getAnswerFour()); %>" name="v4">
                	<input type = "hidden" value = "<% out.println(question.getCorrectAnswer()); %>" name="correctAnswer">
 					<input type = "hidden" value = "<% out.println(question.getId()); %>" name="questionId">
					<button class="btn btn-primary pull-right" type="submit">Edit</button>			    
				</form>
   	            <ul class="list-inline">
				<li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
		</div>
		<%
			}
		%>
		                     
	</div>
</div>
			
<jsp:include page="footer.jsp" />                          
		                         