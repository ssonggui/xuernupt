package com.springmvc.t.server;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springmvc.t.dao.ITopicDao;
import com.springmvc.t.dao.IUserInfoDao;
import com.springmvc.t.model.Topic;
import com.springmvc.t.util.TopicComprarator;
@Service("topicSerBase")
public class TopicSer implements ITopicSer {
	@Resource
	private ITopicDao topicDao;
	@Resource
	private IUserInfoDao userinfoDao;
	
	@Override
	public void addTopic(Topic topic,String name) {
		topic.setUrl("/view/topic/");
		topic.setTime(new Date());
		topic.setUser_topic(userinfoDao.getUser(name));
		topicDao.addTopic(topic);

	}

	@Override
	public Topic getTopic(String id) {
	
		return topicDao.getTopic(id);
	}

	@Override
	public boolean check(Topic topic) {
		if(null!=topic.getTitle()&&null!=topic.getContent()&&!"".equals(topic.getTitle())&&!"".equals(topic.getContent()))
			return true;
		else
			return false;
	}
	@Override
	public List<Topic> getTopic(int forum,int begin){
		List<Topic> list = topicDao.getTopic(forum,begin);
		Collections.sort(list, new TopicComprarator());
		return list;
		
	}

	@Override
	public void editTopic(Topic topic, String id) {
		Topic updatetopic = topicDao.getTopic(id);
		//topic.setUrl("/view/topic/");
		//topic.setId(id);
		updatetopic.setForum(topic.getForum());;
		updatetopic.setTime(new Date());
		updatetopic.setContent(topic.getContent());
		//topic.setTopicreply(topicDao.getTopic(id).getTopicreply());
		topicDao.editTopic(updatetopic);
	}	
	

}
