<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entities.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.Entities.Groups"%>
<%                    	
	Users u = (Users)request.getSession().getAttribute("uEdit"); 
	List <Groups> allgroups = (List<Groups>)request.getAttribute("allgroups");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>BEdit profile</title>
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
    
    <body>
        
        <div class="container">
    <h1>Edit Profile</h1>
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
          Welcome <strong>.admin</strong>.
        </div>
        <h3>Personal info</h3>
        
        <form class="form-horizontal" role="form" method="post" action="act?action=editUserInformation">
          <div class="form-group">
            <label class="col-lg-3 control-label">First name:</label>
            <div class="col-lg-8">
              <input type="hidden" name="id" value="<%=u.getId() %>">
              <input class="form-control" type="text" name="name" value="<%=u.getUserData().getName() %>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Last name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="surname" value="<%=u.getUserData().getSurname() %>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Login:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="login" value="<%=u.getLogin() %>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Password:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="password" value="<%=u.getPassword() %>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Role:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="role" value="<%=u.getRole().getName() %>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Active:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="active" value="<%=u.getActive() %>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Group:</label>
            <div class="col-lg-8">
              <div class="ui-select">
                <select id="user_time_zone" class="form-control" name="groupId">
                  <option value="<%=u.getGroup().getId() %>" selected="selected"><%=u.getGroup().getName() %></option>
                 	 	<%
	               			for(Groups group: allgroups){
	               				if(!group.getName().equals(u.getGroup().getName())){
			               		%>
		               			<option value="<%=group.getId() %>"><%=group.getName() %></option>
			               		<%
	               				}
	               			}
	               		%>
                </select>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Save Changes">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
        
        <script type='text/javascript' src="js/jquery.min.js"></script>
        <script type='text/javascript' src="js/bootstrap.min.js"></script>

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
        <div class="ad collapse in">
          <button class="ad-btn-hide" data-toggle="collapse" data-target=".ad">&times;</button>
          <script async type="text/javascript" src="js/index.js" id="_carbonads_js"></script>
        </div>
        
    </body>
</html>

