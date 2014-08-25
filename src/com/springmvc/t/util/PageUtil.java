package com.springmvc.t.util;

import com.springmvc.t.model.Page;

public class PageUtil {
	public static void setRpp(Page page){
		page.setRecordnum(Page.RPP);
	}
	
	public static void setTotolrecord(Page page,int num){
		page.setTotolrecord(num);
	}
	
	public static void TotolPage(Page page){
		int pagenum = page.getTotolrecord()%page.getRecordnum()==0?page.getTotolrecord()/page.getRecordnum():page.getTotolrecord()/page.getRecordnum()+1;
		page.setPageNum(pagenum);
	}
	public static void isHasNext(Page page){
		if(page.getCurrentPage()<page.getPageNum()-1)
		  page.setHasnext(true);
	}
	
	public static void isHasPre(Page page){
		if(page.getCurrentPage()>0)
			  page.setHaspre(true);
	}
	
	public static void setBeginandSize(Page page){
		int cpns = page.getCurrentPage()/Page.MSPN;
		int bp = cpns*Page.MSPN;
		int showsize = page.getPageNum()-bp>Page.MSPN?Page.MSPN:page.getPageNum()-bp;
		page.setBeginpage(bp);
		page.setShowpsize(showsize);
	}
	
}
