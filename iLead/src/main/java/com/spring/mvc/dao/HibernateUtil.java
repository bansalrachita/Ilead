package com.spring.mvc.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


@SuppressWarnings("deprecation")
public class HibernateUtil {

	private static final SessionFactory sessionFactory;
	
	static{
		try{
			sessionFactory = new Configuration().configure().buildSessionFactory();
//			sessionFactory  = new AnnotationConfiguration().
//            configure().
//            //addPackage("com.xyz") //add package if used.
//            addAnnotatedClass(Userstable.class).buildSessionFactory();
		}catch(Throwable e){
			System.err.println("Initial session factory creation failed." + e);
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
}
