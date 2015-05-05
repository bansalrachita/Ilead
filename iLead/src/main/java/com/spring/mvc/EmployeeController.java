package com.spring.mvc;


import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.asm.commons.EmptyVisitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.quiz.QuizResult;
import com.spring.mvc.quiz.QuizTemplate;
import com.spring.mvc.updates.Updates;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;
import com.spring.mvc.user.User;
import com.spring.mvc.userdao.EmployeeDAO;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeDAO empDAO;
	
	@Autowired
	private QuizMaster quizMaster;
	
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	
	@RequestMapping(value = "/Simple_Tables", method = RequestMethod.GET)
	public String employeeHome(Model model, Locale locale, HttpServletRequest request){
		logger.info("Welcome Simple_Tables!", locale);
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Simple_Tables";
	}
	
	@RequestMapping(value = "/Employee_Dashboard", method = RequestMethod.GET)
	public String Employee_Dashboard(Model model, Locale locale, HttpServletRequest request){
		logger.info("Welcome to Employee_Dashboard!", locale);
		try{
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int id = ((Employee)user).getManager().getUserId();
			ArrayList<QuizMaster> quizList = (ArrayList<QuizMaster>) empDAO.getAvailableQuiz(id);
			session.setAttribute("quizList", quizList);
			for(QuizMaster q: quizList)
			System.out.println(q.toString());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Employee_Dashboard";
	}
	
	@RequestMapping(value = "/Employee_General", method = RequestMethod.GET)
	public String Employee_General(Model model, Locale locale, HttpServletRequest request){
		logger.info("Welcome to Employee_General!", locale);
		try{
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			ArrayList<Updates> updates = null;
			int id = ((Employee)user).getManager().getUserId();
			updates = empDAO.getUpdates(id);
			model.addAttribute("updates", updates);
			int count = updates.size();
			model.addAttribute("count", count);
			model.addAttribute("project", ((Employee)user).getManager().getProjectName());
			logger.info("updates available" + updates);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Employee_General";
	}
	
	@RequestMapping(value = "/Employee_Index", method = RequestMethod.GET)
	public String Employee_Index(Model model, Locale locale, HttpServletRequest request){
		logger.info("Welcome home User!", locale);
		try{
			
			HttpSession session = request.getSession();
			User user = (Employee) session.getAttribute("user");
			
			
			ArrayList<Updates> updates = null;
			int id = ((Employee)user).getManager().getUserId();
			
			logger.info("managerid: " + id);
			
			updates = empDAO.getUpdates(id);
			model.addAttribute("updates", updates);

			logger.info(updates.get(0).toString());
			logger.info("userid : " + user.getUserId());
			
			ArrayList<QuizResult> resultset = empDAO.fetchResults(user.getUserId());
			model.addAttribute("resultset", resultset);	
			
			
			for(QuizResult q : resultset){
				logger.info("quizName" + q.getQuizMaster().getQuizName());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "Employee_Index";
	}
	
	@RequestMapping(value="/updateAboutMe")
	public String TellMeAboutYourself(Model model, HttpServletRequest request){
		
		String about = request.getParameter("about");
		try{
			
			HttpSession session = request.getSession();
			Employee user = (Employee) session.getAttribute("user");
			user = empDAO.updateAboutMe(user, about);
			session.setAttribute("user", user);
			return "redirect:/Employee_General";
			
		}catch(Exception e){
			
			e.printStackTrace();
			return "errorUpdate";
		}
	}
	
	@RequestMapping(value="/UpdateContact")
	public String UpdateContact(Model model, HttpServletRequest request){
		
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		try{
			
			HttpSession session = request.getSession();
			Employee user = (Employee) session.getAttribute("user");
			user = empDAO.updateContact(user, phone,email);
			session.setAttribute("user", user);
			return "redirect:/Employee_General";
			
		}catch(Exception e){
			
			e.printStackTrace();
			return "errorUpdate";
		}
	}
	
	@RequestMapping(value="/UpdateProfile")
	public String UpdateProfile(Model model, HttpServletRequest request){
		
		String lastname = request.getParameter("lastname");
		String age = request.getParameter("age");
		try{
			
			HttpSession session = request.getSession();
			Employee user = (Employee) session.getAttribute("user");
			user = empDAO.updateProfile(user, lastname, age);
			session.setAttribute("user", user);
			return "redirect:/Employee_General";
			
		}catch(Exception e){
			
			e.printStackTrace();
			return "errorUpdate";
		}
	}
	
	@RequestMapping(value="/updatePassword", method=RequestMethod.POST)
	public String updatePassword(){
		return "Employee_General";
	}
	
	@RequestMapping(value="/createQuiz", method=RequestMethod.GET)
	public String createQuiz(Model model, @RequestParam("QM_ID") int id){
		ArrayList<QuizTemplate> quizTemplate = new ArrayList<QuizTemplate>();
		quizTemplate = empDAO.createQuiz(id);		
		model.addAttribute("quizTemplate", quizTemplate);
		return "createQuiz";
	}
	
	@RequestMapping(value="/submitQuiz", method=RequestMethod.POST)
	public String submitQuiz(Model model, HttpServletRequest request, @RequestParam("id") int id){
		ArrayList<QuizTemplate> quizTemplate = new ArrayList<QuizTemplate>();
		quizTemplate = empDAO.createQuiz(id);		
		float count = 0;
		
		HttpSession session = request.getSession();
		Employee user = (Employee) session.getAttribute("user");
		Manager manager = user.getManager();
		
		for(QuizTemplate q : quizTemplate){
			
			String[] marked = request.getParameterValues(String.valueOf(q.getQT_ID()));
			System.out.println("question : " + q.getQT_ID());
			
			for(int i=0;i<marked.length;i++){
				
				System.out.println("marked :" + marked[i] + "answer : " + q.getAnswer());
				
				if(marked[i].equals(q.getAnswer())){
					
					count++;
					System.out.println("count" + count);
					break;
				}
					
			}
		}
		System.out.println("hi i am inserting");
		empDAO.insertResult(count, manager, user, quizTemplate.get(0));
		
		return "Employee_General";
	}
	
	
}
