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
					<p><%out.print(allgroups.size()); %> Groups</p>
				</div>
			</div>
			
			<div class="well"> 
				<form class="form-horizontal" role="form" action="act?action=addGroup" method="post">
                	<h4>Add a new group</h4>
                	<div class="form-group" style="padding:14px;">
                    	<textarea name="groupName" class="form-control" placeholder="Enter a group name..."></textarea>
                    </div>
                    <button class="btn btn-primary pull-right" type="submit">Add</button><ul class="list-inline">
                    <li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
                </form>
            </div>	
		                    
		</div>
		
		<!-- main col right -->
			<div class="col-sm-7">
			
			<div class="panel panel-default">
				<div class="panel-heading"><button onclick="hideOrShow();" class="btn btn-primary pull-right">Hide/Show</button><h4>All groups</h4></div>
					<div id="panel-body1">
						<div class="panel-body">
							<div class="list-group">
								<%
									for(Groups group: allgroups){
								%>
							<a href="#" class="list-group-item">
								<span style="float:right;">
			                	    <form action="act?action=deleteGroup" method="post">
			                           <input type = "hidden" value = "<% out.println(group.getId()); %>" name="groupID">
			                           <input type="submit" class="btn btn-primary pull-right" value="Delete"/>
			                        </form>
			                    </span>
			                    
			                    
				                <form action="act?action=editGroup" method="post">
									<input type="text" name="groupN" value="<% out.print(group.getName()); %>">
									<span style="float:right;">
										<input type = "hidden" value = "<% out.println(group.getId()); %>" name="groupID">
				              	    	<input type="submit" class="btn btn-primary pull-right" value="Edit"/>
			                  	    </span>
			               		</form>
			                    
					        </a>
								<% 
			                 	}
			                %> 
			            </div>
					</div>
				</div>
			</div>
		                     
			</div>
		</div>
	
	
<jsp:include page="footer.jsp" />                          
		                         