package com.springmvc.t.server;

import java.util.List;

import com.springmvc.t.model.Topic;

public interface ITopicSer {
	public void addTopic(Topic topic,String name);
	public Topic getTopic(String id);
	public boolean check(Topic topic);
	List<Topic> getTopic(int forum,int begin);
	//public void editTopic(Topic topic, String name, String id);
	public void editTopic(Topic topic, String id);
}
