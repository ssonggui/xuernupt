package com.springmvc.t.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class UrlDecoder{
	public static String decode(String src){
		String output =null;
		try {
			output =  URLDecoder.decode(src,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return output;
	}
}
