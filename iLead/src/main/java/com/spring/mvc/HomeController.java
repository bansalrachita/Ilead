package com.spring.mvc;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mvc.mailsender.Mail;
import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.thread.Post;
import com.spring.mvc.thread.Threads;
import com.spring.mvc.updates.TodoList;
import com.spring.mvc.updates.Updates;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;
import com.spring.mvc.user.User;
import com.spring.mvc.user.User.Role;
import com.spring.mvc.userdao.EmployeeDAO;
import com.spring.mvc.userdao.UserDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("userValidator")
	private Validator validator;
	
	@Autowired
	private UserDAO userDAO;
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(validator);
	}

	@Autowired
	private Mail mail;
	
	@Autowired
	private User user;

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home!", locale);
		model.addAttribute("user", user);
		logger.info("user instantiated: " + user, locale);
		return "home";
	}
	
	
	@RequestMapping(value = "/", method=RequestMethod.POST)
	public String userhomePage(Model model, @Validated User user, BindingResult result, HttpServletRequest request){
		String returnVal =null;
		try{
			if(result.hasErrors()){
				return "home";
			}else{
				
					
					
				
					if(user.getRole().equals(Role.Employee)){
						user = userDAO.EmployeeloginIntialsVerification(user.getUsername(), user.getPassword());
						
						if(!validateUser(request)){
							
							HttpSession session = request.getSession();
							session.setAttribute("username", user.getUsername());
							session.setAttribute("user", ((Employee)user));
							String managerFName = ((Employee)user).getManager().getFirstname();
							String managerLName = ((Employee)user).getManager().getLastname();
							session.setAttribute("managerFName", managerFName);
							session.setAttribute("managerLName", managerLName);	
							ArrayList<TodoList> tasks = userDAO.fetchTasks(user.getUserId());
							
							for(TodoList t : tasks)
							logger.info("tasks intialized" + t.getId() + ":" + t.getTodomessage() + ":" + t.getCreationDate());
							
							session.setAttribute("tasks", tasks);
							session.setMaxInactiveInterval(60*60);
							
							
						}
					returnVal = "Employee_Index";
					
					}else if(user.getRole().equals(Role.Manager)){
						user = userDAO.ManagerloginIntialsVerification(user.getUsername(), user.getPassword());
						
//						if(!validateUser(request)){
							
							HttpSession session = request.getSession();
							session.setAttribute("username", user.getUsername());
							session.setAttribute("user", ((Manager)user));	
							
							logger.info("user has list of employees:" + ((Manager)user).getEmployee().size());
							
							/*ArrayList<TodoList> tasks = userDAO.fetchTasks(user.getUserId());
							logger.info("tasks intialized" + tasks);
							session.setAttribute("tasks", tasks);*/
							
							ArrayList<Threads> threads = userDAO.fetchThreads();
							logger.info("we have threads: " + threads.size());
							
							session.setAttribute("threads", threads);
							
							ArrayList<TodoList> managertasks = userDAO.fetchTasks(user.getUserId());
							
							for(TodoList t : managertasks)
							logger.info("managertasks intialized" + t.getId() + ":" + t.getTodomessage() + ":" + t.getCreationDate());
							
							session.setAttribute("managertasks", managertasks);
																																																																																																																																											
							session.setMaxInactiveInterval(60*60);
						}
						
						returnVal = "Manager_Dashboard";
//					}
					
					
					return returnVal;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "home";
	}
	
	
	@RequestMapping(value = "/CreateNewLogin")
	public String createNewLoginId(Model model){
		return "CreateNewLogin";
	}
	

	@RequestMapping(value = "/home", method=RequestMethod.POST)
	public String login(Model model,Locale locale, HttpServletRequest request){
		
		
		String username = request.getParameter("yourusername");
		String firstname= request.getParameter("firstname"); 
		String lastname = request.getParameter("lastname");
		String password = request.getParameter("password");
		String agestring = request.getParameter("age");
		String contact = request.getParameter("contact");
		String role = request.getParameter("role");
		String gender = request.getParameter("sex");
		String email = request.getParameter("email");
		
		
		try{
			
			int age = Integer.parseInt(agestring);
			userDAO.userSignUp(firstname, lastname, username, password, contact, age, gender, role, email);
			logger.info("Welcome back home!", locale);
			return "redirect:/";
			
		}catch(Exception e){
			
			e.printStackTrace();
			return "ErrorLogin";
		}
	}
	
	
	@RequestMapping(value = "/RecoverEmail", method=RequestMethod.POST)
	public String emailRecovery(Model model, HttpServletRequest request){
		try{
			
			// reads form input
	        final String emailTo = request.getParameter("recovery-email");
	        final String subject = "Password Recovery";
	        final String content = "Click Here for Password Recovery";
	        
	        // for logging
	        logger.info("emailTo: " + emailTo);
	        logger.info("subject: " + subject);
	        logger.info("content: " + content);
	        
	    	mail.sendMail(subject, content, emailTo);	    	
	        logger.info("mail sent! to : " + emailTo);	        
	        return "RecoverEmail";
	        
		}catch(Exception e){
			
			e.printStackTrace();
			return "ErrorLogin";
		}
		
	}
	
	@RequestMapping(value="/deletetask", method=RequestMethod.POST)
	public String deletetask(Model model, @RequestParam("id") int id, HttpServletRequest request){
		
		logger.info("todoid to be deleted : " + id);
		
		userDAO.deletetask(id);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		ArrayList<TodoList> tasks = userDAO.fetchTasks(user.getUserId());
		
		for(TodoList t : tasks)
			logger.info("tasks intialized" + t.getId() + ":" + t.getTodomessage() + ":" + t.getCreationDate());
			
		
		session.setAttribute("tasks", tasks);
		return "Employee_Index";
	}
	
	
	@RequestMapping(value="/deletemanagertask", method=RequestMethod.POST)
	public String deletemanagertask(Model model, /*@RequestParam("id") int id,*/ HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("delbutton"));
		
		logger.info("todoid to be deleted : " + id);
		
		userDAO.deletetask(id);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		ArrayList<TodoList> tasks = userDAO.fetchTasks(user.getUserId());
		
		for(TodoList t : tasks)
			logger.info("tasks intialized" + t.getId() + ":" + t.getTodomessage() + ":" + t.getCreationDate());
			
		
		session.removeAttribute("tasks");
		session.setAttribute("tasks", tasks);
		
		return "Manager_Dashboard";
	}
	
	
	@RequestMapping(value="/addTask", method=RequestMethod.GET)
	public String addManagerTask(Model model,@RequestParam("str") String str, HttpServletRequest request){
		
		String taskmessage = str;
		HttpSession session = request.getSession();
		User user = (Manager) session.getAttribute("user");
		
		logger.info("taskmessage : " + taskmessage);
		
		userDAO.addTask(taskmessage, user);

		ArrayList<TodoList> tasks = userDAO.fetchTasks(user.getUserId());
		
		for(TodoList t : tasks)
			logger.info("tasks intialized" + t.getId() + ":" + t.getTodomessage() + ":" + t.getCreationDate());
			
		
		session.setAttribute("tasks", tasks);
		
		return "Manager_Dashboard";
	}
	
	
	
	public boolean validateUser(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("username") !=null)
			return true;
		
		return false;
	}
		
}
