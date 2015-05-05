package com.spring.mvc.userdao;

import java.util.ArrayList;








import java.util.Date;

import javax.management.openmbean.OpenDataException;
import javax.persistence.criteria.Join;

import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.Select;

import com.spring.mvc.dao.DAO;
import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.quiz.QuizResult;
import com.spring.mvc.quiz.QuizTemplate;
import com.spring.mvc.updates.Updates;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;
import com.spring.mvc.user.User;

public class ManagerDAO extends DAO{

	@SuppressWarnings("unchecked")
	public ArrayList<Employee> fetchEmployee(){
		ArrayList<Employee> employee= null;
		
		try{
			openSession();
			employee = (ArrayList<Employee>) getSession().createCriteria(Employee.class).add(Restrictions.isNull("manager.userId")).list();
			close();
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		
		return employee;
	}

	public Manager addEmployee(int id, int managerId) {
		Manager manager = null;
		try{
			
			openSession();
			beginTransaction();
			Employee employee = (Employee) getSession().createCriteria(Employee.class).add(Restrictions.eq("userId", id)).uniqueResult();
			manager = (Manager) getSession().createCriteria(Manager.class).add(Restrictions.eq("userId", managerId)).uniqueResult();
			
			if(employee.getManager()==null)
				employee.setManager(manager);
			getSession().save(employee);
			getSession().save(manager);
			
			commit();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return manager;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Updates> getUpdates(int id) {
			
			ArrayList<Updates> updates =null;
			try{
				
				openSession();
				
				updates =  (ArrayList<Updates>) getSession().createQuery("from Updates where manager = :id").setInteger("id", id).list();
				
				close();
				
			}catch(Exception e){
				rollback();
				e.printStackTrace();
				
			}
		return updates;
	}

	public void createTest(String testName, int number,int maxPoints, Date deadline, User user) {
		try{
			
			openSession();
			beginTransaction();
			QuizMaster qm = new QuizMaster();
			qm.setCreationDate(new Date());
			qm.setDeadline(deadline);
			qm.setMaxPoints(maxPoints);
			qm.setNumberofQuestions(number);
			qm.setQuizName(testName);
			qm.setManager((Manager)user);
			ArrayList<QuizTemplate> qt = new ArrayList<QuizTemplate>();
			qm.setQuizTemplate(qt);
			getSession().save(qm);
			commit();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public ArrayList<QuizMaster> fetchQuiz(User user) {
		ArrayList<QuizMaster> qm=null;
		try{
			
			openSession();
			System.out.println(user.getUserId());
			qm = (ArrayList<QuizMaster>) getSession().createQuery("from QuizMaster where manager = :id").setInteger("id",user.getUserId()).list();
			System.out.println(qm.size());
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return qm;
	}
	
	public QuizMaster fetchQuizwithID(int id) {
		QuizMaster qm=null;
		try{
			
			openSession();
			qm = (QuizMaster) getSession().createQuery("from QuizMaster where QM_ID = :id").setInteger("id",id).uniqueResult();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return qm;
	}

	public int updateQuizMaster(int id, String testName, int number,
			int maxPoints, Date date) {
		int count =0;
		try{
			
			openSession();
			beginTransaction();
			count =	getSession().createQuery("Update QuizMaster set quizName = :quizName, numberofQuestions= :numberofQuestions, maxPoints= :maxPoints,  deadline = :deadline where QM_ID = :id")
					.setInteger("maxPoints", maxPoints)
					.setInteger("numberofQuestions", number)
					.setDate("deadline", date)
					.setString("quizName", testName)
					.setInteger("id", id).executeUpdate();
			commit();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return count;
	}

	public String createQuestion(QuizMaster qm, String questionstring,
			String options, String answer, String level){
		try{
			openSession();
			beginTransaction();

			long count = (Long) getSession().createQuery("select count(qt) from QuizTemplate qt where quizMaster = :id").setInteger("id", qm.getQM_ID()).uniqueResult();
			System.out.println("count: " + count + "noofquestions :" + qm.getNumberofQuestions());
			if(count < qm.getNumberofQuestions()){
			QuizTemplate qt = new QuizTemplate();
			qt.setQuizMaster(qm);
			qt.setAnswer(answer);
			qt.setDifficultyLevel(level);
			qt.setOptions(options);
			qt.setQuestionString(questionstring);
			qm.getQuizTemplate().add(qt);
			
			getSession().save(qt);
			//getSession().save(qm);
			commit();
			close();
			return"success";
			
		}}catch(Exception e){
			rollback();
			e.printStackTrace();
			return "error";
		}
		return "error";
	}

	public void deleteQuiz(int id,User user) {
		QuizMaster qm =null;
		try{
			
			openSession();
			qm = (QuizMaster) getSession().createQuery("from QuizMaster where QM_ID = :id and manager = :manager").setInteger("id",id).setInteger("manager",user.getUserId()).uniqueResult();
			close();
			System.out.println("qm" + qm + "id " + id);
			openSession();
			beginTransaction();
			getSession().delete(qm);
			commit();
			close();
			
		}catch(Exception e){
			
			rollback();
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public ArrayList<QuizTemplate> getQuizQuestions(int id) {
		ArrayList<QuizTemplate> quizTemplate = null;
		try{
			
			openSession();
			quizTemplate = (ArrayList<QuizTemplate>) getSession().createQuery("from QuizTemplate where quizMaster = :id ").setInteger("id", id).list();
			close();		
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return quizTemplate;
	}

	
	public long fetchCount(int managerId, int qmId){
		long count =0;
		try{
			
			
				System.out.println("inside");
				openSession();
				beginTransaction();
				count =  (Long) getSession().createQuery("select count( distinct employee) from QuizResult where quizMaster = :id and manager = :managerId").setInteger("id", qmId).setInteger("managerId", managerId).uniqueResult();
				commit();
				close();
			
		}catch(Exception e){
			
		}
		return count;
	
	}
	

	public long countEmployees(int managerId){
		long count =0;
		try{
			
				openSession();
				beginTransaction();
				count =  (Long) getSession().createQuery("select count(emp) from Employee emp where manager = :managerId").setInteger("managerId", managerId).uniqueResult();
				commit();
				close();
			
		}catch(Exception e){
			
		}
		return count;
	
	}
	
	public ArrayList<Employee> fetchEmployeesWhoTookQuiz(int id, int managerId){
		ArrayList<Employee> emp = null;
		try{
			openSession();
			beginTransaction();
			emp = (ArrayList<Employee>) getSession().createQuery("select distinct employee from Employee employee inner join employee.quizResult qr where qr.quizMaster = :id and employee.manager = :managerId").setInteger("id", id).setInteger("managerId", managerId).list(); 
			commit();
			close();
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		
		return emp;
	}
	
	/*public static void main(String[] args) {
		ManagerDAO md = new ManagerDAO();
		ArrayList<Employee> e = md.fetchEmployeesWhoTookQuiz(1,1);
		for(Employee emp:e){
			System.out.println(emp.getFirstname() + emp.getLastname());
			for(QuizResult qr : emp.getQuizResult()){
				System.out.println("result id : " + qr.getQR_ID() + "points: " + qr.getPoints());
			}
		}
		
	}*/
}
