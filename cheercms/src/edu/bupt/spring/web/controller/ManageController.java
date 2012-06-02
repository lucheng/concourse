package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("manageController")
public class ManageController extends BaseController {
    
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@RequestMapping(value = "/manage/login")
    public ModelAndView login(){
		return new ModelAndView("login");
    }
	
	@RequestMapping(value = "/manage/index")
    public String index(HttpServletRequest request){
		
		
        return "index";
    }
	
	@RequestMapping(value = "/manage/checkLogin", method = {RequestMethod.POST})
    public String checkLogin(@RequestParam("username") String username,
			@RequestParam("password") String password, 
			@RequestParam("isRememberUsername") boolean isRememberUsername, 
			HttpServletRequest request){
    	
        return "redirect:/manage/index";
    }
	
}
