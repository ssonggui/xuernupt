package com.springmvc.t.dao;

import java.util.List;

import com.springmvc.t.model.Dailyrecord;
import com.springmvc.t.model.Page;
import com.springmvc.t.model.UserInfo;

public interface IUserInfoDao {
	public void addUser(UserInfo user);
	public UserInfo getUser(String name);
	public List<UserInfo> getAllUser();
	public List<UserInfo> getUserBypage(Page page);
	public boolean delUser(String name);
	
	public List<UserInfo> getUser(String name,Page page) ;
	public boolean checkUser(String name);
	public boolean checkUserIdcard(String name,String idcard);
	public boolean checkPasswd(String name,String passwd);
	public boolean updateUser(UserInfo user);

	public long getTotolNum();
	public int getTotolNum(String name);

	public boolean editUser(UserInfo user);
	public List<Dailyrecord> getDailyrecordList(String name);
	public void delFriend(String Owenerid,String fid);
}
