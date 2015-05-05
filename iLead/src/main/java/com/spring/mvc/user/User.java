package com.spring.mvc.user;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.spring.mvc.updates.TodoList;




@Inheritance(strategy=InheritanceType.JOINED)
@Table(name="USERS")
@Entity(name="USER_DETAILS")
public class User implements Serializable{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="USER_ID",unique = true, nullable = false)
	private int userId;
	
	private String firstname;
	
	private String lastname;
	
	@Column(name="USER_NAME", unique=true, nullable=false)
	private String username;
	
	@Column(name="USER_PASSWORD",nullable=false )
	private String password;
	
	@Column(name="USER_GENDER")
	private String gender;
	
	@Column(name="USER_AGE")
	private int age;
	
	@Column(name="USER_CONTACT")
	private String Contact;
	
	private Role role ;
	
	private String email;
	
	private String about;
	
	
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private Collection<TodoList> todo = new ArrayList<TodoList>();
	
	
	public enum Role{
		
		Manager("MANAGER"),
		Employee("EMPLOYEE"),
		Admin("ADMIN"),
		None("NONE");
		
		private String value;
		
		private Role(String role){
			value = role;
		}
		
		public String getValue(){
			return value;
		}
		
	}
	
	

	

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	public Collection<TodoList> getTodo() {
		return todo;
	}
	public void setTodo(Collection<TodoList> todo) {
		this.todo = todo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
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
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getUserId() {
		return userId;
	}
	public String getContact() {
		return Contact;
	}
	public void setContact(String contact) {
		Contact = contact;
	}
	
	
	
	
}
