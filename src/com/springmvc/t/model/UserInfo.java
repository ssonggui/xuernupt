package com.springmvc.t.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="T_userinfo")
public class UserInfo {
	@Id
	@GeneratedValue(generator = "system-uuid")  
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length=32)
	private String id;
	@Column(length=16)
	private String name;
	@Column(length=64)
	private String passwd;
	@Column(length=32)
	private String email;
	@Column(length=18)
	private String idcard;
	@Column(length=18)
	private String telephone;
	@OneToMany(cascade ={ CascadeType.REMOVE,CascadeType.MERGE},mappedBy="user_topic" ,fetch = FetchType.LAZY)
	
	private Set<Topic> topic = new HashSet<Topic>();
	
	@OneToMany(cascade ={ CascadeType.REMOVE,CascadeType.MERGE},mappedBy="user_topicreply" ,fetch = FetchType.LAZY)
	
	private Set<TopicReply> topicreply = new HashSet<TopicReply>();
	
	@OneToMany(cascade ={ CascadeType.REMOVE,CascadeType.MERGE},mappedBy="user" ,fetch = FetchType.LAZY)
	
	private Set<Dailyrecord> dailyrecord = new HashSet<Dailyrecord>();
	
	public Set<Dailyrecord> getDailyrecord() {
		return dailyrecord;
	}
	public void setDailyrecord(Set<Dailyrecord> dailyrecord) {
		this.dailyrecord = dailyrecord;
	}
	@ManyToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},fetch=FetchType.LAZY)
	@JoinTable(name="T_friendrelation" ,joinColumns={@JoinColumn(name="OwenerId")},inverseJoinColumns={@JoinColumn(name="fId")}) 
	private Set<UserInfo> friends =  new HashSet<UserInfo>();
	
	public void addFriend(UserInfo u){
		friends.add(u);
	}
	public void delFriend(UserInfo u){
		friends.remove(u);
	}
	public Set<UserInfo> getFriends() {
		return friends;
	}
	public void setFriends(Set<UserInfo> friends) {
		this.friends = friends;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}
