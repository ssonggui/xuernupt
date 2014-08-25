package com.springmvc.t.dao;

import com.springmvc.t.model.WeChatMsgBase;

public interface IWeChatDao {
	public void addWCMsg(WeChatMsgBase wcmsg);
	public void findWCMsgById(String id);
	public boolean delWCMsgById(String id);

}
