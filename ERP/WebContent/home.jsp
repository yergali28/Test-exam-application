<%@page import="com.Entities.Courses_users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entities.Users"%>
<%@page import="java.util.List"%>
<jsp:include page="header.jsp"/>
<%                    	
	Users u = (Users)request.getSession().getAttribute("user");
	List <Users> groupmates = (List<Users>)request.getAttribute("groupmatesList");
	List <Courses_users> mycourses = (List<Courses_users>)request.getAttribute("mycourses");
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
					<p><%out.print(groupmates.size()); %> Group mates <%out.print(mycourses.size()); %> Courses</p>
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
				<%
					for(Courses_users course: mycourses){
				%>
				<!-- Search implementation -->
					<div class="panel panel-default">
					<div class="panel-heading"><h4><% out.println(course.getCourse_id().getName()); %></h4></div>
						<div class="panel-body">
						<% 
							out.println(course.getCourse_id().getDescription());
						%>
						</div>
					</div>
		   		<%
					}
		   		%>        
				</div>
			</div>
			
<jsp:include page="footer.jsp" />                          
		                         