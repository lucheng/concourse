package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.entity.Menu;
import edu.bupt.spring.service.MenuService;


/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 * @version 1.0
 */
@Controller("menuController")
public class MenuController extends BaseController{

	@Autowired
    @Qualifier("menuServiceImpl")
	private MenuService menuService;
	
    /*@RequestMapping(value = "/menu/setting")
    public String menuSetting(HttpServletRequest request){
        return "menu/setting";
    }
    
    @RequestMapping(value = "/menu/product")
    public String menuGoods(HttpServletRequest request){
        return "menu/product";
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
    }*/
    
    @RequestMapping(value = "/menu/{menu}")
    public String direct(HttpServletRequest request, @PathVariable String menu){
    	
        return "menu/"+menu;
    }
    
    @RequestMapping(value = "/menu/index")
    public String pageIndex(HttpServletRequest request){
        return "menu/index";
    }
    
    @RequestMapping(value = "/menu/middle")
    public String pageMiddle(HttpServletRequest request){
        return "menu/middle";
    }
    
    @RequestMapping(value = "/menu/header")
    public ModelAndView pageHeader(HttpServletRequest request){
    	return new ModelAndView("menu/header").addObject("entry", menuService.findFirdLevel());
    }
    
    @RequestMapping(value = "/menu/list")
    public ModelAndView list(HttpServletRequest request){
    	return new ModelAndView("menu/list").addObject("entry", menuService.findFirdLevel());
    }
    
    @RequestMapping(value = "/menu/add")
    public ModelAndView add(){
    	return new ModelAndView("menu/add").addObject("parentCategories", menuService.findFirdLevel());
    }
    
    @RequestMapping(value = "/menu/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("category") Menu menu, @ModelAttribute("parentId")Integer parentId) {
        
    	if(parentId != null && parentId > 0){
    		Menu parent = menuService.find(parentId);
    		menu.setParent(parent);	
    	}
    	
    	if(menu.getId() > 0){
    		menuService.update(menu);
        }else {
        	menuService.save(menu);
        }
        return "redirect:/menu/list";
    }
    
    @RequestMapping(value = "/menu/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Menu menu = menuService.find(id);
    	 
        request.setAttribute("entity", menu);
        request.setAttribute("parentCategories", menuService.findFirdLevel());
        return "menu/add";
    }
    
    @RequestMapping(value = "/menu/menu")
    public ModelAndView menu(HttpServletRequest request){
    	
    	return new ModelAndView("menu/menu").addObject("entry", menuService.findFirdLevel());
    }
}
