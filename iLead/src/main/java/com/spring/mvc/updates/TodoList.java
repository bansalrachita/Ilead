package com.spring.mvc.updates;

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
import javax.persistence.Table;

import com.spring.mvc.user.Employee;
import com.spring.mvc.user.User;


@Entity
@Table(name="TODO_LIST")
public class TodoList implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public int getId() {
		return id;
	}

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="TODO_ID")
	private int id;
	
	@ManyToOne(fetch= FetchType.EAGER)
	@JoinColumn(name="USER_ID")
	private User user;
	
	@Column(name="MESSAGE")
	private String todomessage;
	
	@Column(name="CREATION_DATE")
	private Date creationDate;
	
	@Column(name="COMPLETED")
	private boolean flag;
	
	
	

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTodomessage() {
		return todomessage;
	}

	public void setTodomessage(String todomessage) {
		this.todomessage = todomessage;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuffer b  = new StringBuffer();
		b.append(" ID: " +  id);
		b.append(" Message: " +  todomessage);
		b.append(" Emp user Id : " + user);
		return super.toString();
	}
	
}
