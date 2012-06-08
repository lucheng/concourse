package edu.bupt.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bupt.spring.entity.User;
import edu.bupt.spring.service.UserService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("userController")
public class UserController extends BaseController {
    
	@Autowired
    @Qualifier("userServiceImpl")
	private UserService userService;
	
	@RequestMapping(value = "/admin/list")
    public String list(HttpServletRequest request){
    	List<User> list = userService.findAll();
    	request.setAttribute("list", list);
        return "admin/list";
    }
    
    @RequestMapping(value = "/admin/add")
    public String add(Model model){
        
    	return "admin/add";
    }
    
    @RequestMapping(value = "/admin/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("admin") User admin, HttpServletRequest request) {
        
        userService.save(admin);
        return "redirect:/admin/list";
    }
    
    @RequestMapping(value = "/admin/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	User admin = userService.find(id);
        request.setAttribute("entity", admin);
        return "admin/edit";
    }
    
    @RequestMapping(value = "/admin/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("admin") User admin, HttpServletRequest request) {
        
    	userService.update(admin);
        return "redirect:/admin/list";
    }
    
    
}