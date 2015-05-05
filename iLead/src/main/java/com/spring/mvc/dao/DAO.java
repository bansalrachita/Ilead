package com.spring.mvc.dao;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;





public abstract class DAO {
	
	Session session =null;
	Transaction transaction = null;

//   public Session getSession(){
//	   session = HibernateUtil.getSessionFactory().openSession();
//	   return session;
//   }
	 
   protected DAO() { 
   }


   
   public void setSession(Session session) {
	this.session = session;
}



public void setTransaction(Transaction transaction) {
	this.transaction = transaction;
}



public Session getSession() {
	return session;
}


protected void openSession() {
	 this.session = HibernateUtil.getSessionFactory().openSession();
      
   }

protected void beginTransaction(){
	transaction= session.beginTransaction();
}

   protected void commit() {
	   transaction.commit();
   }

   protected boolean checkIfOpen(){
	   //Transaction t = getSession().getTransaction();
	   //System.out.println(t.isActive());
	   return transaction.isActive();
   }
   protected void save(Object obj){
	   session.save(obj);
   }
   
   protected void rollback() {
       try {
    	   transaction.rollback();
       } catch (HibernateException e) {
          e.printStackTrace();
       }
       try {
    	   session.close();
       } catch (HibernateException e) {
    	   e.printStackTrace();
          
       }
      
   }

   public  void close() {
	   session.close();
   }
	
//  public void closeSessionFactory(){
//	   session.getSessionFactory().close();
//	    // return getSession().getSessionFactory().isClosed();
//   }
	
}
