package com.springmvc.t.server;

import java.util.List;

import com.springmvc.t.model.Page;
import com.springmvc.t.model.UserInfo;

public interface IUserInfoSer {
	public void addUser(UserInfo user);
	public UserInfo getUser(String name);
	public List<UserInfo> getAllUser();
	public List<UserInfo> getUserBypage(Page page);
	public long getTotolNum();
	public int getTotolNum(String name);
	public boolean delUser(String name);
	
	public List<UserInfo> getUser(String name,Page page) ;
	public boolean checkUserIdcard(String name,String idcard);
	public boolean checkUser(String name);
	public boolean checkPasswd(String name,String passwd);
	public boolean updateUser(UserInfo user);
	public boolean editUser(UserInfo user);
	public void addFriend(String name, String who);
	public void delFriend(String name, String who);
}
