package com.springmvc.t.model;

import java.util.ArrayList;
import java.util.List;

import com.springmvc.t.model.TulingList;

public class WeChatTuling {
	/*
	 * 
参数	说明
code	状态码
text	提示语
name	书名
author	作者
detailurl	详情
icon	图标地址
	 */
	private String code;
	private String text;
	private String url;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	private List<TulingList> list = new ArrayList<TulingList>();
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<TulingList> getList() {
		return list;
	}
	public void setList(List<TulingList> list) {
		this.list = list;
	}

}
