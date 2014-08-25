package com.springmvc.t.server;

import java.util.List;

import com.springmvc.t.model.Dailyrecord;


public interface IDailyrecordSer {
	public boolean addDailyrecord(String ownername,String content);
	public List<Dailyrecord> getDailyrecordList(String Ownername);
	public String getDailyrecordById(String id);
	public List<Dailyrecord> getDailyrecordListByKey(String path,String key, String name);
}
