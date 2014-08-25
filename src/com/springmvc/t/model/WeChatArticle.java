package com.springmvc.t.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.thoughtworks.xstream.annotations.XStreamOmitField;
@Entity
@Table(name="T_wechatarticle")
public class WeChatArticle {
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid" ,strategy="uuid")
	@XStreamOmitField
	private String id;
	@Column 
	private String Title;
	@Column 
	private String Description;
	@Column 
	private String PicUrl;	
	@Column 
	private String Url;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="news")
	@XStreamOmitField
	private WeChatNews news;
	
	public WeChatNews getNews() {
		return news;
	}
	public void setNews(WeChatNews news) {
		this.news = news;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
}
