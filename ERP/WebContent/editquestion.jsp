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
	TestQuestion t = (TestQuestion)request.getSession().getAttribute("testQuestion");
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
		                          	
                    
		</div>
		
		<!-- main col right -->
		<center>
        <div class="well"> 
				<form class="form-horizontal" role="form" action="act?action=saveChanges" method="post">
                	<h4>Edit question</h4>
                	<div class="form-group" style="padding:14px;">
                    	<textarea name="questionContent" class="form-control" placeholder="Enter content of question..." style="height: 80px;"><%=t.getQuestion() %></textarea><br>
						<textarea name="v1" class="form-control" placeholder="Variant one" style="width: 663px; display: inline-block;"><%=t.getAnswerOne() %></textarea>
						<textarea name="v2" class="form-control" placeholder="Variant two" style="width: 663px; display: inline-block;"><%=t.getAnswerTwo() %></textarea><br><br>
						<textarea name="v3" class="form-control" placeholder="Variant three" style="width: 663px; display: inline-block;"><%=t.getAnswerThree() %></textarea>
						<textarea name="v4" class="form-control" placeholder="Variant four" style="width: 663px; display: inline-block;"><%=t.getAnswerFour() %></textarea><br>
						
						<h5>Assign correct answer</h5>
						<select class="form-control" name="correctAnswer">
						<%
							if(t.getCorrectAnswer()==1){
								%>
									<option value="1" selected="selected">Variant one</option>
				               		<option value="2">Variant two</option>
				               		<option value="3">Variant three</option>
				               		<option value="4">Variant four</option>
								<%
							}else if(t.getCorrectAnswer()==2){
								%>
									<option value="1">Variant one</option>
				               		<option value="2" selected="selected">Variant two</option>
				               		<option value="3">Variant three</option>
				               		<option value="4">Variant four</option>
								<%
							}else if(t.getCorrectAnswer()==3){
								%>
									<option value="1" selected="selected">Variant one</option>
				               		<option value="2">Variant two</option>
				               		<option value="3" selected="selected">Variant three</option>
				               		<option value="4">Variant four</option>
								<%
							}else{
								%>
									<option value="1" selected="selected">Variant one</option>
				               		<option value="2">Variant two</option>
				               		<option value="3">Variant three</option>
				               		<option value="4" selected="selected">Variant four</option>
								<%
							}
						%>
               			</select>
                    </div>
                    <input type="hidden" value="<% out.println(t.getId()); %>" name="questionId">
                    <button class="btn btn-primary pull-right" type="submit">Save</button><ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
                </form>
            </div>
            </center>
		                    
</div>
			
<jsp:include page="footer.jsp" />                          
		                         