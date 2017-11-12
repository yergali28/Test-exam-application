package com.Servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Additional.ExamManager;
import com.Beans.CourseBeanLocal;
import com.Beans.ExamBeanLocal;
import com.Beans.GroupBeanLocal;
import com.Beans.QuestionBeanLocal;
import com.Beans.UserBeanLocal;
import com.Entities.Exam;
import com.Entities.ExamQuestion;
import com.Entities.TestQuestion;
import com.Entities.Users;

import sun.net.www.content.image.gif;

/**
 * Servlet implementation class OperationServlet
 */
@WebServlet("/act")
public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@EJB
	UserBeanLocal userBean;
	
	@EJB
	GroupBeanLocal groupBean;
	
	@EJB
	CourseBeanLocal courseBean;
	
	@EJB
	QuestionBeanLocal questionBean;
	
	@EJB
	ExamBeanLocal examBean;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String redirect = "page?page=login";
		
		if(action!=null && !action.trim().equals("")){
			
			if(action.equals("authentication")){
				
				String login = request.getParameter("login");
				String password = request.getParameter("password");
				
				if(login.trim()!="" && password.trim()!=""){
					Users user = userBean.getUserByLoginAndPassword(login, password);
					if(user==null){
						redirect = "page?page=login";
					}else{
						request.getSession().setAttribute("user", user);
						if(user.getRole().getName().equals("admin")){
							redirect = "page?page=adminhomepage";
						}else if(user.getRole().getName().equals("user")){
							redirect = "page?page=home";
						}
					}
				}else{
					redirect = "page?page=login";
				}
			}else if(action.equals("logout")){
				Users u = (Users)request.getSession().getAttribute("user");
				request.getSession().setAttribute("user", null);
				redirect = "page?page=login";
			}else if(action.equals("editAdminProfile")){
	
				Users u = (Users) request.getSession().getAttribute("user");
				Long id = u.getId();
				System.out.println("This is id of admin: " + id);
				String name = request.getParameter("name");
				String surname = request.getParameter("surname");
				String login = request.getParameter("login");
				String password = request.getParameter("password");
				if((!name.trim().equals("")) || (!surname.trim().equals("")) || (!login.trim().equals("")) || (!password.trim().equals(""))){
					
					userBean.editAdminProfile(id, name, surname, login, password);
					
				}
				request.getSession().setAttribute("user", null);
				redirect = "page?page=login";
				
			}else if(action.equals("editUserProfile")){
	
				Users u = (Users) request.getSession().getAttribute("user");
				Long id = u.getId();
				System.out.println("This is id of user: " + id);
				String password = request.getParameter("password");
				if((!password.trim().equals(""))){
					
					userBean.editUserProfile(id, password);
					
				}
				request.getSession().setAttribute("user", null);
				redirect = "page?page=login";
			}else if(action.equals("addGroup")){
				
				String groupName = request.getParameter("groupName");
				if(!groupName.trim().equals("")){
					groupBean.addGroup(groupName.trim());
				}
				
				redirect = "page?page=admingroups";
			}else if(action.equals("addCourse")){
				
				String courseName = request.getParameter("courseName");
				String courseDescription = request.getParameter("courseDescription");
				
				if((!courseName.trim().equals("")) && (!courseDescription.trim().equals(""))){
					courseBean.addCourse(courseName, courseDescription);
				}
				
				redirect = "page?page=admincourses";
			}else if(action.equals("assignCourse")){
				
				String user_id = request.getParameter("user_id");
				String course_id = request.getParameter("course_id");
				System.out.println("This is test for ids " + user_id + " " + course_id);
				Long uid = new Long(0);
				Long cid = new Long(0);
				try {
					uid = Long.parseLong(user_id);
					cid = Long.parseLong(course_id);
				} catch (Exception e) {
					e.printStackTrace();
				}
				courseBean.assignCourse(uid, cid);
				redirect = "page?page=admincourses";
			}else if(action.equals("deleteGroup")){
				
				String groupID = request.getParameter("groupID");
				Long gid = new Long(0);
				try {
					gid = Long.parseLong(groupID.trim());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				groupBean.deleteGroup(gid);
				redirect = "page?page=admingroups";
			}else if(action.equals("editGroup")){
				
				String groupName = request.getParameter("groupN");
				String groupID = request.getParameter("groupID");
				Long gid = new Long(0);
				try {
					gid = Long.parseLong(groupID.trim());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				System.out.println(" Gid and groupName " + gid + " " + groupName);
				groupBean.editGroup(gid, groupName);
				redirect = "page?page=admingroups";
			}else if(action.equals("deleteCourse")){
				
				String courseID = request.getParameter("courseID");
				System.out.println("CourseID " + courseID);
				Long cid = new Long(0);
				try {
					cid = Long.parseLong(courseID.trim());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				System.out.println(cid);
				courseBean.deleteCourse(cid);
				redirect = "page?page=admincourses";
			}else if(action.equals("editCourse")){
				
				String courseName = request.getParameter("courseName");
				String courseDescription = request.getParameter("courseDescription");
				String courseID = request.getParameter("courseID");
				Long cid = new Long(0);
				try {
					cid = Long.parseLong(courseID.trim());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				System.out.println(" Gid and groupName " + cid + " " + courseName + " " + courseDescription);
				courseBean.editCourse(cid, courseName, courseDescription);
				redirect = "page?page=admincourses";
			}else if(action.equals("deleteUser")){
				
				String userID = request.getParameter("userID");
				System.out.println("UserID " + userID);
				Long uid = new Long(0);
				try {
					uid = Long.parseLong(userID.trim());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				System.out.println(uid);
				userBean.deleteUser(uid);
				redirect = "page?page=adminusers";
			}else if(action.equals("editUser")){
				
				String userID = request.getParameter("userID");
				System.out.println("UserID " + userID);
				Long uid = new Long(0);
				try {
					uid = Long.parseLong(userID.trim());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				System.out.println(uid);
				Users uEdit = userBean.getUserById(uid);
				request.getSession().setAttribute("uEdit", uEdit);
				redirect = "page?page=edituser";
			}else if(action.equals("editUserInformation")){
				
				String idSt = request.getParameter("id").trim();
				String name = request.getParameter("name").trim();
				String surname = request.getParameter("surname").trim();
				String login = request.getParameter("login").trim();
				String password = request.getParameter("password").trim();
				String role = request.getParameter("role").trim();
				String active = request.getParameter("active").trim();
				String group = request.getParameter("groupId").trim();
				
				int activE = 0;
				Long groupId = new Long(0);
				Long id = new Long(0);
				try {
					activE = Integer.parseInt(active);
					groupId = Long.parseLong(group);
					id = Long.parseLong(idSt);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				userBean.editUser(id, name, surname, login, password, role, activE, groupId);
				redirect = "page?page=adminusers";
			}else if(action.equals("addNewUser")){
				redirect = "page?page=addnewuser";
			}else if(action.equals("saveNewUser")){
				
				String name = request.getParameter("name").trim();
				String surname = request.getParameter("surname").trim();
				String login = request.getParameter("login").trim();
				String password = request.getParameter("password").trim();
				String role = request.getParameter("role").trim();
				String group = request.getParameter("groupId").trim();
				String birth = request.getParameter("date").trim();
				
				System.out.println("Name " + name);
				System.out.println("Surname " + surname);
				System.out.println("Login " + login);
				System.out.println("Password " + password);
				System.out.println("Role " + role);
				System.out.println("Group " + group);
				System.out.println("Birth " + birth);
				if((!name.equals("")) && (!surname.equals("")) && (!login.equals("")) && (!password.equals("")) && (!role.equals("")) && (!birth.equals(""))){
					userBean.addNewUser(name, surname, login, password, role, birth, group);
				}
				redirect = "page?page=adminusers";
			}else if(action.equals("addQuestion")){
				
				String content = request.getParameter("questionContent").trim();
				String v1 = request.getParameter("v1").trim();
				String v2 = request.getParameter("v2").trim();
				String v3 = request.getParameter("v3").trim();
				String v4 = request.getParameter("v4").trim();
				String correctAnswerString = request.getParameter("correctAnswer").trim();
				
				if(!content.equals("") && !v1.equals("") && !v2.equals("") && !v3.equals("") && !v4.equals("") && !correctAnswerString.equals("")){
					long correctAnswer = Long.parseLong(correctAnswerString);
					
					TestQuestion testQuestion = questionBean.createTestQuestionEntity(content, v1, v2, v3, v4, correctAnswer);
					
					questionBean.addTestQuestion(testQuestion);
					redirect = "page?page=adminquestions";
				}
			}else if(action.equals("deleteQuestion")){
				
				String questionID = request.getParameter("questionID").trim();
				if(!questionID.equals("")){
					long id = Long.parseLong(questionID);
					System.out.println("This is id: " + id);
					questionBean.deleteTestQuestion(id);
				}
				
				redirect = "page?page=adminquestions";
				
			}else if(action.equals("editQuestion")){
				
				String content = request.getParameter("question").trim();
				String v1 = request.getParameter("v1").trim();
				String v2 = request.getParameter("v2").trim();
				String v3 = request.getParameter("v3").trim();
				String v4 = request.getParameter("v4").trim();
				String correctAnswerString = request.getParameter("correctAnswer").trim();
				String id = request.getParameter("questionId").trim();
				if(!content.equals("") && !v1.equals("") && !v2.equals("") && !v3.equals("") && !v4.equals("") && !correctAnswerString.equals("") && !id.equals("")){
					long correctAnswer = Long.parseLong(correctAnswerString);
					long ID = Long.parseLong(id);
					TestQuestion testQuestion = new TestQuestion();
					testQuestion.setId(ID);
					testQuestion.setQuestion(content);
					testQuestion.setAnswerOne(v1);
					testQuestion.setAnswerTwo(v2);
					testQuestion.setAnswerThree(v3);
					testQuestion.setAnswerFour(v4);
					testQuestion.setCorrectAnswer(correctAnswer);;
					HttpSession session = request.getSession();
					session.setAttribute("testQuestion", testQuestion);
					redirect = "page?page=adminquestions";
				}
				
				redirect = "page?page=editquestion";
			}else if(action.equals("saveChanges")){
				
				String id = request.getParameter("questionId").trim();
				String content = request.getParameter("questionContent").trim();
				String v1 = request.getParameter("v1").trim();
				String v2 = request.getParameter("v2").trim();
				String v3 = request.getParameter("v3").trim();
				String v4 = request.getParameter("v4").trim();
				String correctAnswerString = request.getParameter("correctAnswer").trim();
				
				if(!content.equals("") && !v1.equals("") && !v2.equals("") && !v3.equals("") && !v4.equals("") && !correctAnswerString.equals("")){
					long correctAnswer = Long.parseLong(correctAnswerString);
					long ID = Long.parseLong(id);
					TestQuestion testQuestion = questionBean.createTestQuestionEntity(content, v1, v2, v3, v4, correctAnswer);
					
					questionBean.editTestQuestion(testQuestion, ID);
					redirect = "page?page=adminquestions";
				}
			}else if(action.equals("startContest")){
				
				Users u = (Users)request.getSession().getAttribute("user");
				String questionCountString = request.getParameter("questionCount");
				System.out.println(questionCountString);
				if (!questionCountString.equals("") && questionCountString!=null) {
					int questionCount = Integer.parseInt(questionCountString);
					request.getSession().setAttribute("questionCountSession", questionCount);
					Exam exam = new Exam();
					exam.setUser(u.getId());
					
					Long examId = examBean.createExam(exam);
					
					request.getSession().setAttribute("exam_id", examId);
					
					redirect = "page?page=quiz&question_count=" + questionCount;
				}
			}else if(action.equals("nextQuestion")){
				ExamManager manager = (ExamManager) request.getSession().getAttribute("exam_manager");
				String answerValueString = request.getParameter("answer");
				if (answerValueString == null) {
					answerValueString = "0";
				}
				
				if (!answerValueString.equals("") && answerValueString!=null) {
					long answerValue = Long.parseLong(answerValueString);
					Long currentExamId = (Long) request.getSession().getAttribute("exam_id");
					
					Exam exam = new Exam();
					exam.setId(currentExamId);
					
					ExamQuestion examQuestion = new ExamQuestion();
					examQuestion.setExam(exam);
					examQuestion.submitTestQuestion(manager.getCurrentQuestion());
					examQuestion.setUserAnswer(answerValue);
					
					manager.addExamQuestion(examQuestion);
					
					if (manager.getCurrentQuestionIndex() + 1 == manager.getTestQuestions().size()) {
						
						List<ExamQuestion> examQuestions = manager.getExamQuestions();
						
						for (ExamQuestion question: examQuestions) {
							long correct = question.getCorrectAnswer() == question.getUserAnswer() ? 1 : 2;
							question.setIsCorrect(correct);
							
							questionBean.addExamQuestion(question);
						}

						request.getSession().setAttribute("exam_manager", null);
						request.getSession().setAttribute("exam_id", null);
						
						redirect = "page?page=usercontests&finished_exam=" + currentExamId;
					}else {
						int questionCount = manager.getTestQuestions().size();
						manager.changeQuestion();

						redirect = "page?page=quiz&question_count=" + questionCount;
					}
				}
			}
			
		}
		response.sendRedirect(redirect);
	}

}
