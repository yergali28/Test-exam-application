<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  	<title>Sign-Up/Login Form</title>
	<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  	<link rel="stylesheet" href="css/styleLR.css">
</head>

<body>
  	<div class="form">
    	
   	<div class="tab-content">  
          	<h1>Sign In</h1>
          	<form action="act?action=authentication" method="post">
          		<div class="field-wrap">
            	<label>Login<span class="req">*</span></label>
            	<input type="text" name="login" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            	<label>Password<span class="req">*</span></label>
            	<input type="password" name="password" required autocomplete="off"/>
          </div>
  
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          	<button class="button button-block"/>LOGIN</button>
          </form>	
        </div>
      </div><!-- tab-content -->
</div> <!-- /form -->
  	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
</body>
</html>
