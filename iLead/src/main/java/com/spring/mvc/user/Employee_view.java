package com.spring.mvc.user;

import java.util.ArrayList;
import java.util.Collection;

import com.spring.mvc.quiz.QuizResult;

public class Employee_view{

	private Collection<QuizResult> quizResult = new ArrayList<QuizResult>();
	private String firstname;	
	private String lastname;
	private int userId;
	private int rank;
	private int attempts;
	private String submissiondate;
	
	
	public String getSubmissiondate() {
		return submissiondate;
	}
	public void setSubmissiondate(String submissiondate) {
		this.submissiondate = submissiondate;
	}
	public Collection<QuizResult> getQuizResult() {
		return quizResult;
	}
	public void setQuizResult(Collection<QuizResult> quizResult) {
		this.quizResult = quizResult;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getAttempts() {
		return attempts;
	}
	public void setAttempts(int attempts) {
		this.attempts = attempts;
	}
	
	
	
	
}
