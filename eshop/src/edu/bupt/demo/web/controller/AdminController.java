package edu.bupt.demo.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bupt.common.Constants;
import edu.bupt.demo.model.Admin;
import edu.bupt.demo.service.AdminService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("adminController")
public class AdminController {
    
	@Autowired
    @Qualifier("AdminService")
    private AdminService userService;
	
    @RequestMapping(value = "/admin/list")
    public String list(HttpServletRequest request){
    	
        return "admin/list";
    }
    
    @RequestMapping(value = "/admin/add")
    public String add(Model model){
        
    	/*if(!model.containsAttribute(Constants.COMMAND)) {
            model.addAttribute(Constants.COMMAND, new UserModel());
        }
        setCommonData(model);*/
    	return "admin/add";
    }
    
    @RequestMapping(value = "/admin/save", method = {RequestMethod.POST})
    public String save(Model model, @ModelAttribute("command") @Valid Admin command, BindingResult result) {
        
        //如果有验证错误 返回到form页面
        if(result.hasErrors()) {
            model.addAttribute(Constants.COMMAND, command);
            return add(model);
        }
         userService.save(command);
        return "redirect:/user/success";
    }
    
}
