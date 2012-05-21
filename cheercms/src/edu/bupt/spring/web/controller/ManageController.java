package edu.bupt.spring.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.bupt.spring.entity.Admin;
import edu.bupt.spring.service.AdminService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("manageController")
public class ManageController {
    
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Autowired
    @Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	
	@RequestMapping(value = "/login")
    public String login(HttpServletRequest request){

        return "login";
    }
	
	@RequestMapping(value = "/manage")
    public String index(HttpServletRequest request){

        return "index";
    }
	
	@RequestMapping(value = "/checkLogin", method = {RequestMethod.POST})
    public String checkLogin(@RequestParam("username") String username,
			@RequestParam("password") String password, 
			@RequestParam("isRememberUsername") boolean isRememberUsername, 
			HttpServletRequest request){
    	
		/*Admin loginAdmin = adminService.checkLogin(username, password);
		
		if(loginAdmin == null){
			return "error_all";
		}
		if(isRememberUsername){
			
		}
		request.getSession().setAttribute("loginAdmin", loginAdmin);*/
        return "redirect:/manage";
    }
	
}
