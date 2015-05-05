package com.spring.mvc;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.quiz.QuizResult;
import com.spring.mvc.updates.Updates;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Employee_view;
import com.spring.mvc.user.Manager;
import com.spring.mvc.user.User;
import com.spring.mvc.userdao.ManagerDAO;

@Controller
public class ManagerController {

	
	@Autowired 	
	private ManagerDAO managerDAO;
	
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@RequestMapping(value = "/Manager_Dashboard", method = RequestMethod.GET)
	public String Manager_Dashboard(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome Manager_Dashboard home!", locale);
		HttpSession session = request.getSession();
		session.getAttribute("tasks");
		return "Manager_Dashboard";
	}
	
	
	@RequestMapping(value = "/Manager_Profile", method = RequestMethod.GET)
	public String Manager_Profile(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome Manager_Profile home!", locale);

		try{
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			ArrayList<Updates> updates = null;
			int id = ((Manager)user).getUserId();
			updates = managerDAO.getUpdates(id);
			model.addAttribute("updates", updates);
			int count = updates.size();
			model.addAttribute("count", count);
			model.addAttribute("project", ((Employee)user).getManager().getProjectName());
			logger.info("updates available" + updates);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Manager_Profile";
	}
	
	@RequestMapping(value = "/Manager_createQuiz", method = RequestMethod.GET)
	public String Manager_General(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome Manager_createQuiz home!", locale);
		ArrayList<QuizMaster> qm = null;
		try{
			HttpSession session = request.getSession();
			User user = (Manager)session.getAttribute("user");
			
			qm = managerDAO.fetchQuiz(user);
			logger.info("quizMaster fetched : " + qm.size());
			
			model.addAttribute("quizes",qm);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Manager_createQuiz";
	}
	
	@RequestMapping(value = "/Manager_EmployeePerformance", method = RequestMethod.GET)
	public String Manager_EmployeePerformance(Locale locale, Model model, HttpServletRequest request) {
		try{
			
			logger.info("Welcome Manager_EmployeePerformance home!", locale);
			
			HttpSession session = request.getSession();
			User user = (Manager)session.getAttribute("user");
			ArrayList<QuizMaster> qm = managerDAO.fetchQuiz((Manager)user);
			
			logger.info("quiz list genereated : size : " + qm.size());
			ArrayList<Long> empCount = new ArrayList<Long>();
			
			if(null != qm){
				for(QuizMaster q: qm){
					long count = managerDAO.fetchCount(user.getUserId(), q.getQM_ID());
					empCount.add((Long)count);
				}
			}
			
			logger.info("empCount size:  " + empCount.size());
			
			long countEmployees = managerDAO.countEmployees(user.getUserId());
			
			logger.info("count of total Employees : " + countEmployees);
			
			qm = managerDAO.fetchQuiz(user);
			
			logger.info("quizMaster fetched : " + qm.size());
			
			model.addAttribute("quizes",qm);			
			model.addAttribute("countEmployees", countEmployees);
			model.addAttribute("empCount", empCount);
			model.addAttribute("quizMaster", qm);
			
			return "Manager_EmployeePerformance";
			
			
		}catch(Exception e){
			e.printStackTrace();
			return "errorCreateQuestion";
		}
		
	}
	
	@RequestMapping(value = "/listEmployees", method = RequestMethod.GET)
	public String listEmployees(Locale locale, Model model) {
		logger.info(" listEmployees reached!", locale);
		
		ArrayList<Employee> employee = managerDAO.fetchEmployee();
		
		logger.info("employees loaded : " + employee);
		
		model.addAttribute("employees", employee);
		
		return "listEmployees";
	}
	
	
	@RequestMapping(value = "/AddMember", method = RequestMethod.POST)
	public String AddMember(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome AddMember!", locale);
		String id= request.getParameter("employee");
		logger.info("id : " + id );
		HttpSession session = request.getSession();
		User user  = (Manager)session.getAttribute("user");
		
		user = (Manager)managerDAO.addEmployee(Integer.parseInt(id), user.getUserId());
		logger.info("user set in session again after adding team member ");
		session.setAttribute("user", user);
		
		return "Manager_Dashboard";
	}
	
	@RequestMapping(value = "/createTest", method = RequestMethod.POST)
	public String createTest(Locale locale, Model model, HttpServletRequest request) throws ParseException {
		
		try{
			
			logger.info("createTest!", locale);
			String testName = request.getParameter("testName");
			int number = Integer.parseInt(request.getParameter("number"));
			int maxPoints = Integer.parseInt(request.getParameter("maxPoints"));
			String deadline = request.getParameter("deadline");
			
			logger.info("testName : " + testName + "number : "  + number + "deadline : " + deadline + "maxPoints:" + maxPoints);
			
			HttpSession session = request.getSession();
			User user  = (Manager)session.getAttribute("user");
			DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
			Date date = format.parse(deadline);
			
			managerDAO.createTest(testName,number,maxPoints,date,user);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "Manager_createQuiz";
	}
	
	@RequestMapping(value = "/updateQuiz", method = RequestMethod.GET)
	public String updateQuiz(Model model, Locale locale, @RequestParam("QM_ID") String id){
		int ID = Integer.parseInt(id);
		QuizMaster qm = null;
		try{
			
			qm = managerDAO.fetchQuizwithID(ID);
			logger.info("qmID :" + qm.getQM_ID());
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "updateQuiz";
	}
	
	@RequestMapping(value = "/updateQuiz", method = RequestMethod.POST)
	public String updateQuiz(Model model, Locale locale,HttpServletRequest request){
		try{
			
			logger.info("back to create quiz after update");
			int id = Integer.parseInt(request.getParameter("QM_ID"));
			String testName = request.getParameter("testName");
			int number = Integer.parseInt(request.getParameter("number"));
			int maxPoints = Integer.parseInt(request.getParameter("maxPoints"));
			String deadline = request.getParameter("deadline");
			
			DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
			Date date = format.parse(deadline);
			logger.info("QM_id : " + id + "testName : " + testName + "number : "  + number + "deadline : " + deadline + "maxPoints:" + maxPoints);
			managerDAO.updateQuizMaster(id,testName,number,maxPoints,date);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	return "Manager_createQuiz";
	}
	
	@RequestMapping(value = "/createQuestion", method = RequestMethod.GET)
	public String createQuestion(Model model, Locale locale, @RequestParam("QM_ID") String id){
		int ID = Integer.parseInt(id);
		QuizMaster qm = null;
		logger.info("inside createQuestion!");
		
		try{
			
			qm = managerDAO.fetchQuizwithID(ID);
			logger.info("qmID :" + qm.getQM_ID());
			model.addAttribute("selectedquiz", qm);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "createQuestion";
	}
	
	@RequestMapping(value = "/createQuestion", method = RequestMethod.POST)
	public String create(Model model, Locale locale, HttpServletRequest request){
		String questionstring = request.getParameter("questionstring");
		String options = request.getParameter("options");
		String answer = request.getParameter("answer");
		String level = request.getParameter("level");
		String value = null;
		int ID = Integer.parseInt(request.getParameter("QM_ID"));
		QuizMaster qm = null;
		
		logger.info("questionstrng : " + questionstring + "options : " + options + "answer : " + answer + "level :" + level + "ID : " + ID);
		try{
			
			qm = managerDAO.fetchQuizwithID(ID);
			logger.info("qmID :" + qm.getQM_ID());
			
			
			value = managerDAO.createQuestion(qm,questionstring,options,answer,level);
			if(value.equals("success"))
				value= "Manager_createQuiz";
				else
					value= "errorCreateQuestion";
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return value;
	}
	
	@RequestMapping(value = "/deleteQuiz", method = RequestMethod.GET)
	@ResponseBody
	public String deleteQuiz(Model model, Locale locale, @RequestParam("QM_ID") String id, HttpServletRequest request){
		
		try{
			logger.info("deleteing QuizMaster records");
			int ID = Integer.parseInt(id);
			logger.info("qmID :" + ID);
			HttpSession session = request.getSession();
			User user = (Manager)session.getAttribute("user");
			
			managerDAO.deleteQuiz(ID,user);
			logger.info("quiz with ID : " + id + "deleted");
			return "The quiz has been deleted";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Error deleting. Please try again after some time.";
	}
	
	
	@RequestMapping(value = "/showQuizquestions", method = RequestMethod.GET)
	public String showQuizquestions(Model model, Locale locale, @RequestParam("QM_ID") String id, HttpServletRequest request){
		
		try{
			logger.info("showing Quiz questions");
			int ID = Integer.parseInt(id);
			logger.info("qmID :" + ID);
			HttpSession session = request.getSession();
			User user = (Manager)session.getAttribute("user");
			
			ArrayList quizTemplate = managerDAO.getQuizQuestions(ID);
			logger.info("quizTemplate is fetched : siz is : " + quizTemplate.size());

			model.addAttribute("quizTemplate", quizTemplate);
			return "showQuizquestions";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "errorCreateQuestion";
	}
	
	@RequestMapping(value = "/showLeader", method = RequestMethod.GET)
	public String showLeader(Model model, Locale locale, @RequestParam("QM_ID") String id, HttpServletRequest request){
		
		try{
			logger.info("showing Quiz questions");
			
			int ID = Integer.parseInt(id);
			
			logger.info("qmID :" + ID);
			
			HttpSession session = request.getSession();
			User user = (Manager)session.getAttribute("user");
			
			ArrayList<Employee> employees = managerDAO.fetchEmployeesWhoTookQuiz(ID,((Manager)user).getUserId());
			
			logger.info("Employee who took quiz list size: " + employees.size());
			for(Employee emp:employees){
				logger.info(emp.getFirstname() + emp.getLastname());
				for(QuizResult qr : emp.getQuizResult()){
					logger.info("result id : " + qr.getQR_ID() + "points: " + qr.getPoints());
				}
			}
				
			ArrayList<Employee_view> leaderboardList = new ArrayList<Employee_view>();
			
								
			for(Employee emp : employees){
				Employee_view newEmployee_view = new Employee_view();
				
				//Employee newEmployee = new Employee();
				ArrayList<QuizResult> learderQuiz = new ArrayList<QuizResult>();
				QuizResult newResult = new QuizResult();
				int resultCount =0;
				
				for(QuizResult qr : emp.getQuizResult()){
					float points =0;
					float newPoints = 0;
					
						if(resultCount==0){
							points = qr.getPoints();
						}
							
						else{
							points = newResult.getPoints();	
							newPoints = qr.getPoints();
						}
						
						newResult.setFlag(qr.isFlag());
						newResult.setSubmissionDate(qr.getSubmissionDate());
						//newResult.setEmployee(newEmployee_view);
						newResult.setSubmissionDate(qr.getSubmissionDate());
		
						if(newResult.isFlag()){
							newPoints = 0;
						}
						resultCount++;
						newResult.setPoints((points + (0.90)*newPoints)/resultCount);	
						
				}

				learderQuiz.add(newResult);
				newEmployee_view.setQuizResult(learderQuiz);
				newEmployee_view.setAttempts(resultCount);
				newEmployee_view.setFirstname(emp.getFirstname());
				newEmployee_view.setLastname(emp.getLastname());
				newEmployee_view.setUserId(emp.getUserId());
				newEmployee_view.setQuizResult(learderQuiz);
				SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy, hh:mm aaa");
				String sdate = sdf.format(newResult.getSubmissionDate());
				newEmployee_view.setSubmissiondate(sdate);
				leaderboardList.add(newEmployee_view);	
					
			}
			
			float pEmpPoints =0;
			for(Employee_view ev : leaderboardList){
				for(QuizResult qr : ev.getQuizResult()){
					if(qr.getPoints()>pEmpPoints)
					pEmpPoints = qr.getPoints();					
				}
			}

			model.addAttribute("employees", leaderboardList);
			
			return "showLeader";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "errorCreateQuestion";
	}
}
