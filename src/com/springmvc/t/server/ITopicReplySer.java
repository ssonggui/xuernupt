package com.springmvc.t.server;

import java.util.List;

import com.springmvc.t.model.TopicReply;

public interface ITopicReplySer {

	public List<TopicReply> getTopicReply(String topicId);

	public void addTopicReply(TopicReply topicreply, String name, String topicId);
}
