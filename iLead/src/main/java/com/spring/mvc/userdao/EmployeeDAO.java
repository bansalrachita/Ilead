package com.spring.mvc.userdao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.criterion.Restrictions;
import com.spring.mvc.dao.DAO;
import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.quiz.QuizResult;
import com.spring.mvc.quiz.QuizTemplate;
import com.spring.mvc.updates.Updates;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;



public class EmployeeDAO extends DAO{

	public Employee updateAboutMe(Employee user, String about) throws Exception{
		try{
			
			openSession();
			beginTransaction();
			Employee user_retrieved = fetchEmployee(user.getUsername()); 
			user_retrieved.setAbout(about);
			save(user_retrieved);
			commit();
			close();
			return user_retrieved;
			
		}catch(Exception e){
			rollback();
			throw new Exception("cannot update the user.  " + e );
		}
		
	}
	
	public Employee fetchEmployee(String username) throws Exception{
		Employee emp = null;
		try{
			
			emp = ((Employee) getSession().createCriteria(Employee.class).add(Restrictions.eq("username", username)).uniqueResult());
		}catch(Exception e){
			rollback();
			throw new Exception("cannot update the user.  " + e );
		}finally{
			
		}
		return emp;
		
		
	}

	public Employee updateContact(Employee user, String phone, String email) throws Exception {
		openSession();
		beginTransaction();
		Employee user_retrieved = fetchEmployee(user.getUsername()); 
		user_retrieved.setContact(phone);
		user_retrieved.setEmail(email);
		save(user_retrieved);
		commit();
		close();
		return user_retrieved;
	}

	public Employee updateProfile(Employee user, String lastname, String age) throws Exception {
		try{
			
			openSession();
			beginTransaction();
			Employee user_retrieved = fetchEmployee(user.getUsername()); 
			user_retrieved.setAge(Integer.parseInt(age));
			user_retrieved.setLastname(lastname);
			save(user_retrieved);
			commit();
			close();
			return user_retrieved;
			
		}catch(Exception e){
			rollback();
			throw new Exception("cannot update the profile. ");
		}
	}

	@SuppressWarnings("unchecked")
	public List<QuizMaster> getAvailableQuiz(int id) {
		try{
			
			
			List<QuizMaster> quizMasters = null;
			openSession();
			quizMasters = getSession().createQuery("from QuizMaster where manager = :id ").setInteger("id", id).list();
			
			/*for(QuizMaster qm : quizMasters){
				System.out.println("qm : " + qm.toString());
			}*/
			
			close();
			return quizMasters;
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<QuizTemplate> createQuiz(int id) {
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
	
	public void insertResult(float points, Manager manager, Employee employee, QuizTemplate quizTemplate){
		try{
			
			Boolean flag = false;
			
			openSession();
			beginTransaction();
			
			QuizResult result = new QuizResult();
			
			result.setEmployee(employee);
			result.setManager(manager);
			result.setPoints(points);
			result.setQuizMaster(quizTemplate.getQuizMaster());
			result.setSubmissionDate(new Date());
			if(quizTemplate.getQuizMaster().getDeadline().before(result.getSubmissionDate())){
				flag=true;
			}
			
			result.setFlag(flag);
			save(result);
			commit();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
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
	
	@SuppressWarnings("unchecked")
	public ArrayList<QuizResult> fetchResults(int id){
		ArrayList<QuizResult> result = null;
		try{
			
			openSession();
			result = (ArrayList<QuizResult>) getSession().createQuery("from QuizResult where employee = :id").setInteger("id",id).list();
			close();
			
			
			/*for(QuizResult q : result){
			System.out.println("id : " + q.getQR_ID() + "point: " + q.getPoints() + " date: " + q.getSubmissionDate());
			System.out.println("quizMaster : " + q.getQuizMaster().getQM_ID());
			System.out.println("manager : " + q.getManager().getUserId());
		}*/
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		
		return result;
	}

	/*public static void main(String[] args) {
		EmployeeDAO d = new EmployeeDAO();
		//d.getAvailableQuiz(1);
		d.fetchResults(3);
		
	}*/

	
}
