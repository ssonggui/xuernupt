package com.springmvc.t.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.t.model.Dailyrecord;
@Repository("dailyrecordDao")
public class DailyrecordDao implements IDailyrecordDao{


	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public boolean addDailyrecord(Dailyrecord record) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(record);
		return true;
	}

	@Override
	public boolean addDailyrecordBy(String Ownername) {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public boolean delDailyrecord() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delDailyrecord(String Ownername) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public com.springmvc.t.model.Dailyrecord getDailyrecord(Date date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public com.springmvc.t.model.Dailyrecord getDailyrecord(String Ownername) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dailyrecord> getDailyrecordList(String Ownername) {
		// TODO Auto-generated method stub
		String hql = "from Dailyrecord dr where dr.user=?";
		
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0, Ownername);
		return qy.list();
	}

	@Override
	public List<com.springmvc.t.model.Dailyrecord> getDailyrecordByKey(
			String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getDailyrecordById(String id) {
		// TODO Auto-generated method stub
		String hql = "select content from Dailyrecord dr where dr.id=?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0,id);
		return (String)qy.uniqueResult();		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dailyrecord> getDailyrecordListByKey(String key) {
		//明天继续，
		//搜索算法
		//模糊查询
		//海量数据查询！！！（imp）
		String hql = "from Dailyrecord";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);		
		return qy.list();
	}
	@SuppressWarnings("unchecked")
	
	public List<Dailyrecord> getDailyrecordListEx(String name) {
		//明天继续，
		//搜索算法
		//模糊查询
		//海量数据查询！！！（imp）
		String hql = "from Dailyrecord";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);		
		return qy.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Dailyrecord> getDailyrecordByIds(String[] ids) {
		//明天继续，
		//搜索算法
		//模糊查询
		//海量数据查询！！！（imp）
		if(null==ids ||ids.length==0)
			return null;
		else{
			String hql = "from Dailyrecord where id in(:ids)";
			Query qy = sessionFactory.getCurrentSession().createQuery(hql);	
			qy.setParameterList("ids", ids);
			return qy.list();
		}
	}

}
