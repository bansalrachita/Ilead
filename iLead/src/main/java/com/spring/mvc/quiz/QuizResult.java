package com.spring.mvc.quiz;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.spring.mvc.user.Employee;
import com.spring.mvc.user.Manager;

@Entity
@Table(name="QUIZ_RESULTS")
public class QuizResult implements java.io.Serializable{

	/**
	 * 
	 */
	
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int QR_ID;
	
	@ManyToOne
	@JoinColumn(name="QM_ID")
	private QuizMaster quizMaster;
	
	@ManyToOne
	@JoinColumn(name="EMP_ID")
	private Employee employee;
	
	@ManyToOne
	@JoinColumn(name="MANAGER_ID")
	private Manager manager;
	
	@Column(name="POINTS_ACHIEVED")
	private float points;
	
	@Column(name="SUBMIT_DATE")
	private Date submissionDate;
	
	
	@Column(name="LATE_SUBMISSION")
	private boolean flag;
	
	
	
	
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public Date getSubmissionDate() {
		return submissionDate;
	}
	public void setSubmissionDate(Date submissionDate) {
		this.submissionDate = submissionDate;
	}
	public int getQR_ID() {
		return QR_ID;
	}
	public void setQR_ID(int qR_ID) {
		QR_ID = qR_ID;
	}
	public QuizMaster getQuizMaster() {
		return quizMaster;
	}
	public void setQuizMaster(QuizMaster quizMaster) {
		this.quizMaster = quizMaster;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public float getPoints() {
		return points;
	}
	public void setPoints(double points) {
		this.points = (float)points;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuffer b = new StringBuffer();
		b.append(" qm id : " + QR_ID);
		b.append(" manager id : " + manager.getUserId());
		b.append(" emp id : " + employee.getUserId());
		b.append(" points: " + points);
		b.append("late : " + flag);
		return b.toString();
	}
	
}
