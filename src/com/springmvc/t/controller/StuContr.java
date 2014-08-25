package com.springmvc.t.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.t.model.UserInfo;
import com.springmvc.t.server.IUserInfoSer;

@Controller
@Scope("prototype")
public class StuContr {
	
	@Resource(name="iuserinfoSer")
	private IUserInfoSer iuserinfoSer;

	@RequestMapping(value="")
	public String index(){
		return "redirect:/index";		
	}
	@RequestMapping(value="/")
	public String ind(){
		return "redirect:/index";		
	}

	@RequestMapping(value="/index")
	public String inde(){
		return "index";		
	}
	
	@RequestMapping(value="/login")
	public String Login(){
		return "login";		
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session,@CookieValue(value="loginname", defaultValue="null")String loginname,@CookieValue(value="loginpwd", defaultValue="null")String loginpwd,HttpServletResponse response){
		if("null".equals(loginname)||"null".equals(loginpwd)){
			
		}else{
			Cookie namecookie = new Cookie("loginname",null);
			Cookie pwdcookie = new Cookie("loginpwd",null);
			namecookie.setMaxAge(0);
			pwdcookie.setMaxAge(0);
//			namecookie.setPath("/9/xuernupt");
//			pwdcookie.setPath("/9/xuernupt");
			response.addCookie(namecookie);
			response.addCookie(pwdcookie);
		}
		String sessionpath =(String) session.getAttribute("sessionpath");
		if(sessionpath!=null && !sessionpath.contains("/bfg")){
			return "redirect:"+sessionpath.replace(".jsp", "/");
		}
		return "redirect:/";
			   
	}
	
	
//	
//	@RequestMapping(value="/login1")
//	public String Login1(@ModelAttribute("user") UserModel user,HttpServletRequest request ){
//		if(user.getName().equals(user.getPasswd())){
//			request.setAttribute("message", "密码错误");
//			return "login";
//		}else{
//			request.setAttribute("message",user.getName() );
//			return "home";
//		}
//			
//			
//	}
	
	@RequestMapping(value="/check")
	public void Ckeck(@RequestParam("name") String name,HttpServletResponse response ){
		//String result = "{\"name\":\"}";
		String a = "1";
		
		
		if("root".equals(name)||iuserinfoSer.checkUser(name)){
			a="0";
			
		}
		PrintWriter out = null;
		response.setContentType("application/json");
		String result = "{\"name\":"+ a+"}";
		
		try {
			out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/checkpasswd")
	public String CkeckPasswd(@CookieValue(value="loginname", defaultValue="null")String loginname,@CookieValue(value="loginpwd", 
	defaultValue="null")String loginpwd,String name,String passwd,String autologin,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException{
		if("root".equals(name)&&"root".equals(passwd)){
			
			return "redirect:/root";
		}
		if(iuserinfoSer.checkPasswd(name, passwd)){
			
			if("null".equals(loginname)||"null".equals(loginpwd)||!name.equals(loginname)||!name.equals(passwd)){
				Cookie namecookie = new Cookie("loginname",URLEncoder.encode(name,"UTF-8"));
				Cookie pwdcookie = new Cookie("loginpwd",passwd);

				if(null!=autologin){
					namecookie.setMaxAge(3600*24);				
					pwdcookie.setMaxAge(3600*24);
				}
//				namecookie.setPath("/9/xuernupt");
//				pwdcookie.setPath("/9/xuernupt");
				response.addCookie(namecookie);
				response.addCookie(pwdcookie);
			}
			//String sessionpath =(String) request.getSession().getAttribute("sessionpath");
			String sessionpath = (String)session.getAttribute("sessionpath");
			if(sessionpath!=null){
				return "redirect:"+sessionpath.replace(".jsp", "/");
			}
			return "redirect:/";			
		}else{ 
			if(name==null||passwd==null)return "redirect:login";
				request.setAttribute("passwdmsg", "密码错误");
				return "login";
			}			
	}

	@RequestMapping(value="/Rg")
	public String Rg(){
		
		return "btRg";
	}
	
	@RequestMapping(value="/rgover")
	public String Rgover(UserInfo user){
		
		iuserinfoSer.addUser(user);
		System.out.println("1");
		return "rgover";
	}
	
	@RequestMapping(value="/revisepasswd")
	public String InStu(){
		
		return "revisepasswd";
	}
	@RequestMapping(value="/update")
	public String Update(UserInfo u,HttpServletRequest request ){
		if(null==u.getIdcard()||null==u.getName()||null==u.getPasswd())return "input";
		if(iuserinfoSer.checkUserIdcard(u.getName(),u.getIdcard())){
			if(iuserinfoSer.updateUser(u)){
				request.setAttribute("successmsg", "用户\""+u.getName()+"\"修改密码成功，");
				return "revisepasswd";}
			else
				return "error";
		}
		request.setAttribute("msg", "用户名或身份证有问题，请检查");
		return "revisepasswd";
	}

}
