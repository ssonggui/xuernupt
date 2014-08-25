package com.springmvc.t.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.springmvc.t.model.Topic;
import com.springmvc.t.model.TopicJson;


public class TopicUtil {
	
	
	public static String toJson(List<Topic> topics){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH   时");
		List<TopicJson> list = new ArrayList<TopicJson>();
		TopicJson ts = null;
		if(topics.size()>0)
			for(Topic tp:topics){
				ts = new TopicJson();
				ts.setUrl(tp.getUrl()+tp.getId());
				ts.setTitle(tp.getTitle());
				ts.setTime(sdf.format(tp.getTime()));
				ts.setOwnername(tp.getUser_topic()==null?null:tp.getUser_topic().getName());
				list.add(ts);
			}
		else list = null;
		return JSON.toJSONString(list,true);
	}
}
