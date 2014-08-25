package com.springmvc.t.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.t.model.Topic;
import com.springmvc.t.model.TopicReply;
import com.springmvc.t.server.ITopicReplySer;
import com.springmvc.t.server.ITopicSer;

@Controller
@Scope("prototype")
public class TopicEditorContr {
	@Resource
	private ITopicSer topicSer;
	@Resource
	private ITopicReplySer topicreplySer;
	private Topic topic =null;
	/**
	 * Topic 编辑器界面
	 * 
	 */
	@RequestMapping(value="/topiceditor")
	public ModelAndView editorWel(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("topiceditor");
		return mv;
	}
	/**
	 * Topic 增加
	 * 
	 */
	@RequestMapping(value="/addtopic")
	public ModelAndView editorAdd(Topic topic,@CookieValue(value="loginname", defaultValue="null")String name){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/topiceditor");
		if(topicSer.check(topic))			
		 topicSer.addTopic(topic,name);

		return mv;
	}

	@RequestMapping(value="/updatetopic/{id}")
	public ModelAndView editoredit(@PathVariable("id")String id,Topic topic,@CookieValue(value="loginname", defaultValue="null")String name){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/view/topic/"+id);
		if("".equals(topic.getContent())||null==topic.getContent())
			return mv;
		else
			topicSer.editTopic(topic,id);

		return mv;
	}
	
	@RequestMapping(value="/loadtopic")
	public ModelAndView editorLoad(String topicId){
		topic = topicSer.getTopic(topicId);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("topiceditor");
		mv.addObject("topic",topic);
		return mv;
	}
	
	/**
	 * 
	 * @param topic
	 * @param name
	 * @return
	 */
	@RequestMapping(value="/addtopicreply")
	public ModelAndView replyAdd(TopicReply topicreply,@CookieValue(value="loginname", defaultValue="null")String name,HttpSession session){
		String path = (String)session.getAttribute("sessionpath");
		String topicId = path.replace("/view/topic/", "");
		topicreplySer.addTopicReply(topicreply,name,topicId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/"+path);
		return mv;
	}
}
