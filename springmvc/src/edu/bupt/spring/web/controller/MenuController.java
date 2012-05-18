package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 * @version 1.0
 */
@Controller("menuController")
public class MenuController {
    
    @RequestMapping(value = "/admin")
    public String index(HttpServletRequest request){
        return "admin";
    }

    @RequestMapping(value = "/menu/setting")
    public String menuSetting(HttpServletRequest request){
        return "menu/setting";
    }
    
    @RequestMapping(value = "/menu/goods")
    public String menuGoods(HttpServletRequest request){
        return "menu/goods";
    }
    
    @RequestMapping(value = "/menu/order")
    public String menuOrder(HttpServletRequest request){
        return "menu/order";
    }
    
    @RequestMapping(value = "/menu/admin")
    public String menuAdmin(HttpServletRequest request){
        return "menu/admin";
    }
    
    @RequestMapping(value = "/menu/content")
    public String menuContent(HttpServletRequest request){
        return "menu/content";
    }
    
    @RequestMapping(value = "/menu/member")
    public String menuMember(HttpServletRequest request){
        return "menu/member";
    }
    
    @RequestMapping(value = "/page/index")
    public String pageIndex(HttpServletRequest request){
        return "page/index";
    }
    
    @RequestMapping(value = "/page/middle")
    public String pageMiddle(HttpServletRequest request){
        return "page/middle";
    }
    
    @RequestMapping(value = "/page/header")
    public String pageHeader(HttpServletRequest request){
        return "page/header";
    }
    
}
