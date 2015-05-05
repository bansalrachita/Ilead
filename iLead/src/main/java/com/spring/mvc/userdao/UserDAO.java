package com.spring.mvc.userdao;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.spring.mvc.dao.DAO;
import com.spring.mvc.thread.Post;
import com.spring.mvc.thread.Threads;
import com.spring.mvc.updates.TodoList;
import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;
import com.spring.mvc.user.User;
import com.spring.mvc.user.User.Role;

public class UserDAO extends DAO{

	public Employee EmployeeloginIntialsVerification(String username, String password){
		try{
			openSession();
			Query query = getSession().createQuery("from Employee where username = :username and password = :password");
			query.setString("username", username);
			query.setString("password", password);
			Employee user = (Employee) query.uniqueResult();
			close();
			return user;
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return null;
	}
	
	public Manager ManagerloginIntialsVerification(String username, String password){
		try{
			openSession();
			Query query = getSession().createQuery("from Manager where username = :username and password = :password");
			query.setString("username", username);
			query.setString("password", password);
			Manager user = (Manager) query.uniqueResult();
			close();
			return user;
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return null;
	}
	
	public void userSignUp(String firstname, String lastname, String username,
			String password, String contact, int age, String gender, String role, String email) throws Exception {
		User user = null;
		try {
			openSession();
			beginTransaction();
			if (role.equals(Role.Employee.toString())) {
				user = new Employee();
				user.setRole(Role.Employee);
				user.setUsername(username);

			} else if (role.equals(Role.Manager.toString())) {
				user = new Manager();
				user.setRole(Role.Manager);
				user.setUsername(username);

			}
			user.setAge(age);
			user.setContact(contact);
			user.setFirstname(firstname);
			user.setGender(gender);
			user.setLastname(lastname);
			user.setPassword(password);
			user.setEmail(email);
			save(user);
			commit();
			close();

		} catch (Exception e) {
		
			rollback();
			throw new Exception("could not signup user" + e);
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<TodoList> fetchTasks(int id){
		ArrayList<TodoList> task = null;
		
		try{
			
			openSession();
			task = (ArrayList<TodoList>) getSession().createQuery("from TodoList where user = :id").setInteger("id",id).list();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		return task;
	}
	

	public void deletetask(int id) {
//		int result = 0;
		try{
			openSession();
			beginTransaction();
			TodoList task = (TodoList) getSession().createCriteria(TodoList.class).add(Restrictions.eq("id", id)).uniqueResult();
			System.out.println("deleting task : " + task);
			getSession().delete(task);
			commit();
			close();
//			return result;
		}catch(Exception e){
			rollback();
			e.printStackTrace();
			
		}
//		return result;
	}
	
	public ArrayList<Threads> fetchThreads(){
		ArrayList<Threads> threads = null;
		try{
			
			openSession();
			
			threads= (ArrayList<Threads>) getSession().createCriteria(Threads.class).setMaxResults(10).list();
			close();
		}catch(Exception e ){
			rollback();
			e.printStackTrace();
		}
		return threads;
	}

	public void addTask(String taskmessage,User user) {
		try{
			
			openSession();
			beginTransaction();
			TodoList task = new TodoList();
			task.setCreationDate(new Date());
			task.setFlag(false);
			task.setTodomessage(taskmessage);
			task.setUser(user);
			
			getSession().save(task);
			commit();
			close();
			
		}catch(Exception e){
			rollback();
			e.printStackTrace();
		}
		
	}
	
}
