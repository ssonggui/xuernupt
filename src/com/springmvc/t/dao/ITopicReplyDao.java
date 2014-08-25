package com.springmvc.t.dao;

import java.util.List;

import com.springmvc.t.model.TopicReply;

public interface ITopicReplyDao {
	public void addTopicReply(TopicReply topicreply);
	public List<TopicReply> getTopicReply(String id);
}
