package edu.bupt.spring.web.controller;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.entity.Menu;
import edu.bupt.spring.service.MenuService;
import edu.bupt.spring.utils.SystemConfigUtil;


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
	
    @RequestMapping(value = "/menu/{id}")
    public ModelAndView direct(HttpServletRequest request, @PathVariable Integer id){
    	
    	return new ModelAndView("menu/left").addObject("entry", menuService.find(id));
    }
    
    @RequestMapping(value = "/menu/index")
    public ModelAndView pageIndex(HttpServletRequest request){
    	
    	Properties props = System.getProperties();
        Runtime runtime = Runtime.getRuntime();
        long freeMemoery = runtime.freeMemory();
        long totalMemory = runtime.totalMemory();
        long usedMemory = totalMemory - freeMemoery;
        long maxMemory = runtime.maxMemory();
        long useableMemory = maxMemory - totalMemory + freeMemoery;

//    	SystemConfig systemConfig = SystemConfigUtil.getSystemConfig();
    	
    	return new ModelAndView("menu/index").addObject("systemConfig", SystemConfigUtil.getSystemConfig());
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
