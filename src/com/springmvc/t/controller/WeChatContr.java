package com.springmvc.t.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.t.model.Dailyrecord;
import com.springmvc.t.model.TulingList;
import com.springmvc.t.model.UserInfo;
import com.springmvc.t.model.WeChatArticle;
import com.springmvc.t.model.WeChatNews;
import com.springmvc.t.model.WeChatReplyText;
import com.springmvc.t.model.WeChatText;
import com.springmvc.t.model.WeChatTuling;
import com.springmvc.t.server.IDailyrecordSer;
import com.springmvc.t.server.IUserInfoSer;
import com.springmvc.t.util.TimeComprarator;
import com.springmvc.t.util.WeChatUtil;

@Controller
@Scope("prototype")
public class WeChatContr {
	@Resource(name="iuserinfoSer")
	private IUserInfoSer iuserinfoSer;
	
	@Resource(name="idailyrecordSer")
	private IDailyrecordSer idailyrecordSer;
	
	private Map<String,String> map = new HashMap<String,String>();
	private WeChatText message = new WeChatText();
	private WeChatReplyText reply = new WeChatReplyText();
	private UserInfo userinfo = null;
	private List<Dailyrecord> recordlsit = null;
	private WeChatNews replynews = null;
	private WeChatArticle weArticles = null;
	List<WeChatArticle> list = null;
	@RequestMapping(value="/WeChat")
	public String Wechat(){
		return "userwechat";
	}
	
	@RequestMapping(value="/WeChat1", method=RequestMethod.GET, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String InitWeChat(HttpServletRequest request){
		// ΢�ż���ǩ��   
		String signature = request.getParameter("signature");  
        // ʱ���  
        String timestamp = request.getParameter("timestamp");  
        // �����  
        String nonce = request.getParameter("nonce");  
        // ����ַ���  
        String echostr = request.getParameter("echostr");
        if(WeChatUtil.checkSignature(signature, timestamp, nonce)&&null!=echostr)
        	return echostr;
        else
        	return "error";
	}
	
	@RequestMapping(value="/WeChat1", method=RequestMethod.POST, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String WeChat(HttpServletRequest request,HttpServletResponse response){
		// ΢�ż���ǩ��   
		String signature = request.getParameter("signature");  
        // ʱ���  
        String timestamp = request.getParameter("timestamp");  
        // �����  
        String nonce = request.getParameter("nonce");
        String replycontent = WeChatUtil.WEL;
        if(!WeChatUtil.checkSignature(signature, timestamp, nonce))
        return "error";
        
    	map = WeChatUtil.ParseXmlToMap(request);

    	if(map.get("MsgType").equals(WeChatUtil.TEXT)){
    		 //message = WeChatUtil.MapToWCMsg(map);
    		 String contents[] = map.get("Content").split(":"); 
    		 if(contents.length==2){
    			 
	    		 if(iuserinfoSer.checkUser(contents[0])){
	    			 
	    			 userinfo = iuserinfoSer.getUser(contents[0]);
	        		 if("f".equals(contents[1])){
	        			 if(null!=userinfo.getFriends() && userinfo.getFriends().size()>0){
	        				 replycontent=contents[0]+"�ĺ���Ϊ\n";
	        				 for(UserInfo u:userinfo.getFriends())
	        				 replycontent += " "+u.getName();
	        			 }	 
	        			 else replycontent = "�û�"+contents[0]+"�޹�ע����";
	        		 }else if("s".equals(contents[1])){
	        			 recordlsit = idailyrecordSer.getDailyrecordList(contents[0]);
	        			 if(null!=recordlsit){
	        				 Collections.sort(recordlsit,new TimeComprarator());
	        				 replycontent = recordlsit.get(0).getContent() ;
	        			 }else
	        				 replycontent = "�û�"+contents[0]+"��΢��";
	        		 }else if("fs".equals(contents[1])){
	        			 replycontent = WeChatUtil.TEST;
	        		 }
	    		 }
    		 }else if(contents.length==1 && contents[0].equals("��վ")){
    			 weArticles = new WeChatArticle();
    			 weArticles.setTitle("xuernupt��վ����---������");
    			 weArticles.setDescription("�����ϣ�˶ʿ�Ͷ����Ͼ��ʵ��ѧ��ͨ������Ϣϵͳרҵ\n���ƾͶ����ϲ���ѧ��ͨ�Ź���רҵ.\n���ڽ����ʵ�滮���Ժʵϰ�������żҸ��е���4G�����������\n"
    			 		+ "�Ͼ���ʿͨ�ϴ�ʵϰ�������ձ���ĿSystemWalker\n");
    			 weArticles.setPicUrl("http://xuernupt.vipsinaapp.com/img/item1.jpg");
    			 weArticles.setUrl("Http://xuernupt.vipsinaapp.com");
    			 list = new ArrayList<WeChatArticle>();
    			 list.add(weArticles);
    			 replynews = new WeChatNews();
    			 replynews.setToUserName(map.get("FromUserName"));
    			 replynews.setFromUserName(map.get("ToUserName"));
    			 replynews.setCreateTime(System.currentTimeMillis());
    			 replynews.setMsgType(WeChatUtil.NEWS);
    			 replynews.setArticleCount(1);
    			 replynews.setArticles(list);
    			 return WeChatUtil.replyToXml(replynews);
    		 }else{
    			 String jsonstr = WeChatUtil.creatGetHttp(map.get("Content"));
    			 int code = WeChatUtil.getTulingcode(jsonstr);
    			 
    			 if(null!=jsonstr && code!=400){
    				list = new ArrayList<WeChatArticle>();
    				 WeChatTuling tulingmodel = WeChatUtil.JsonToObj(jsonstr, WeChatTuling.class);
    				 List<TulingList> tulinglist = tulingmodel.getList();
    				 if(tulinglist.size()>0 && !tulingmodel.getCode().equals("305000") && !tulingmodel.getCode().equals("306000")){
    					
    						 for(int i =0;i<tulinglist.size()&&i<6;i++){
	        	    			 weArticles = new WeChatArticle();
	        	    			 weArticles.setTitle(WeChatUtil.constrTuling(tulinglist.get(i)));
	        	    			 weArticles.setDescription("");
	        	    			 weArticles.setPicUrl(tulinglist.get(i).getIcon());
	        	    			 weArticles.setUrl(tulinglist.get(i).getDetailurl());
	        	    			 list.add(weArticles);  
    						 }

    					 
    	    			 replynews = new WeChatNews();
    	    			 replynews.setToUserName(map.get("FromUserName"));
    	    			 replynews.setFromUserName(map.get("ToUserName"));
    	    			 replynews.setCreateTime(System.currentTimeMillis());
    	    			 replynews.setMsgType(WeChatUtil.NEWS);
    	    			 replynews.setArticleCount(tulinglist.size()>6?6:tulinglist.size());
    	    			 replynews.setArticles(list);
    	    			 return WeChatUtil.replyToXml(replynews);
    				 }else if(tulingmodel.getCode().equals("100000")){
    					 replycontent = tulingmodel.getText();
    				 }else if(tulingmodel.getCode().equals("200000")){
    					 replycontent = "<a href=\""+tulingmodel.getUrl()+"\">"+tulingmodel.getText()+"</a> ";
    				 }else if(tulingmodel.getCode().equals("305000")){
						 replycontent =tulingmodel.getText()+"--"+tulinglist.get(0).getStart()+"--"+tulinglist.get(0).getStarttime()+"--"+tulinglist.get(0).getTerminal()+"--"+tulinglist.get(0).getEndtime();
					 }else if(tulingmodel.getCode().equals("306000")){
						 replycontent =tulingmodel.getText()+"--"+tulinglist.get(0).getFlight()+"--"+tulinglist.get(0).getRoute()+"--"+tulinglist.get(0).getStart()+"--"+tulinglist.get(0).getStarttime()+"--"+tulinglist.get(0).getTerminal()+"--"+tulinglist.get(0).getEndtime();
					 }
    					 
    			 }else
    				 replycontent = "����û�а취�ˣ�";
    		 }
   	}
    	reply.setToUserName(map.get("FromUserName"));
    	reply.setFromUserName(map.get("ToUserName"));
    	reply.setCreateTime(System.currentTimeMillis());
    	reply.setMsgType(WeChatUtil.TEXT);
    	reply.setContent(replycontent);       	
    	return WeChatUtil.replyToXml(reply);

	}
}