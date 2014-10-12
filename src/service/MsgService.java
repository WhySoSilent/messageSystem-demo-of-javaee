package service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import pojo.Msg;

import util.HibernateSessionFactory;

public class MsgService {
	public static List<Msg> getAll() {
		
		Session session = (Session) HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		Query query = session.createQuery("from Msg");
		List<Msg> list =  query.list();
		tran.commit();
		session.close();
		
		return list;
	}
	public static void add(Msg msg) {
		Session session = (Session) HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		session.save(msg);
		tran.commit();
		session.close();
	}
}
