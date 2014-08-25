package com.springmvc.t.server;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.t.dao.IUserInfoDao;
import com.springmvc.t.model.Page;
import com.springmvc.t.model.UserInfo;

@Service("iuserinfoSerBase")
public class UserInfoSer implements IUserInfoSer{
	@Autowired
	private IUserInfoDao userinfoDao;

	@Override
	public void addUser(UserInfo user) {
		// TODO Auto-generated method stub
		userinfoDao.addUser(user);
	}



	@Override
	public List<UserInfo> getAllUser() {
		// TODO Auto-generated method stub
		return userinfoDao.getAllUser();
	}

	@Override
	public boolean delUser(String name) {
		// TODO Auto-generated method stub
		return userinfoDao.delUser(name);
	}

	@Override
	public List<UserInfo> getUser(String name,Page page)  {
		// TODO Auto-generated method stub
		return userinfoDao.getUser(name,page);
	}

	@Override
	public boolean updateUser(UserInfo user) {
		// TODO Auto-generated method stub
		return userinfoDao.updateUser(user);
	}



	@Override
	public boolean checkUser(String name) {
		// TODO Auto-generated method stub
		return userinfoDao.checkUser(name);
	}



	@Override
	public boolean checkPasswd(String name, String passwd) {
		// TODO Auto-generated method stub
		return userinfoDao.checkPasswd(name, passwd);
	}



	@Override
	public boolean checkUserIdcard(String name, String idcard) {
		// TODO Auto-generated method stub
		return userinfoDao.checkUserIdcard(name, idcard);
	}



	@Override
	public List<UserInfo> getUserBypage(Page page) {
		
		return userinfoDao.getUserBypage(page);
	}



	@Override
	public long getTotolNum() {
		// TODO Auto-generated method stub
		return userinfoDao.getTotolNum();
	}
	public int getTotolNum(String name){
		return userinfoDao.getTotolNum(name);
	}



	@Override
	public boolean editUser(UserInfo user) {
		// TODO Auto-generated method stub
		return userinfoDao.editUser(user);
	}



	@Override
	public UserInfo getUser(String name) {
		// TODO Auto-generated method stub
		return userinfoDao.getUser(name);
	}



	@Override
	public void addFriend(String name, String who) {
		UserInfo u = userinfoDao.getUser(name);
		Set<UserInfo> set = u.getFriends();
		set.add(userinfoDao.getUser(who));
		u.setFriends(set);
		
	}



	@Override
	public void delFriend(String name, String who) {
		Set<UserInfo> set = userinfoDao.getUser(name).getFriends();
		set.remove(userinfoDao.getUser(who));
		userinfoDao.getUser(name).setFriends(set);
		
	}
//	public void delFriend(String name, String who) {
//		UserInfo ou = userinfoDao.getUser(name);
//		UserInfo fu = userinfoDao.getUser(who);
//		userinfoDao.delFriend(ou.getId(),fu.getId());
//		
//	}

}
