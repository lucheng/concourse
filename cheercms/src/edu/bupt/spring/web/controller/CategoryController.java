package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.entity.Category;
import edu.bupt.spring.service.CategoryService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("categoryController")
public class CategoryController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
    @Qualifier("categoryServiceImpl")
	private CategoryService categoryService;
	
	@RequestMapping(value = "/category/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<CategoryInfo> pageView = new PageView<CategoryInfo>(100, page);
		QueryResult<CategoryInfo> qr = categoryInfoService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("category/list").addObject("entity", categoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/category/add")
    public ModelAndView add(){
        
    	return new ModelAndView("category/add").addObject("parentCategories", categoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/category/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("category") Category category, @ModelAttribute("parentId")Integer parentId) {
        
    	if(parentId != null && parentId > 0){
    		Category parent = categoryService.find(parentId);
    		category.setParent(parent);	
    	}
    	
    	if(category.getId() > 0){
        	categoryService.update(category);
        }else {
        	categoryService.save(category);
        }
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Category category = categoryService.find(id);
    	 
        request.setAttribute("entity", category);
        request.setAttribute("parentCategories", categoryService.findFirdLevel());
        return "category/add";
    }
    
    @RequestMapping(value = "/category/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("category") Category category, HttpServletRequest request) {
        
    	categoryService.update(category);
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("category") Category category, HttpServletRequest request) {
        
    	categoryService.delete(category.getId());
        return "redirect:/category/list";
    }
    
    
}