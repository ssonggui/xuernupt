package com.springmvc.t.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.t.model.Topic;
import com.springmvc.t.server.ITopicReplySer;
import com.springmvc.t.server.ITopicSer;
import com.springmvc.t.util.TopicUtil;

@Controller
@Scope("prototype")
public class CourseContr {
	@Resource
	private ITopicSer topicSer;
	@Resource
	private ITopicReplySer topicreplySer;
	
	@RequestMapping(value="/view/topic/{id}")
	public ModelAndView courseview(@PathVariable("id")String id){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewtopic");
		Topic topic = topicSer.getTopic(id);
		mv.addObject("topic", topic);
		mv.addObject("topicId", topic.getId());
		return mv;
		
	}
	
	@RequestMapping(value="/edit/topic/{id}")
	public ModelAndView editoredit(@PathVariable("id")String id){
		
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("edittopic");
		mv.addObject("topic", topicSer.getTopic(id));
		return mv;
	}
	
	
	@RequestMapping(value="/course")
	public ModelAndView course(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("course");
		int begin = 0;
		for(int i=1;i<8;i++){
			mv.addObject("topics"+i, topicSer.getTopic(i,begin));
		}
		return mv;
		
	}
	
	@RequestMapping(value="/coursepage")	
	public void coursePage(int begin,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("course");
		begin = 0;
		List<Topic> topics1 = topicSer.getTopic(1,begin);
		
		PrintWriter out = null;
		response.setContentType("application/json");
		
		try {
			out = response.getWriter();
			out.write(TopicUtil.toJson(topics1));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
