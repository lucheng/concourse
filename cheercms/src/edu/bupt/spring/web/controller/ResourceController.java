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
import edu.bupt.spring.entity.Resource;
import edu.bupt.spring.pager.PageParam;
import edu.bupt.spring.pager.PageView;
import edu.bupt.spring.pager.QueryResult;
import edu.bupt.spring.service.ResourceService;

/**
 * 
 * @author  linzhe
 * @Date    2012-6-17
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("resourceController")
public class ResourceController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);
	
	@Autowired
    @Qualifier("resourceServiceImpl")
	private ResourceService resourceService;
	
	@RequestMapping(value = "/resource/list")
    public ModelAndView list(HttpServletRequest request){
		
		pageparam = new PageParam(request);
		PageView<Resource> pageView = new PageView<Resource>(pageparam.getPageSize(), pageparam.getPageNumber());
		QueryResult<Resource> qr = resourceService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), pageparam);
		pageView.setQueryResult(qr);
		return new ModelAndView("resource/list").addObject("pageView", pageView).addObject("pageparam", pageparam);
    }
    
    @RequestMapping(value = "/resource/add", method = {RequestMethod.GET})
    public ModelAndView add(Model model, HttpServletRequest request){
    	
    	return new ModelAndView("resource/input");
    }
    
    @RequestMapping(value = "/resource/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("resource") Resource resource) {
    	
    	resourceService.save(resource);
        return "redirect:/resource/list";
    }
    
    @RequestMapping(value = "/resource/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Resource resource = resourceService.find(id);
		request.setAttribute("entry", resource);
//		request.setAttribute("parentCategories", resourceService.findFirdLevel());
		return "resource/input";
    }
    
    @RequestMapping(value = "/resource/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("resource") Article resource, HttpServletRequest request) {
        
    	resourceService.delete(resource.getId());
        return "redirect:/resource/list";
    }
    
    
}
