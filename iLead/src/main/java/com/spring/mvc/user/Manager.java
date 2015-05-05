package com.spring.mvc.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;

import com.spring.mvc.quiz.QuizMaster;
import com.spring.mvc.updates.Updates;

@Entity
@Table(name="MANAGER")
public class Manager extends User{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	@OneToMany(mappedBy="manager", fetch=FetchType.EAGER)
	private Collection<Employee> employee = new ArrayList<Employee>();
	
	@Column(name="MANAGER_SALARY")
	private float salary;
	
	private String Department;
	
	@OneToMany(mappedBy="manager",cascade = CascadeType.PERSIST )
	private Collection<Updates> updates;
	
	@OneToMany(mappedBy="manager", cascade = CascadeType.ALL)
	private Collection<QuizMaster> quizMaster;
	
	@Column(name="PROJECT_NAME")
	private String projectName;
	
	@Column(name="START_DATE")
	private Date startDate;
	
	@Column(name="END_DATE")
	private Date endDate;
	
	
	
	
	
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Collection<Employee> getEmployee() {
		return employee;
	}
	public void setEmployee(Collection<Employee> employee) {
		this.employee = employee;
	}
	public void setEmployee(ArrayList<Employee> employee) {
		this.employee = employee;
	}
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	
	public Collection<Updates> getUpdates() {
		return updates;
	}
	public void setUpdates(Collection<Updates> updates) {
		this.updates = updates;
	}
	public Collection<QuizMaster> getQuizMaster() {
		return quizMaster;
	}
	public void setQuizMaster(Collection<QuizMaster> quizMaster) {
		this.quizMaster = quizMaster;
	}
	
	
	
	
}
