package com.springmvc.t.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.t.model.Dailyrecord;
import com.springmvc.t.model.Page;
import com.springmvc.t.model.UserInfo;

@Repository("userinfoDao")
public class UserInfoDao implements IUserInfoDao {
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public void addUser(UserInfo user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfo> getAllUser() {
		String hql = "from UserInfo";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);

		return qy.list();
	}

	@Override
	public boolean delUser(String name) {
		// TODO Auto-generated method stub
		String hql = "delete UserInfo u where u.name = ?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0, name);
		return (qy.executeUpdate()>0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfo> getUser(String name,Page page) {
		String hql = "from UserInfo u where u.name like ?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		//query.setString(0, id);
		qy.setString(0, "%"+name+"%");
		qy.setFirstResult(page.getCurrentPage()*page.getRecordnum());
		qy.setMaxResults(page.getRecordnum());
		return qy.list();
		
	}

	@Override
	public boolean updateUser(UserInfo user) {
		String hql = "update UserInfo u set u.passwd=? where u.name=? and u.idcard= ? ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, user.getPasswd());
		query.setString(1, user.getName());
		query.setString(2, user.getIdcard());
		
		return (query.executeUpdate() > 0);
		
	}

	@Override
	public boolean editUser(UserInfo user) {
		String hql = "update UserInfo u set u.passwd=?, u.email=?, u.idcard=? ,u.telephone=? where u.name=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		query.setString(0, user.getPasswd());
		query.setString(1, user.getEmail());
		query.setString(2, user.getIdcard());
		query.setString(3, user.getTelephone());
		query.setString(4, user.getName());
		return (query.executeUpdate() > 0);
		
	}
	
	@Override
	public boolean checkUser(String name) {
		String hql = "from UserInfo u where u.name=?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0, name);
		return !qy.list().isEmpty();
	}

	@Override
	public boolean checkPasswd(String name, String passwd) {
		String hql = "from UserInfo u where u.name=? and u.passwd=?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0, name);
		qy.setString(1, passwd);
		return !qy.list().isEmpty();
	}

	@Override
	public boolean checkUserIdcard(String name, String idcard) {
		String hql = "from UserInfo u where u.name=? and u.idcard=?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0, name);
		qy.setString(1, idcard);
		return !qy.list().isEmpty();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfo> getUserBypage(Page page) {
		String  hql="";
		Query qy = null;

		hql = "from UserInfo order by name asc";
		qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setFirstResult(page.getCurrentPage()*page.getRecordnum());
		qy.setMaxResults(page.getRecordnum());
		return qy.list();
		
	}

	@Override
	public long getTotolNum() {
		// TODO Auto-generated method stub
		String hql="select count(*) from UserInfo";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		
		return (Long)qy.list().get(0);
	}
	
	@Override
	public int getTotolNum(String name) {
		// TODO Auto-generated method stub
		String hql = "from UserInfo u where u.name like ?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0,"%"+name+"%");
		return qy.list().size();
	}

	@Override
	public UserInfo getUser(String name) {
		// TODO Auto-generated method stub
		String hql = "from UserInfo u where u.name= ?";
		Query qy = sessionFactory.getCurrentSession().createQuery(hql);
		qy.setString(0, name);
		return (UserInfo)qy.uniqueResult();
	}

	@Override
	public List<Dailyrecord> getDailyrecordList(String name) {
		UserInfo u = getUser(name);
		return new ArrayList<Dailyrecord>(u.getDailyrecord());
	}

	@Override
	public void delFriend(String Owenerid, String fid) {
		// TODO Auto-generated method stub
		String sql = "delete from T_friendrelation where OwenerId = '"+Owenerid+"' and fId = '"+fid+"'";
		Query qy = sessionFactory.getCurrentSession().createSQLQuery(sql);
		qy.executeUpdate();
	}

}
