package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bupt.spring.demo.entity.Admin;
import edu.bupt.spring.demo.service.AdminService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("adminController")
public class AdminController {
    
	@Autowired
    @Qualifier("adminServiceImpl")
//	@Resource(name="memberServiceBean")
	private AdminService adminService;
//    @Resource(name="memberServiceBean")private MemberService memberService;
	
	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping(value = "/admin/list")
    public String list(HttpServletRequest request){
    	
        return "admin/list";
    }
    
    @RequestMapping(value = "/admin/add")
    public String add(Model model){
        
    	return "admin/add";
    }
    
    @RequestMapping(value = "/admin/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("admin") Admin admin) {
//    public String save(@RequestBody Admin admin) {
        
        //如果有验证错误 返回到form页面
        System.out.println("admin:" + admin.getUsername());
        System.out.println("admin:" + admin.getEmail());
        System.out.println("admin:" + admin.getId());
//        adminService.save(admin);
        return "redirect:/user/success";
    }
    
}
