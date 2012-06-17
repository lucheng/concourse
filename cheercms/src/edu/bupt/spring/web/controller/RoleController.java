package edu.bupt.spring.web.controller;

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
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.entity.Article;
import edu.bupt.spring.entity.ArticleCategory;
import edu.bupt.spring.entity.Role;
import edu.bupt.spring.service.RoleService;

/**
 * 
 * @author  linzhe
 * @Date    2012-6-17
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("roleController")
public class RoleController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(RoleController.class);
	
	@Autowired
    @Qualifier("roleServiceImpl")
	private RoleService roleService;
	
	@RequestMapping(value = "/role/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<Article> pageView = new PageView<Article>(100, page);
		QueryResult<Article> qr = articleService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("role/list").addObject("entity", roleService.findAll());
    }
    
    @RequestMapping(value = "/role/add", method = {RequestMethod.GET})
    public ModelAndView add(Model model, HttpServletRequest request){
    	
    	return new ModelAndView("role/input").addObject("entity", roleService.findAll());
    }
    
    @RequestMapping(value = "/role/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("role") Role role, int roleCategory_id) {
    	
    	roleService.save(role);
        return "redirect:/role/list";
    }
    
    @RequestMapping(value = "/role/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Role role = roleService.find(id);
		request.setAttribute("entry", role);
//		request.setAttribute("parentCategories", roleService.findFirdLevel());
		return "role/input";
    }
    
    @RequestMapping(value = "/role/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("role") Article role, HttpServletRequest request) {
        
    	roleService.delete(role.getId());
        return "redirect:/role/list";
    }
    
    
}
