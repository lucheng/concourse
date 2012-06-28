package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author linzhe
 * @version 1.0
 */
@Controller("settingController")
public class SettingController {
    
//	@Autowired
//    @Qualifier("UserService")
//    private UserService userService;
	
    @RequestMapping(value = "/setting/edit")
    public String edit(HttpServletRequest request){
        return "setting/edit";
    }
    
    
    
}
