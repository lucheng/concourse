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

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.base.PageView;
import edu.bupt.spring.base.QueryResult;
import edu.bupt.spring.entity.CategoryInfo;
import edu.bupt.spring.service.CategoryInfoService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("categoryController")
public class CategoryInfoController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(CategoryInfoController.class);
	
	@Autowired
    @Qualifier("categoryInfoServiceImpl")
	private CategoryInfoService categoryInfoService;
	
	@RequestMapping(value = "/category/list")
    public ModelAndView list(HttpServletRequest request){
		
		PageView<CategoryInfo> pageView = new PageView<CategoryInfo>(10, page);
		QueryResult<CategoryInfo> qr = categoryInfoService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), jpql.toString(), queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);
		
		return new ModelAndView("category/list").addObject("pageView",pageView);
    }
    
    @RequestMapping(value = "/category/add")
    public ModelAndView add(){
        
    	return new ModelAndView("category/add").addObject("parentCategories", categoryInfoService.findFirdLevel());
    }
    
    @RequestMapping(value = "/category/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("category") CategoryInfo category, @ModelAttribute("parentId")int parentId, HttpServletRequest request) {
        
    	CategoryInfo parent = categoryInfoService.find(parentId);
    	category.setParent(parent);
    	
    	if(category.getId() > 0){
        	categoryInfoService.update(category);
        }else {
        	categoryInfoService.save(category);
        }
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	CategoryInfo category = categoryInfoService.find(id);
    	logger.info(category.toString());
        request.setAttribute("entity", category);
        return "category/add";
    }
    
    @RequestMapping(value = "/category/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("category") CategoryInfo category, HttpServletRequest request) {
        
    	categoryInfoService.update(category);
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("category") CategoryInfo category, HttpServletRequest request) {
        
    	categoryInfoService.delete(category.getId());
        return "redirect:/category/list";
    }
    
    
}
