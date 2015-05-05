package com.spring.mvc.thread;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.spring.mvc.user.User;

@Entity
@Table(name="POST")
public class Post implements java.io.Serializable{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Post_ID;
	
	@ManyToOne
	@JoinColumn(name="THREAD_ID")
	private Threads thread;
	
	@Lob
	private String comments;
	
	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name="CREATION_DATE")
	private Date date;
	
	@ManyToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="USER_ID")
	private User user;
	
	public int getPost_ID() {
		return Post_ID;
	}
	public Threads getThread() {
		return thread;
	}
	public void setThread(Threads thread) {
		this.thread = thread;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
}
