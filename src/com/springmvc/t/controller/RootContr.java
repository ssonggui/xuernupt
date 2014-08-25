package com.springmvc.t.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.t.model.Page;
import com.springmvc.t.model.UserInfo;
import com.springmvc.t.model.UserList;
import com.springmvc.t.server.IUserInfoSer;
import com.springmvc.t.util.ExlMsgUtil;
import com.springmvc.t.util.PageUtil;
import com.springmvc.t.util.WorkbookUtil;

@Controller

public class RootContr {
	
	@Resource(name="iuserinfoSer")
	private IUserInfoSer iuserinfoSer;
	private List<UserInfo> userlist = null;
	@RequestMapping(value="/root")
	public String Vuser(HttpServletRequest request,Page page,String name){
		int num = 0;
		userlist  = new ArrayList<UserInfo>();
		PageUtil.setRpp(page);
		if(null==name||"".equals(name)){
				num=(int)iuserinfoSer.getTotolNum();
				userlist = iuserinfoSer.getUserBypage(page);
				request.setAttribute("userList", userlist);
		}else{
				num = iuserinfoSer.getTotolNum(name);	
				userlist = iuserinfoSer.getUser(name,page);
				request.setAttribute("userList", userlist);
			}
		PageUtil.setTotolrecord(page,num);
		PageUtil.TotolPage(page);
		if(page.getGopage()!=0){
		if(page.getGopage()>page.getPageNum())page.setCurrentPage(page.getPageNum()-1);else page.setCurrentPage(page.getGopage()-1);
		if(page.getGopage()<0)page.setCurrentPage(0);}
		PageUtil.isHasNext(page);
		PageUtil.isHasPre(page);
		PageUtil.setBeginandSize(page);
		request.setAttribute("page", page);
	//	request.setAttribute("userList", iuserinfoSer.getUserBypage(page));

			
	
		return "root";
	}

	@RequestMapping(value="/root/del")
	public String del(HttpServletRequest request,String[] names){
			request.setAttribute("names", names);
			return "del";
		
	}
	
	@RequestMapping(value="/root/todel")
	public String todel(HttpServletRequest request,String[] names){
		String failure = "删除失败" ;
		String success = "成功删除" ;
		boolean fg = true;
		if(null!=names){
			boolean flag[] = new boolean[names.length];		
			for(int i =0 ;i<names.length;i++){	
				flag[i] = iuserinfoSer.delUser(names[i]);
				if(!flag[i]){
					failure = names[i] +"," + failure;
					fg = fg && flag[i];
					}
				
			}
		}
		if(!fg){request.setAttribute("failure", failure);
			}else{ 
				if(null!=names)
				request.setAttribute("success", success); }
		return "del";
		
	}
	
	@RequestMapping(value="/root/edit")
	public String edit(String[] names,HttpServletRequest request){

		request.setAttribute("names", names);
		return "edit";
	}
	
	@RequestMapping(value="/root/toedit")
	public String toedit(UserList list,HttpServletRequest request){
		String failure = "修改失败" ;
		String success = "成功修改" ;
		boolean fg = true;
		userlist = list.getUsers();
		if(userlist.size()>0){
			boolean flag[] = new boolean[userlist.size()];
			for(int i=0;i<userlist.size();i++){
				flag[i] = iuserinfoSer.editUser(userlist.get(i));
				if(!flag[i]){
					failure = userlist.get(i).getName() +"," + failure;
					fg = fg && flag[i];
					}
			}
		}
		if(!fg){request.setAttribute("failure", failure);
		}else{ 
			if(userlist.size()>0){

				request.setAttribute("success", success);

			}
		} 
		return "edit";
	}
	
	@RequestMapping(value="/root/add")
	public String add(){
		return "add";
	}
	
	@RequestMapping(value="/root/hugeadd")
	public String hugeadd(){
		return "hugeadd";
	}
	
	@RequestMapping(value="/root/addexample")
	public ModelAndView addexample(){
		ModelAndView mv = new ModelAndView(new ExcView());
		return mv;
	}
	
	@RequestMapping(value="/root/tohugeadd")
	public String tohugeadd(HttpServletRequest request,HttpServletResponse response){
		CommonsMultipartResolver cmr = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(cmr.isMultipart(request)){
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			Map<String, MultipartFile> filemap = multipartRequest.getFileMap();
			for(Map.Entry<String, MultipartFile> entry:filemap.entrySet()){
				MultipartFile mf = entry.getValue();
				ExlMsgUtil.setMsg(mf);
				if(ExlMsgUtil.valid()){
						userlist = WorkbookUtil.getUserinfo(WorkbookUtil.getWbook(mf));
						for(UserInfo u:userlist){
							if(iuserinfoSer.checkUser(u.getName())){
								request.setAttribute("exlerrormsg", u.getName()+"在数据库中已经存在！");
								return "hugeadd";
							}
							else{
								iuserinfoSer.addUser(u);
								request.setAttribute("exlerrormsg", ExlMsgUtil.success);
							}
					}
				}else
					request.setAttribute("exlerrormsg", ExlMsgUtil.exlerrormsg);
				
			}
		}
			
		
		return "hugeadd";
	}
	
	

	@RequestMapping(value="/root/toadd")
	public String toAdd(UserList list){
		userlist = list.getUsers();
		for(UserInfo u:userlist){
			iuserinfoSer.addUser(u);
		}
		return "redirect:/root";
	}
	
	

}
