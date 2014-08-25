package com.springmvc.t.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.thoughtworks.xstream.annotations.XStreamOmitField;
@Entity
@Table(name="T_wechatnews")
public class WeChatNews {
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid" ,strategy="uuid")
	@XStreamOmitField
	private String id;
	@Column
	private String ToUserName;
	@Column
	private String FromUserName;
	@Column
	private long CreateTime;
	@Column 
	private String MsgType;
	@Column 
	private int ArticleCount;
	@Column 
	@OneToMany(cascade ={ CascadeType.REMOVE,CascadeType.MERGE},mappedBy="news" ,fetch = FetchType.LAZY)
	private List<WeChatArticle> Articles = new ArrayList<WeChatArticle>();
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(long createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public int getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}
	public List<WeChatArticle> getArticles() {
		return Articles;
	}
	public void setArticles(List<WeChatArticle> articles) {
		Articles = articles;
	}



}
