package com.springmvc.t.server;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.t.dao.IDailyrecordDao;
import com.springmvc.t.dao.IUserInfoDao;
import com.springmvc.t.model.Dailyrecord;
import com.springmvc.t.model.UserInfo;
import com.springmvc.t.util.SearchUtil;
@Service("idailyrecordSerBase")
public class DailyrecordSer implements IDailyrecordSer {


	@Autowired
	private IDailyrecordDao dailyrecordDao;
	@Autowired
	private IUserInfoDao userinfoDao;
	private Dailyrecord record = null;


	@Override
	public boolean addDailyrecord(String ownername, String content) {
		// TODO Auto-generated method stub
		record = new Dailyrecord();	
		
		record.setContent(content);
		record.setTime(new Date());
		UserInfo u = userinfoDao.getUser(ownername);
		record.setUser(u);
		return dailyrecordDao.addDailyrecord(record);
	}


	@Override
	public List<Dailyrecord> getDailyrecordList(String Ownername) {
		return userinfoDao.getDailyrecordList(Ownername);
	}


	@Override
	public String getDailyrecordById(String id) {
		// TODO Auto-generated method stub
		return dailyrecordDao.getDailyrecordById(id);
	}


	@Override
	public List<Dailyrecord> getDailyrecordListByKey(String path,String key,String name) {
		SearchUtil.creatIndex(path+"/lucenework", dailyrecordDao.getDailyrecordListByKey(key));
		
		return dailyrecordDao.getDailyrecordByIds(SearchUtil.creatSearch(path+"/lucenework", key));
	}

}
