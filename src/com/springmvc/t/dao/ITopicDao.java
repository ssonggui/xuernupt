package com.springmvc.t.dao;

import java.util.List;

import com.springmvc.t.model.Topic;

public interface ITopicDao {
	public void addTopic(Topic topic);
	public Topic getTopic(String id);
	//public List<Topic> getTopic(int forum);
	void editTopic(Topic topic);
	List<Topic> getTopic(int forum, int begin);
}
