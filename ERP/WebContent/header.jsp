<%@page import="com.Entities.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%                    	
	Users u = (Users)request.getSession().getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>School ERP</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">     		
	</head>
	<body>
<div class="wrapper">
    <div class="box">
        <div class="row row-offcanvas row-offcanvas-left">
          
            <!-- main right col -->
            <div class="column col-sm-10 col-xs-11" id="main">
                
                <!-- top nav -->
              	<div class="navbar navbar-blue navbar-static-top">  
                    <div class="navbar-header">
                      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle</span>
                        <span class="icon-bar"></span>
          				<span class="icon-bar"></span>
          				<span class="icon-bar"></span>
                      </button>
                      <a href="/" class="navbar-brand logo">b</a>
                  	</div>
                  	<nav class="collapse navbar-collapse" role="navigation">
                    <form class="navbar-form navbar-left">
                        <div class="input-group input-group-sm" style="max-width:360px;">
                          <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
                          <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
                    </form>
                    
                   	<% 
                		if(u!=null){
							if(u.getRole().getName().equals("admin")){
								%>
									<ul class="nav navbar-nav">
									  <li>
				                        <a href="page?page=adminhomepage"><i class="glyphicon glyphicon-home"></i>Home</a>
				                      </li>
				                      <li>
				                        <a href="page?page=admingroups"><i class="glyphicon glyphicon-home"></i>Groups</a>
				                      </li>
				                      <li>
				                        <a href="page?page=admincourses" role="button" data-toggle="modal">Courses</a>
				                      </li>
				                      <li>
				                        <a href="page?page=adminusers" role="button" data-toggle="modal">Users</a>
				                      </li>
				                      <li>
				                      	<a href="page?page=adminquestions" role="button" data-toogle="modal">Questions</a>
				                      </li>
				                      <li>
				                      	<a href="" role="button" data-toogle="modal">Contests</a>
				                      </li>
				                    </ul>
								<% 
							}else if(u.getRole().getName().equals("user")){
								%>
									<ul class="nav navbar-nav">
				                      <li>
				                        <a href="page?page=home"><i class="glyphicon glyphicon-home"></i>My group</a>
				                      </li>
				                      <li>
				                        <a href="#" role="button" data-toggle="modal">My courses</a>
				                      </li>
				                      <li>
				                      	<a href="page?page=usercontests" role="button" data-toggle="modal">My contests</a>
				                      </li>
				                    </ul>
								<% 
							}
                   		%>
                    
                    <ul class="nav navbar-nav navbar-right">
                      <li class="dropdown">
                        <a href="home.jsp" class="dropdown-toggle" data-toggle="dropdown"><% out.print(u.getUserData().getName() + " " + u.getUserData().getSurname() + " | " + u.getRole().getName()); %></a>
                        <%
                        }
                    %>
                        <ul class="dropdown-menu">
                          <li><a href="page?page=profile">My profile</a></li>
                          	<li><a>
                          	<form action = "act?action=logout" method = "post">
								<input type = "submit" value = "Log out">
							</form>
							</a></li>
                        </ul>
                      </li>
                    </ul>
                  	</nav>
                </div>
                <!-- /top nav -->
              
               


		                        