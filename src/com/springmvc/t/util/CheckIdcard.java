package com.springmvc.t.util;

import java.util.regex.Pattern;

public class CheckIdcard {
	private String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

	int wi[] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8 ,4, 2};
	char verifyCode[] = {'1','0','x','9','8','7','6','5','4','3','2'};
	
	public  boolean checkLen(){
		if(id.length()==15||id.length()==18)
			return true;
		return false;
	}
	
	public void shortToLong(){
		if(id.length()==15){
			int sum = 0;
			id = id.substring(0,6)+"19"+id.substring(6, 12);
			for(int i=0;i<17;i++){
				sum += wi[i]*(id.charAt(i)-48);
			}
			id = id + verifyCode[sum%11];
		}
	}
	
	public boolean checkInt(){
		String regex = "[0-9]{17}[0-9|x]";
		Pattern pat = Pattern.compile(regex);
		if(pat.matcher(id).matches())
			return true;
		return false;
	}
	
	public boolean checkBirthday(){
		int year = Integer.parseInt(id.substring(6, 10));
		int month = Integer.parseInt(id.substring(10, 12));
		int day = Integer.parseInt(id.substring(12, 14));
		if(year>2014 && year<1970)return false;
		if(month>12)return false;
		switch (month){
			case 2:				
			case 4:
			case 6:
			case 9:
			case 11:
				if(day>30)
					return false;
		}
		if(day>31)return false;
		if(year%4!=0||year%100==0 && year%400!=0){
			if(month==2&&day>28)
				return false;
		}
		return true;
	}
	
	public boolean checkVerify(){
		int sum = 0;
		for(int i=0;i<17;i++){
			sum += wi[i]*(id.charAt(i)-48);
		}
		if(verifyCode[sum%11]==id.charAt(17))
			return true;
		return false;
	}
	
	public boolean isFemal(){
		if(((id.charAt(16)-48)&0x1)==0)
			return true;
		return false;
	}
	
	public boolean valid(){
		this.shortToLong();
		return this.checkLen()&&this.checkInt()&&this.checkBirthday()&&this.checkVerify();
	}
}
