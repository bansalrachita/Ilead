package com.spring.mvc;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Session;

import com.spring.mvc.dao.HibernateUtil;
import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.quiz.QuizResult;
import com.spring.mvc.quiz.QuizTemplate;
import com.spring.mvc.thread.Post;
import com.spring.mvc.thread.Threads;
import com.spring.mvc.updates.TodoList;
import com.spring.mvc.updates.Updates;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;
import com.spring.mvc.user.User;
import com.spring.mvc.user.User.Role;

public class TestHibernate {
	
	/*public static void main2(String[] args) {
		String test ="options1##optons2##options3";
		
		for(String s : test.split("##")){
			System.out.println(s);
		}
		
	}
*/
	public static void main(String args[]){
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		
		User user1 = new User();
		user1.setAge(30);
		user1.setContact("9999999990");
		user1.setGender("Female");
		user1.setPassword("pass");
		user1.setUsername("Rachita");
		user1.setFirstname("Rachita");
		user1.setLastname("Bansal");
		user1.setRole(Role.Admin);

		
		Manager manager1 = new Manager();
		manager1.setAge(70);
		manager1.setContact("0000000009");
		manager1.setDepartment("Finance");
		manager1.setGender("MALE");
		manager1.setPassword("pass3");
		manager1.setSalary(200000);
		manager1.setUsername("Ankit");
		manager1.setRole(Role.Manager);
		manager1.setFirstname("Ankit");
		manager1.setLastname("Dhanda");
		manager1.setEmail("ankit@ilead.com");
		manager1.setAbout("Ankit is harworking, employee engaging and a lively person");
		manager1.setProjectName("TBusiness Edge Risk Management Project");
		manager1.setStartDate(new Date());
		manager1.setEndDate(new Date(2020, 12, 20));
		
		Employee emp1 = new Employee();
		emp1.setAge(20);
		emp1.setContact("1234567890");
		emp1.setGender("MALE");
		emp1.setSalary(1000);
		emp1.setPassword("pass1");
		emp1.setUsername("Dixit");
		emp1.setManager(manager1);
		emp1.setRole(Role.Employee);
		emp1.setFirstname("Dixit");
		emp1.setLastname("Patel");
		emp1.setEmail("dixit@ilead.com");
		emp1.setAbout("dixit is proficient in java and loves to run");
		//emp1.setQuizResult(quizResult);
		
		Employee emp2 = new Employee();
		emp2.setAge(20);
		emp2.setContact("1234567890");
		emp2.setGender("MALE");
		emp2.setSalary(10000);
		emp2.setPassword("pass2");
		emp2.setUsername("Anna");
		emp2.setManager(manager1);
		emp2.setRole(Role.Employee);
		emp2.setFirstname("Anna");
		emp2.setLastname("Shaun"); 
		emp2.setEmail("anna@ilead.com");
		emp2.setAbout("anna is a hardworing and lively lady!");
		//emp2.setQuizResult(quizResult);
		
		ArrayList<Employee> employee = new ArrayList<Employee>();
		employee.add(emp1);
		employee.add(emp2);
		
		manager1.setEmployee(employee);
		
		Updates update1 = new Updates();
		update1.setDate(new Date());
		update1.setManager(manager1);
		update1.setMessage("Hello all!");
		update1.setCategory("Well Done!");
		
		Updates update2 = new Updates();
		update2.setDate(new Date());
		update2.setManager(manager1);
		update2.setMessage("Welcome to this project!");
		update2.setCategory("Well Done!");
		
		Updates update3 = new Updates();
		update3.setDate(new Date());
		update3.setManager(manager1);
		update3.setMessage("Everyone is invited to introduce themselves to the team at my desk");
		update3.setCategory("Heads up!");
		
		
		
		Threads thread1 = new Threads();
		thread1.setDate(new Date());
		
		thread1.setRole("Manager");
		thread1.setTags("#doit");
		thread1.setThreadString("Welcome!");
		thread1.setUser(manager1);
		
		
		ArrayList<Post> posts = new ArrayList<Post>();
		Post post1 = new Post();
		post1.setComments("Hello!");
		post1.setDate(new Date());
		post1.setThread(thread1);
		post1.setUser(emp2);
		
		
		posts.add(post1);
		
		thread1.setPost(posts);
		
		QuizMaster qm1 = new QuizMaster();
		qm1.setManager(manager1);
		qm1.setNumberofQuestions(3);
		qm1.setQuizName("Compliance Traning Quiz");
		qm1.setCreationDate(new Date());
		qm1.setDeadline(new Date(2015,04,20));
		qm1.setMaxPoints(3);
		
		ArrayList<QuizTemplate> quizTemplate = new ArrayList<QuizTemplate>();
		
		QuizTemplate qt1 = new QuizTemplate();
		
		qt1.setDifficultyLevel("HIGH");
		qt1.setAnswer("A");
		qt1.setQuestionString("what is your name?");
		qt1.setQuizMaster(qm1);
		qt1.setOptions("Rachita,Saahil,Amit,Sohit");
		
		QuizTemplate qt2 = new QuizTemplate();
		qt2.setDifficultyLevel("LOW");
		qt2.setAnswer("B");
		qt2.setQuestionString("where do you stay?");
		qt2.setQuizMaster(qm1);
		qt2.setOptions("Hyd,Delhi,USA,Boston");
		
		QuizTemplate qt3 = new QuizTemplate();
		qt3.setDifficultyLevel("HIGH");
		qt3.setAnswer("A");
		qt3.setQuestionString("what do you eat?");
		qt3.setQuizMaster(qm1);
		qt3.setOptions("ham, chicken, spinach, cabbage");
		
		quizTemplate.add(qt1);
		quizTemplate.add(qt2);
		quizTemplate.add(qt3);
		
		qm1.setQuizTemplate(quizTemplate);
		
//		ArrayList<Options> options1 = new ArrayList<Options>();
		
		/*Options op1 = new Options();
		Options op2 = new Options();
		Options op3 = new Options();
		
		op1.setOption("Rachita");
		op2.setOption("Sahil");
		op3.setOption("Sagar");
		*/
	/*	options1.add(op1);
		options1.add(op2);
		options1.add(op3);
		
		qt1.setOptions(options1);
		*/
		/*ArrayList<Options> options2 = new ArrayList<Options>();
		
		Options op4 = new Options();
		op4.setOption("Delhi");
		
		Options op5 = new Options();
		op5.setOption("Blore");
		
		Options op6 = new Options();
		op6.setOption("Hyd");
		
		options2.add(op6);
		options2.add(op5);
		options2.add(op4);
		
		qt2.setOptions(options2);
		
		ArrayList<Options> options3 = new ArrayList<Options>();
		
		Options op7 = new Options();
		op7.setOption("chicken");
		
		options3.add(op7);
		
		qt3.setOptions(options3);
		*/
		
		ArrayList<TodoList> todo = new ArrayList<TodoList>();
		
		TodoList t = new TodoList();
		t.setCreationDate(new Date());
		t.setUser(emp1);
		t.setTodomessage("Prepare Risk Analysis Report for ABC company");
		t.setFlag(false);
		
		
		TodoList t1 = new TodoList();
		t1.setCreationDate(new Date());
		t1.setUser(emp1);
		t1.setTodomessage("leave office at 6:30 today");
		t1.setFlag(false);
		
		todo.add(t);
		todo.add(t1);
		
		ArrayList<QuizResult> quizResult = new ArrayList<QuizResult>();
		
		QuizResult qr1 = new QuizResult();
		
		
		qr1.setEmployee(emp1);
		qr1.setManager(manager1);
		qr1.setPoints(10);
		qr1.setQuizMaster(qm1);
		qr1.setFlag(false);
		qr1.setSubmissionDate(new Date());
		
		//qm1.setQuizResult(quizResult);
		
		session.save(qm1);
//		session.save(qt1);
//		session.save(qt2);
//		session.save(qt3);
		session.save(qr1);
		
		
//		session.save(post1);
		session.save(update1);
		session.save(update2);
		session.save(update3);
		session.save(thread1);
		session.save(t);
		session.save(t1);
		
		session.save(emp1);
		session.save(emp2);
		session.save(user1);
		session.save(manager1);
		
		session.getTransaction().commit();
		session.close();
		
		/*Session session1 = HibernateUtil.getSessionFactory().openSession();
		session1.beginTransaction();
		String user = "Dixit";
		Query query = session1.createQuery("from Employee as employee where username = :user");
		query.setString("user", user);
		@SuppressWarnings("unchecked")
		ArrayList<Employee> e = (ArrayList<Employee>) query.list();
		session1.getTransaction().commit();
		session1.close();
		
		for(Employee emp : e)
		System.out.print(emp.getUsername());*/
		
		/*Session session1 = HibernateUtil.getSessionFactory().openSession();
		session1.beginTransaction();
		String user = "Ankit";
		Criteria c = session1.createCriteria(Manager.class);
		c.add(Restrictions.eq("username", user));
		Manager m = (Manager) c.uniqueResult();
		int id = m.getUserId();
		Criteria c1 = session1.createCriteria(Employee.class);
		c.add(Restrictions.eq("userId", id));

		ArrayList<Employee> e = (ArrayList<Employee>) c1.list();
		session1.getTransaction().commit();
		//session1.close();
	//	ArrayList<Employee> emp =null;
		for(Employee emp : e){
		System.out.println(emp.getUsername());
		}*/
}
}