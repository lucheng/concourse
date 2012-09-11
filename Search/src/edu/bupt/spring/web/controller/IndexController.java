package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ICTCLAS.kevin.zhang.CWSTagger;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-26
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Controller("indexController")
public class IndexController extends BaseController {
    
    @RequestMapping(value = "/view")
    public ModelAndView view(HttpServletRequest request){
    	
    	CWSTagger tagger = new CWSTagger();
    	String test = tagger.tag("张华平2009年底调入北京理工大学计算机学院。", 1);
        return new ModelAndView("view").addObject("entity", test);
    }
    
    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request){
    	
    	CWSTagger tagger = new CWSTagger();
    	String test = tagger.tag("张华平2009年底调入北京理工大学计算机学院。", 1);
        return new ModelAndView("index").addObject("entity", test);
    }
    
}
