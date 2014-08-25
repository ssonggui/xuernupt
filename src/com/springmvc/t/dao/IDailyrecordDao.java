package com.springmvc.t.dao;

import java.util.Date;
import java.util.List;

import com.springmvc.t.model.Dailyrecord;

public interface IDailyrecordDao {
	public boolean addDailyrecord(Dailyrecord record);
	public boolean addDailyrecordBy(String Ownername);
	public boolean delDailyrecord();
	public boolean delDailyrecord(String Ownername);
	public Dailyrecord getDailyrecord(Date date);
	public Dailyrecord getDailyrecord(String Ownername);
	public List<Dailyrecord> getDailyrecordList(String Ownername);
	public List<Dailyrecord> getDailyrecordByKey(String keyword);
	public String getDailyrecordById(String id);
	public List<Dailyrecord> getDailyrecordListByKey(String key);
	List<Dailyrecord> getDailyrecordByIds(String[] ids);
	
}
