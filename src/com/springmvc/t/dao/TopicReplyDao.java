package com.springmvc.t.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.t.model.TopicReply;
@Repository("topicreplyDao")
public class TopicReplyDao implements ITopicReplyDao {
	@Resource
	private SessionFactory sessionfactory;
	
	@Override
	public void addTopicReply(TopicReply topicreply) {
		sessionfactory.getCurrentSession().save(topicreply);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<com.springmvc.t.model.TopicReply> getTopicReply(String id) {
		String hql = "from TopicReply tp where tp.topic=? ";
		Query qy = sessionfactory.getCurrentSession().createQuery(hql);
		qy.setString(0, id);
		return qy.list();
	}

}
