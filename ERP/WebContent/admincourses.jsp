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
	List <Courses> allcourses = (List<Courses>)request.getAttribute("allcourses");
	List <Users> allusers = (List<Users>)request.getAttribute("allusers");
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
					<p><%out.print(allcourses.size()); %> Courses</p>
				</div>
			</div>
			
			<div class="well"> 
				<form class="form-horizontal" role="form" action="act?action=addCourse" method="post">
                	<h4>Add a new course</h4>
                	<div class="form-group" style="padding:14px;">
                    	<textarea name="courseName" class="form-control" placeholder="Enter a course name..."></textarea><br>
						<textarea name="courseDescription" class="form-control" placeholder="Enter a course description.." style="height: 100px;"></textarea>
                    </div>
                    <button class="btn btn-primary pull-right" type="submit">Add</button><ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
                </form>
            </div>	
                    
		</div>
		
		<!-- main col right -->
		<div class="col-sm-7">
		
		<div class="well"> 
			<form class="form-horizontal" role="form" action="act?action=assignCourse" method="post">
               	<h4>Assign course for user</h4>
               	<div class="form-group" style="padding:14px;">
               	<select class="form-control" name="user_id">
	               		<%
	               			for(Users user: allusers){
	               				if(user.getGroup()!=null){
			               		%>
		               			<option value="<% out.print(user.getId());%>"><% out.print(user.getUserData().getName() + " " + user.getUserData().getSurname() + " " + user.getGroup().getName());%></option>
			               		<%
	               				}
	               			}
	               		%>
               		</select>
               		<br>
               		
					<select class="form-control"  name="course_id">
	               		<%
							for(Courses course: allcourses){
						%>
               			<option value="<% out.print(course.getId());%>"><% out.print(course.getName()); %></option>
	               		<%
							}
						%>
					</select>
                </div>
                <button class="btn btn-primary pull-right" type="submit">Assign</button><ul class="list-inline">
                <li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
       	     </form>
        </div>
        
        <%
			for(Courses course: allcourses){
		%>
        <div class="well"> 
               	<h4>Edit or delete existed courses
               		<form action="act?action=deleteCourse" method="post">
						<input type = "hidden" value = "<% out.println(course.getId()); %>" name="courseID">
			            <input type="submit" class="btn btn-primary pull-right" value="Delete"/>
			        </form>
			    </h4>
					
                <form action="act?action=editCourse" method="post">
	                <div class="form-group" style="padding:14px;">
	                   	<textarea name="courseName" class="form-control" placeholder="Enter a course name..."><% out.print(course.getName()); %></textarea><br>
						<textarea name="courseDescription" class="form-control" placeholder="Enter a course description.." style="height: 75px;"><% out.print(course.getDescription()); %></textarea>
	                </div>
					<input type = "hidden" value = "<% out.println(course.getId()); %>" name="courseID">
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
		                         