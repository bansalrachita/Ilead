package com.spring.mvc.updates;

import java.text.SimpleDateFormat;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.spring.mvc.user.Manager;

@Entity
@Table(name="UPDATES")
public class Updates implements java.io.Serializable{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int Update_ID;
	
	@ManyToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="MANAGER_ID")
	private Manager manager;
	
	@Column(name="UPDATE_STRING")
	private String message;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	@Column(name="Category")
	private String Category;
	
	
	
	
	
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public int getUpdate_ID() {
		return Update_ID;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy, hh:mm aaa");
		return sdf.format(date);
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuffer b = new StringBuffer();
		b.append(" up id : " + Update_ID);
		b.append(" manager id : " + manager.getUserId());
		b.append(" up string : " + message);
		b.append(" Date: " + date);
		return b.toString();
	}
	
	
}
