package com.springmvc.t.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.thoughtworks.xstream.annotations.XStreamOmitField;
/**
 * 
 * @author nange1
 * @see ΢��Textʵ����
 *
 */
@Entity
@Table(name="T_wechatreplytext")
public class WeChatReplyText {

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
		����	����
		ToUserName	������΢�ź�
		FromUserName	���ͷ��ʺţ�һ��OpenID��
		CreateTime	��Ϣ����ʱ�� �����ͣ�
		MsgType	text
		Content	�ı���Ϣ����
		MsgId	��Ϣid��64λ����
	 */
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
	@Column(length=1024) 
	private String Content;
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
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}

}
