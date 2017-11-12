package com.Servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Additional.ExamManager;
import com.Beans.CourseBeanLocal;
import com.Beans.ExamBeanLocal;
import com.Beans.GroupBeanLocal;
import com.Beans.QuestionBeanLocal;
import com.Beans.UserBeanLocal;
import com.Entities.Courses;
import com.Entities.Courses_users;
import com.Entities.Exam;
import com.Entities.Groups;
import com.Entities.TestQuestion;
import com.Entities.Users;

/**
 * Servlet implementation class PageServlet
 */
@WebServlet("/page")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	UserBeanLocal userBean;
	
	@EJB
	CourseBeanLocal courseBean;
	
	@EJB
	GroupBeanLocal groupBean;
	
	@EJB
	QuestionBeanLocal questionBean;
	
	@EJB
	ExamBeanLocal examBean;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("page");
		String loadPage = "login";
		
		Users u = (Users) request.getSession().getAttribute("user");
		if(page!=null && page!=""){
			
			if(u!=null && u.getId()!=null){
				
				if(u.getRole().getName().equals("admin")){
					
					if(page.equals("adminhomepage")){
						loadPage = "adminhomepage";
						
						List<Groups> allgroups = groupBean.getAllGroups();
						request.setAttribute("allgroups", allgroups);
						List<Courses> allcourses = courseBean.getAllCourses();
						request.setAttribute("allcourses", allcourses);
					}else if(page.equals("admingroups")){
						loadPage = "admingroups";
						
						List<Groups> allgroups = groupBean.getAllGroups();
						request.setAttribute("allgroups", allgroups);
					}else if(page.equals("editquestion")){
						loadPage = "editquestion";
					}else if(page.equals("adminquestions")){
						loadPage = "adminquestions";
						
						List<TestQuestion> questions = questionBean.getTestQuestions();
						request.setAttribute("allquestions", questions);
					}else if(page.equals("admincourses")){
						loadPage = "admincourses";
						
						List<Courses> allcourses = courseBean.getAllCourses();
						request.setAttribute("allcourses", allcourses);
						List<Users> allusers = userBean.getAllUsers();
						request.setAttribute("allusers", allusers);
					}else if(page.equals("adminusers")){
						loadPage = "adminusers";
						
						List<Groups> allgroups = groupBean.getAllGroups();
						request.setAttribute("allgroups", allgroups);
						List<Users> allusers = userBean.getAllUsers();
						request.setAttribute("allusers", allusers);
					}else if(page.equals("edituser")){
						loadPage = "edituser";

						List<Groups> allgroups = groupBean.getAllGroups();
						request.setAttribute("allgroups", allgroups);
					}else if(page.equals("profile")){
						loadPage = "profile";
					}else if(page.equals("addnewuser")){
						loadPage = "addnewuser";
						
						List<Groups> allgroups = groupBean.getAllGroups();
						request.setAttribute("allgroups", allgroups);
					}
					
				}else if(u.getRole().getName().equals("user")){
					
					if(page.equals("home")){
						loadPage = "home";
						List<Users> groupmates = userBean.getUserGroupmates(u.getGroup().getId(), u.getId());
						request.setAttribute("groupmatesList", groupmates);
						List<Courses_users> mycourses = courseBean.getCoursesByUserId(u.getId());
						request.setAttribute("mycourses", mycourses);
					}else if(page.equals("profile")){
						loadPage = "profile";
					}else if(page.equals("usercontests")){
						loadPage = "usercontests";
						List<Users> groupmates = userBean.getUserGroupmates(u.getGroup().getId(), u.getId());
						request.setAttribute("groupmatesList", groupmates);
						
						List<Exam> userExams = (List<Exam>) examBean.getUserExamsById(u.getId());
						request.setAttribute("userExams", userExams);
					}else if(page.equals("quiz")){
						loadPage = "quiz";
						int count = (int) request.getSession().getAttribute("questionCountSession");
						System.out.println("Question count from page servlet: " + count);
						if (count==10 || count==20 || count==30){
														
							List<TestQuestion> questions = questionBean.getRandomTestQuestions(count);
							ExamManager manager = (ExamManager) request.getSession().getAttribute("exam_manager");
							
							if (manager == null) {
								manager = ExamManager.createExam(questions);
							}
							
							Long currentExamId = (Long) request.getSession().getAttribute("exam_id");
							
							Exam currentExam = examBean.getExamById(currentExamId);
							
							request.setAttribute("current_exam", currentExam);
							request.getSession().setAttribute("exam_manager", manager);
						}
					}else if(page.equals("review-quiz")){
						loadPage = "review-quiz"; 
								
						String examIdString = request.getParameter("exam_id");
						System.out.println("This is exam_id from page servlet: " + examIdString);
						if (!examIdString.equals("") && examIdString!=null) {
							long examId = Long.parseLong(examIdString);
							
							Exam exam = examBean.getExamById(examId);
							
							request.setAttribute("exam", exam);
						}
					}
					
				}
		
			}else{
				if(page.equals("login")){
					loadPage = "login";
				}
			}
		}
		request.getRequestDispatcher("/" + loadPage + ".jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
