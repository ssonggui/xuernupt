package com.springmvc.t.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="T_topic")
public class Topic {
	
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid" ,strategy="uuid")
	private String id;
	@Column
	private String title;
	@Column
	private int forum;
	public int getForum() {
		return forum;
	}
	public void setForum(int forum) {
		this.forum = forum;
	}
	@Column
	private String url;
	@Column(length=10000)
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd-HH-mm-ss")	 
	@Column
	private Date time;
	@OneToMany(cascade ={ CascadeType.REMOVE,CascadeType.MERGE},mappedBy="topic" ,fetch = FetchType.LAZY)
	private List<TopicReply> topicreply = new ArrayList<TopicReply>();
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_topic")
	private UserInfo user_topic;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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

	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public List<TopicReply> getTopicreply() {
		return topicreply;
	}
	public void setTopicreply(List<TopicReply> topicreply) {
		this.topicreply = topicreply;
	}
	public UserInfo getUser_topic() {
		return user_topic;
	}
	public void setUser_topic(UserInfo user_topic) {
		this.user_topic = user_topic;
	}
}
