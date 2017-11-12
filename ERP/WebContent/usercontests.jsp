<%@page import="com.Entities.Courses_users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entities.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.Additional.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.Entities.*"%>
<jsp:include page="header.jsp"/>
<%                    	
	Users u = (Users)request.getSession().getAttribute("user");
	List <Users> groupmates = (List<Users>)request.getAttribute("groupmatesList");
	List<Exam> userExams = (List<Exam>) request.getAttribute("userExams");
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
					<p><%out.print(groupmates.size()); %> Group mates <%out.print(userExams.size()); %> Contests</p>
				</div>
			</div>
		
		    <!-- List of groupmates -->                       
			<div class="panel panel-default">
				<div class="panel-heading"><button onclick="hideOrShow();" class="btn btn-primary pull-right">Hide/Show</button><h4>My friends</h4></div>
					<div id="panel-body1">
						<div class="panel-body">
							<div class="list-group">
								<%
									for(Users group: groupmates){
								%>
							<a href="http://bootply.com/tagged/modal" class="list-group-item"><% out.print(group.getUserData().getName() + " " + group.getUserData().getSurname() + " " + group.getGroup().getName()); %>
							
					        </a>
								<% 
			                 	}
			                %> 
			            </div>
					</div>
				</div>
			</div>
		       
		</div>
		
		<!-- main col right -->
		<div class="col-sm-7">
		
			<div class="well"> 
				<form class="form-horizontal" role="form" action="act?action=startContest" method="post">
	               	<h4>Start contest</h4>
	               	<div class="form-group" style="padding:14px;">
	               		<select class="form-control" name="questionCount">
			             	<option value="10">10</option>
			             	<option value="20">20</option>
			             	<option value="30">30</option>
	               		</select>
	               		<br>
	                </div>
	                <button class="btn btn-primary pull-right" type="submit">Start</button><ul class="list-inline">
	                <li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
	       	     </form>
	        </div>
	        
	        <div class="panel panel-default">
				<div class="panel-heading">
					<h4>Recent exams</h4>
				</div>
				
				<div class="panel-body">
					<div class="list-group">
					<% 
						Exam finishedExam = (Exam) request.getAttribute("finished_exam"); 
						ExamManager currentExam = (ExamManager) session.getAttribute("exam_manager");
					%>
					<% 
						if (userExams != null && !userExams.isEmpty()) {
							Iterator<Exam> iterator = userExams.iterator();
							while (iterator.hasNext()) {
								Exam exam = iterator.next();
								Set<ExamQuestion> examQuestions = exam.getExamQuestions();
					        		int questionCount = examQuestions.size();
					        		int correctCount = 0;
									Iterator<ExamQuestion> examIterator = examQuestions.iterator();
									while (examIterator.hasNext()) {
										ExamQuestion examQuestion = examIterator.next();
										if (examQuestion.getIsCorrect() == 1) {
											correctCount++;
										}
									}
									%>				
				
						<a href="page?page=review-quiz&exam_id=<%= exam.getId() %>" class="list-group-item">
						<%	
							out.print(exam.getCreatedDate().toString() + " ");
							out.print(String.format("%d/%d (%s%%)", correctCount, questionCount, 
		  					new DecimalFormat("#.##").format(((float) correctCount / questionCount) * 100))); 
	  					%>
					</a>		
				<%
					}
				}
			%>	
				</div>
			</div>
		</div>
				     
		</div>
	</div>
			
<jsp:include page="footer.jsp" />                          
		                         