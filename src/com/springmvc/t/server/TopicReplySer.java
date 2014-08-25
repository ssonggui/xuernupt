package com.springmvc.t.server;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springmvc.t.dao.ITopicDao;
import com.springmvc.t.dao.ITopicReplyDao;
import com.springmvc.t.dao.IUserInfoDao;
import com.springmvc.t.model.TopicReply;
@Service("topicreplySerBase")
public class TopicReplySer implements ITopicReplySer {
	@Resource
	private ITopicReplyDao topicreplyDao;
	@Resource
	private IUserInfoDao userinfoDao;
	@Resource
	private ITopicDao itopicDao;
	
	/**
	 * �������
	 */
	@Override
	public void addTopicReply(TopicReply topicreply,String name,String topicId) {
		topicreply.setTime(new Date());
		topicreply.setTopic(itopicDao.getTopic(topicId));
		topicreply.setUser_topicreply(userinfoDao.getUser(name));
		topicreplyDao.addTopicReply(topicreply);

	}

	/**
	 * ��ȡ����
	 */
	
	@Override
	public List<TopicReply> getTopicReply(String topicId) {
		
		return topicreplyDao.getTopicReply(topicId);
	}


}
