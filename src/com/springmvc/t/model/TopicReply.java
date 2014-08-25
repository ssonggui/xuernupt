package com.springmvc.t.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="T_topicreply")
public class TopicReply {
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid" ,strategy="uuid")
	private String id;
	@Column
	private String url;
	@Column(length=500)
	private String content;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="topic")
	private Topic topic;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_topicreply")
	private UserInfo user_topicreply;
	@DateTimeFormat(pattern = "yyyy-MM-dd-HH-mm-ss")	 
	@Column
	private Date time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public UserInfo getUser_topicreply() {
		return user_topicreply;
	}
	public void setUser_topicreply(UserInfo user_topicreply) {
		this.user_topicreply = user_topicreply;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

}
