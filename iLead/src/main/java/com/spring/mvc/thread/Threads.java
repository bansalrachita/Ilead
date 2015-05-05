package com.spring.mvc.thread;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.spring.mvc.user.User;

@Entity
@Table(name="THREAD")
public class Threads implements java.io.Serializable{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Thread_ID;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="USER_ID")
	private User user;
	
	private String Role;
	
	@Column(name="THREAD_STRING")
	private String threadString;
	
	@OneToMany(mappedBy = "thread", cascade=CascadeType.ALL)
	private Collection<Post> post;
	
	@Temporal(TemporalType.DATE)
	@Column(name="CREATION_DATE")
	private Date date;
	
	@Column(name="THREAD_TAG")
	private String tags;
	
	public int getThread_ID() {
		return Thread_ID;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getThreadString() {
		return threadString;
	}
	public void setThreadString(String threadString) {
		this.threadString = threadString;
	}
	
	public Collection<Post> getPost() {
		return post;
	}
	public void setPost(Collection<Post> post) {
		this.post = post;
	}
	public String getDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy, hh:mm aaa");
		return sdf.format(date);
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	
	
}
