<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entities.Users"%>
<%@page import="com.Additional.ExamManager"%>
<%@page import="com.Entities.TestQuestion"%>
<%@page import="com.Entities.Exam"%>
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
		ExamManager manager = (ExamManager) session.getAttribute("exam_manager");
		TestQuestion currentQuestion = manager.getCurrentQuestion();
		
		boolean isLastQuestion = (manager.getCurrentQuestionIndex() + 1 == manager.getTestQuestions().size());
		
		String buttonLabel = !isLastQuestion ? "Next question" : "End exam";
		
		Exam currentExam = (Exam) request.getAttribute("current_exam");
  %>   
  <div class="container">
    <h1><%=u.getUserData().getName() + " " + u.getUserData().getSurname() %></h1>
    <hr>
  <div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a>
          <i class="fa fa-coffee"></i>
          Exam started at <strong><%= currentExam.getCreatedDate().toString() %></strong>
        	</div>
        		<h3><%= String.format("Question %d out of %d", manager.getCurrentQuestionIndex() + 1, manager.getTestQuestions().size()) %></h3>
        
		        <form class="form-horizontal" role="form" action="act?action=nextQuestion" method="post">
			          <div class="form-group">
			            <h4 class="col-lg-8"><%= currentQuestion.getQuestion() %></h4>
			          </div>
			          <div class="form-group">
			             <label class="col-lg-8">
			             	<input name="answer" type="radio" value="1"> a. <%=currentQuestion.getAnswerOne() %>
			             </label>
			          </div>			          
			          <div class="form-group">
			             <label class="col-lg-8">
			               <input name="answer" type="radio" value="2"> b. <%=currentQuestion.getAnswerTwo() %>
			             </label>
			          </div>
			          <div class="form-group">
			             <label class="col-lg-8">
			             	<input name="answer" type="radio" value="3"> c. <%=currentQuestion.getAnswerThree() %>
			             </label>
			          </div>
			          <div class="form-group">
			    		 <label class="col-lg-8">
			    		 	<input name="answer" type="radio" value="4"> d. <%= currentQuestion.getAnswerFour() %>
			    		 </label>	            
					  </div>
		          
		          <div class="form-group">
		            <label class="col-md-3 control-label">Place for timer</label>
		            <div class="col-md-8">
		              <input type="submit" class="btn btn-primary" value="<%= buttonLabel %>" style="float: right;">
		              <span></span>
		            </div>
		          </div>
		        </form>
      </div>
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

