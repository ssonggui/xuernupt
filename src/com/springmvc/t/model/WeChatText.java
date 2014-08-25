package com.springmvc.t.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 
 * @author nange1
 * @see 微信Text实体类
 *
 */
@Entity
@Table(name="T_wechattext")
public class WeChatText {
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid" ,strategy="uuid")
	private String id;
	/**
	 *  <xml>
		 <ToUserName><![CDATA[toUser]]></ToUserName>
		 <FromUserName><![CDATA[fromUser]]></FromUserName> 
		 <CreateTime>1348831860</CreateTime>
		 <MsgType><![CDATA[text]]></MsgType>
		 <Content><![CDATA[this is a test]]></Content>
		 <MsgId>1234567890123456</MsgId>
		 </xml>
		 
	 */
	/**
	 * 
		参数	描述
		ToUserName	开发者微信号
		FromUserName	发送方帐号（一个OpenID）
		CreateTime	消息创建时间 （整型）
		MsgType	text
		Content	文本消息内容
		MsgId	消息id，64位整型
	 */
	@Column
	private String ToUserName;
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
	public Date getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Date createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getMsgId() {
		return MsgId;
	}
	public void setMsgId(String msgId) {
		MsgId = msgId;
	}
	@Column
	private String FromUserName;
	@Column
	private Date CreateTime;
	@Column 
	private String MsgType;
	@Column(length=2048) 
	private String Content;
	@Column(length=32) 
	private String MsgId;

}
