package com.springmvc.t.util;

import java.util.Comparator;

import com.springmvc.t.model.Dailyrecord;

public class InvTimeComprarator implements  Comparator<Dailyrecord>{

	@Override
	public int compare(Dailyrecord o1, Dailyrecord o2) {
		if(o1.getTime().after(o2.getTime()))
			return 1;
		else if(o1.getTime().before(o2.getTime()))
			return -1;
		else
			return 0;
	}
	
}
