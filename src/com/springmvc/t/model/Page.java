package com.springmvc.t.model;

public class Page {
	public static final int MSPN =5 ;
	public static final int RPP = 6 ;
	private int currentPage;
	private int pageNum;
	private int gopage;
	private int recordnum;
	private int beginpage;
	private int showpsize;


	public int getShowpsize() {
		return showpsize;
	}
	public void setShowpsize(int showpsize) {
		this.showpsize = showpsize;
	}
	public int getBeginpage() {
		return beginpage;
	}
	public void setBeginpage(int beginpage) {
		this.beginpage = beginpage;
	}
	private boolean hasnext;
	private boolean haspre;

	public boolean isHasnext() {
		return hasnext;
	}
	public void setHasnext(boolean hasnext) {
		this.hasnext = hasnext;
	}
	public boolean isHaspre() {
		return haspre;
	}
	public void setHaspre(boolean haspre) {
		this.haspre = haspre;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getGopage() {
		return gopage;
	}
	public void setGopage(int gopage) {
		this.gopage = gopage;
	}
	public int getRecordnum() {
		return recordnum;
	}
	public void setRecordnum(int recordnum) {
		this.recordnum = recordnum;
	}
	public int getTotolrecord() {
		return totolrecord;
	}
	public void setTotolrecord(int totolrecord) {
		this.totolrecord = totolrecord;
	}
	private int totolrecord;
	
	
	
	
}
