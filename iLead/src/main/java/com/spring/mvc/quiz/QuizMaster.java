package com.spring.mvc.quiz;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.spring.mvc.user.Manager;


@Entity
@Table(name="QUIZ_MASTER")
public class QuizMaster implements java.io.Serializable{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
 	private int QM_ID;
	
	@Column(name="NO_OF_QUESTIONS")
	private int numberofQuestions;
	
	@OneToMany(mappedBy="quizMaster", cascade=CascadeType.PERSIST)
	private Collection<QuizResult> quizResult;
	
	@ManyToOne
	@JoinColumn(name="MANAGER_ID")
	private Manager manager;
	
	@OneToMany(mappedBy="quizMaster", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private Collection<QuizTemplate> quizTemplate = new ArrayList<QuizTemplate>();
	
	@Column(name="QUIZ_NAME", nullable= false)
	private String quizName;
	
	@Column(name="MAX_POINTS")
	private float maxPoints;
	
	@Column(name="creationDate")
	private Date creationDate;
	
	@Column(name="DEADLINE")
	private Date deadline;
	
	
	
	
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		
		this.deadline = deadline;
	}
	public String getQuizName() {
		return quizName;
	}
	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}
	public int getQM_ID() {
		return QM_ID;
	}
	public int getNumberofQuestions() {
		return numberofQuestions;
	}
	public void setNumberofQuestions(int numberofQuestions) {
		this.numberofQuestions = numberofQuestions;
	}
	
	public Collection<QuizResult> getQuizResult() {
		return quizResult;
	}
	/*public void setQuizResult(Collection<QuizResult> quizResult) {
		this.quizResult = quizResult;
	}*/
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public Collection<QuizTemplate> getQuizTemplate() {
		return quizTemplate;
	}
	public void setQuizTemplate(Collection<QuizTemplate> quizTemplate) {
		this.quizTemplate = quizTemplate;
	}
	
	public float getMaxPoints() {
		return maxPoints;
	}
	public void setMaxPoints(float maxPoints) {
		this.maxPoints = maxPoints;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuffer b = new StringBuffer();
		b.append(" qm id : " + QM_ID);
		b.append(" manager id : " + manager.getUserId());
		b.append(" number of qns : " + numberofQuestions);
		b.append(" name: " + quizName);
		return b.toString();
	}
	
}
