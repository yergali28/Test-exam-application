<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entities.Users"%>
<%@page import="com.Additional.ExamManager"%>
<%@page import="com.Entities.TestQuestion"%>
<%@page import="com.Entities.Exam"%>
<%@page import="com.Entities.ExamQuestion"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%                    	
	Users u = (Users)request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Exam</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="description" content="User information form snippet with timezones" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link rel="apple-touch-icon" href="/bootstrap/img/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/bootstrap/img/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/bootstrap/img/apple-touch-icon-114x114.png">
		<link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">


        <!-- CSS code from Bootply.com editor --> 
        <style type="text/css">
            /* CSS used here will be applied after bootstrap.css */
        </style>
    </head>
    
    <!-- HTML code from Bootply.com editor -->
    <body  >
  <% 
  	Exam exam = (Exam) request.getAttribute("exam");
	Set<ExamQuestion> examQuestions = exam.getExamQuestions();
  %>   
  <div class="container">
    <h1><%=u.getUserData().getName() + " " + u.getUserData().getSurname() %></h1>
    <hr>
  <div class="row">
      <%
      int question = 0;
      Iterator<ExamQuestion> examIterator = examQuestions.iterator();
			while (examIterator.hasNext()) {
				question++;
				ExamQuestion examQuestion = examIterator.next();
				long correct = examQuestion.getIsCorrect();
				
				
			
      %>
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
       			<hr>
		          	<h3>Question <%= String.valueOf(question) %></h3>
        		<hr>
        
			          <div class="form-group">
			          	<h4 class="col-lg-8"><%= examQuestion.getQuestion() %></h4>
			          </div>
			          <div class="form-group">
			             <label class="col-lg-8">
			             <%
			             	if(examQuestion.getUserAnswer()==1){
			             		if(examQuestion.getCorrectAnswer()==examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked="checked" disabled> <label style="color: green;"> a. <%=examQuestion.getAnswerOne() %></label>
			             		<%
			             		}else if(examQuestion.getCorrectAnswer()!=examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked="checked" disabled> <label style="color: red;"> a. <%=examQuestion.getAnswerOne() %></label>
			             		<%
			             		}
			             	}else if(examQuestion.getUserAnswer()!=1){
			             		%>
			             			<input type="radio" disabled> a. <%=examQuestion.getAnswerOne() %>
			             		<% 
			             	}
			             %>
			             </label>
			          </div>			          
			          <div class="form-group">
			             <label class="col-lg-8">
						<%
			             	if(examQuestion.getUserAnswer()==2){
			             		if(examQuestion.getCorrectAnswer()==examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked disabled> <label style="color: green;"> b. <%=examQuestion.getAnswerTwo() %></label>
			             		<%
			             		}else if(examQuestion.getCorrectAnswer()!=examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked disabled> <label style="color: red;"> b. <%=examQuestion.getAnswerTwo() %></label>
			             		<%
			             		}
			             	}else if(examQuestion.getUserAnswer()!=2){
			             		%>
			             			<input type="radio" disabled> b. <%=examQuestion.getAnswerTwo() %>
			             		<% 
			             	}
			             %>	
			             </label>
			          </div>
			          <div class="form-group">
			             <label class="col-lg-8">
						<%
			             	if(examQuestion.getUserAnswer()==3){
			             		if(examQuestion.getCorrectAnswer()==examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked disabled> <label style="color: green;"> c. <%=examQuestion.getAnswerThree() %></label>
			             		<%
			             		}else if(examQuestion.getCorrectAnswer()!=examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked disabled> <label style="color: red;"> c. <%=examQuestion.getAnswerThree() %></label>
			             		<%
			             		}
			             	}else if(examQuestion.getUserAnswer()!=3){
			             		%>
			             			<input type="radio" disabled> c. <%=examQuestion.getAnswerThree() %>
			             		<% 
			             	}
			             %>	
			             </label>
			          </div>
			          <div class="form-group">
			    		 <label class="col-lg-8">
						<%
			             	if(examQuestion.getUserAnswer()==4){
			             		if(examQuestion.getCorrectAnswer()==examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked disabled> <label style="color: green;"> d. <%=examQuestion.getAnswerFour() %></label>
			             		<%
			             		}else if(examQuestion.getCorrectAnswer()!=examQuestion.getUserAnswer()){
			             		%>
			             			<input type="radio" checked disabled> <label style="color: red;"> d. <%=examQuestion.getAnswerFour() %></label>
			             		<%
			             		}
			             	}else if(examQuestion.getUserAnswer()!=4){
			             		%>
			             			<input type="radio" disabled> d. <%=examQuestion.getAnswerFour() %>
			             		<% 
			             	}
			             %>	
			    		 </label>	            
					  </div>
		          </div>
		       <%
			}
		       %>
      
  </div>
</div>
<hr>
        
        <script type='text/javascript' src="assets/js/jquery.min.js"></script>


        <script type='text/javascript' src="assets/js/bootstrap.min.js"></script>






        
        <!-- JavaScript jQuery code from Bootply.com editor  -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        
            
        
        });
        
        </script>
        
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
          ga('create', 'UA-40413119-1', 'bootply.com');
          ga('send', 'pageview');
        </script>
        
        
        <style>
            .ad {
              position: absolute;
              bottom: 70px;
              right: 48px;
              z-index: 992;
              background-color:#f3f3f3;
              position: fixed;
              width: 155px;
              padding:1px;
            }
            
            .ad-btn-hide {
              position: absolute;
              top: -10px;
              left: -12px;
              background: #fefefe;
              background: rgba(240,240,240,0.9);
              border: 0;
              border-radius: 26px;
              cursor: pointer;
              padding: 2px;
              height: 25px;
              width: 25px;
              font-size: 14px;
              vertical-align:top;
              outline: 0;
            }
            
            .carbon-img {
              float:left;
              padding: 10px;
            }
            
            .carbon-text {
              color: #888;
              display: inline-block;
              font-family: Verdana;
              font-size: 11px;
              font-weight: 400;
              height: 60px;
              margin-left: 9px;
              width: 142px;
              padding-top: 10px;
            }
            
            .carbon-text:hover {
              color: #666;
            }
            
            .carbon-poweredby {
              color: #6A6A6A;
              float: left;
              font-family: Verdana;
              font-size: 11px;
              font-weight: 400;
              margin-left: 10px;
              margin-top: 13px;
              text-align: center;
            }
        </style>
        
        
    </body>
</html>

