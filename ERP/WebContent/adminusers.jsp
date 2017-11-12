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
	List <Groups> allgroups = (List<Groups>)request.getAttribute("allgroups");
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
					<p><%out.print(allgroups.size()); %> Groups <%out.print(allusers.size()); %> Users</p>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading"><button onclick="hideOrShow();" class="btn btn-primary pull-right">Hide/Show</button><h4>All groups</h4></div>
					<div id="panel-body1">
						<div class="panel-body">
							<div class="list-group">
								<%
									for(Groups group: allgroups){
								%>
							<a href="http://bootply.com/tagged/modal" class="list-group-item"><% out.print(group.getName()); %>
							
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
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<form action="act?action=addNewUser" method="post">
					<button type="submit" action="act?action=addNewUser" class="btn btn-primary pull-right">
						<i class="glyphicon glyphicon-plus"></i>User
					</button>
					<h4>All users</h4></div>
				</form>
				
				<div class="panel-body">
				<div class="list-group">
						<%
							for(Users user: allusers){
								if(user.getId()!=u.getId()){
									%>
								<a href="" class="list-group-item"><% 
									if(user.getGroup()!=null){ 
										out.print(user.getUserData().getName() + " " + user.getUserData().getSurname() 
												+ " " + user.getGroup().getName() + " | " + user.getRole().getName());
									}else{
										out.print(user.getUserData().getName() + " " + user.getUserData().getSurname() 
												+ " | " + user.getRole().getName());
									}
									%>
									<span style="float:right;">
				                	    <form action="act?action=deleteUser" method="post">
				                           <input type = "hidden" value = "<% out.println(user.getId()); %>" name="userID">
				                           <input type="submit" class="btn btn-primary pull-right" value="Delete"/>
				                        </form>
				                    </span>
				                    
				                    <span style="float:right;">
				                	    <form action="act?action=editUser" method="post">
				                           <input type = "hidden" value = "<%=user.getId() %>" name="userID">
				                           <input type="submit" class="btn btn-primary pull-right" value="Edit"/>
				                        </form>
				                    </span>
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
		                         