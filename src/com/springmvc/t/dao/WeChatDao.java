package com.springmvc.t.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.t.model.WeChatMsgBase;

@Repository("wechatDao")
public class WeChatDao implements IWeChatDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addWCMsg(WeChatMsgBase wcmsg) {
		sessionFactory.getCurrentSession().save(wcmsg);
		
	}

	@Override
	public void findWCMsgById(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean delWCMsgById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
