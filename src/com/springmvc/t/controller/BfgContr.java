package com.springmvc.t.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.t.model.Dailyrecord;
import com.springmvc.t.model.UserInfo;
import com.springmvc.t.server.IDailyrecordSer;
import com.springmvc.t.server.IUserInfoSer;
import com.springmvc.t.util.InvTimeComprarator;
import com.springmvc.t.util.TimeComprarator;

@Controller
@Scope("prototype")
public class BfgContr {
	
	@Resource(name="iuserinfoSer")
	private IUserInfoSer iuserinfoSer;
	
	@Resource(name="idailyrecordSer")
	private IDailyrecordSer idailyrecordSer;
	
	private List<Dailyrecord> dailyrecords = null;
	private Integer[] flags = null;
	private Set<UserInfo> set = null;
	@RequestMapping(value="/bfg")
	public ModelAndView Bfg(HttpSession session,@CookieValue(value="loginname", defaultValue="null")String loginname,@CookieValue(value="loginpwd", defaultValue="null")String loginpwd,Integer comparator){
		ModelAndView mv = new ModelAndView();
		if("null".equals(loginname) || "null".equals(loginpwd) || !iuserinfoSer.checkPasswd(loginname, loginpwd)){
			session.setAttribute("sessionpath", "/bfg");
			mv.addObject("bfgmsg", "该页面需先登录，");
			mv.setViewName("forward:/login");
		}else{
				mv.setViewName("bfg");
				set = iuserinfoSer.getUser(loginname).getFriends();
				
				dailyrecords = idailyrecordSer.getDailyrecordList(loginname);
				for(UserInfo u:set)
				dailyrecords.addAll(u.getDailyrecord());
				if(null!=comparator && comparator==1)
					Collections.sort(dailyrecords, new TimeComprarator());
				else if(null!=comparator && comparator==-1)
					Collections.sort(dailyrecords, new InvTimeComprarator());
				
				if(dailyrecords!=null&&dailyrecords.size()>0){
				flags = new Integer[dailyrecords.size()];
				for(int i=0;i<dailyrecords.size();i++){
					
					if(loginname.equals(dailyrecords.get(i).getUser().getName()))
						flags[i] = 0;
					else if(set.contains(dailyrecords.get(i).getUser())) 
						flags[i] = 1;
					else flags[i] = -1;
			
				}
				}
				mv.addObject("dailyrecords",dailyrecords);
				mv.addObject("flags",flags);
		}
		return mv;
	}
	
	@RequestMapping(value="/bfg/adddailyrecord")
	public ModelAndView adddailyrecord(@CookieValue(value="loginname", defaultValue="null")String ownername,String content){
		if(null!=content && !"".equals(content)){
		idailyrecordSer.addDailyrecord(ownername, content);
		}
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/bfg");
		return mv;
	}
	
	@RequestMapping(value="/bfg/search")
	public ModelAndView searchdailyrecord(String key,HttpServletRequest re,HttpServletResponse response,@CookieValue(value="loginname")String name,@CookieValue(value="searchkey" ,defaultValue="null")String cookiekey) throws UnsupportedEncodingException{
		
		if(null==key){
			key=cookiekey;
		}else {
			Cookie bfgkeycookie = new Cookie("searchkey",URLEncoder.encode(key,"UTF-8"));
			response.addCookie(bfgkeycookie);
		}
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bfgresult");
		
		dailyrecords = idailyrecordSer.getDailyrecordListByKey(re.getSession().getServletContext().getRealPath("/"),key,name);
		
		set = iuserinfoSer.getUser(name).getFriends();
		if(dailyrecords!=null&&dailyrecords.size()>0){
		flags = new Integer[dailyrecords.size()];
		for(int i=0;i<dailyrecords.size();i++){
			
			if(name.equals(dailyrecords.get(i).getUser().getName()))
				flags[i] = 0;
			else if(set.contains(dailyrecords.get(i).getUser())) 
				flags[i] = 1;
			else flags[i] = -1;
	
		}
		}
		mv.addObject("dailyrecords",dailyrecords);
		mv.addObject("flags",flags);
		return mv;
	}
	
	@RequestMapping(value="/bfg/editor")
	public String editor(String precontent,HttpServletRequest re) throws UnsupportedEncodingException{

		re.setAttribute("precontent", precontent);
		return "bfgeditor";
	}
	
	@RequestMapping(value="/bfg/show/{id}")
	public ModelAndView show(@PathVariable("id")String id){
		
		String content = idailyrecordSer.getDailyrecordById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bfgshow");
		mv.addObject("content", content);
		return mv;
	}
	
	@RequestMapping(value="/bfg/{path}/addfriend")
	public String addfriend(@PathVariable("path")String path,@CookieValue(value="loginname")String name,String who) throws UnsupportedEncodingException{
		iuserinfoSer.addFriend(name,who);
		if("search".equals(path))
		return "redirect:/bfg/"+path;
		return "redirect:/bfg";
	}
	
	@RequestMapping(value="/bfg/{path}/delfriend")
	public String delfriend(@PathVariable("path")String path,@CookieValue(value="loginname")String name,String who) throws UnsupportedEncodingException{
		iuserinfoSer.delFriend(name,who);		
		if("search".equals(path))
		return "redirect:/bfg/"+path;
		return "redirect:/bfg";
	}
	
}
