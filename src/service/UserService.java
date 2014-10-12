package service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import pojo.User;
import util.HibernateSessionFactory;

public class UserService {
	
	public static User getUser(String username) {
		Session session = (Session) HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		Query query = session.createQuery("from User where username = :username");
		query.setString("username", username);
		List<User> list =  query.list();
		tran.commit();
		session.close();
		User user = null;
		if(list.size()==0)
			return null;
		if(list.size()>=1)
			user = list.get(0);
		return user;
	}
	
//	public static Boolean validUser(String username,String password) {
//		User thisUser = getUser(username);
//		if(thisUser == null)
//			return false;
//		if(thisUser.getPassword().equals(password)) {
//			return true;
//		}
//		else {
//			return false;
//		}
//	}
	
	public static Boolean addUser(User user) {
		User u  = null;
		Session session = (Session) HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		Query query = session.createQuery("from User where username = :username");
		query.setString("username", user.getUsername());
		Object obj = query.uniqueResult();
		if(obj==null) {
			session.save(user);
			tran.commit();
			session.close();
			return true;
		}
		tran.commit();
		session.close();
		return false;
		
	}
	
}
