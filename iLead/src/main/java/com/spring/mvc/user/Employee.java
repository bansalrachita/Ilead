package com.spring.mvc.user;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.spring.mvc.quiz.QuizResult;
import com.spring.mvc.updates.TodoList;

@Entity
@Table(name="EMPLOYEE")
public class Employee extends User{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@ManyToOne( fetch=FetchType.EAGER)
	@JoinColumn(name="MANAGER_ID")
	private Manager manager;
	
	@Column(name="EMP_SALARY")
	private float salary;
	
	@OneToMany(mappedBy="employee",cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Collection<QuizResult> quizResult = new ArrayList<QuizResult>();
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public Collection<QuizResult> getQuizResult() {
		return quizResult;
	}
	public void setQuizResult(Collection<QuizResult> quizResult) {
		this.quizResult = quizResult;
	}
	
	

}
