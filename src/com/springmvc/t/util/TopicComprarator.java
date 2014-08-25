package com.springmvc.t.util;

import java.util.Comparator;

import com.springmvc.t.model.Topic;




public class TopicComprarator implements  Comparator<Topic>{
	
	@Override
	public int compare(Topic o1, Topic o2) {
		
		if(o1.getTime().after(o2.getTime()))
			return -1;
		else if(o1.getTime().before(o2.getTime()))
			return 1;
		else
			return 0;
	}
	
}
