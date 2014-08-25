package com.springmvc.t.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.t.model.Topic;

@Repository("topicDao")
public class TopicDao implements ITopicDao {
	@Resource
	private SessionFactory sessionfactoy;
	@Override
	public void addTopic(Topic topic) {
		sessionfactoy.getCurrentSession().save(topic);
		
	}
	@Override
	public Topic getTopic(String id) {
		return (Topic)sessionfactoy.getCurrentSession().get(Topic.class, id);
		//return (Topic)sessionfactoy.getCurrentSession().load(Topic.class, id);		
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> getTopic(int forum,int begin) {
		String hql = "from Topic t where t.forum =? ";
		Query qy = sessionfactoy.getCurrentSession().createQuery(hql).setFirstResult(0).setMaxResults(10);
		qy.setParameter(0, forum);
		return qy.list();
	}
	@Override
	public void editTopic(Topic topic){
		sessionfactoy.getCurrentSession().update(topic);
		//sessionfactoy.getCurrentSession().flush();
	}

}
