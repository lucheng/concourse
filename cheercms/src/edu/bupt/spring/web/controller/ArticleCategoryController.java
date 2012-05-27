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
import edu.bupt.spring.entity.ArticleCategory;
import edu.bupt.spring.service.ArticleCategoryService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("categoryController")
public class ArticleCategoryController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(ArticleCategoryController.class);
	
	@Autowired
    @Qualifier("articleCategoryServiceImpl")
	private ArticleCategoryService articleCategoryService;
	
	@RequestMapping(value = "/category/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<CategoryInfo> pageView = new PageView<CategoryInfo>(100, page);
		QueryResult<CategoryInfo> qr = categoryInfoService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("category/list").addObject("entity", articleCategoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/category/add")
    public ModelAndView add(){
        
    	return new ModelAndView("category/add").addObject("parentCategories", articleCategoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/category/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("category") ArticleCategory category, @ModelAttribute("parentId")Integer parentId) {
        
    	if(parentId != null && parentId > 0){
    		ArticleCategory parent = articleCategoryService.find(parentId);
    		category.setParent(parent);	
    	}
    	
    	if(category.getId() > 0){
        	articleCategoryService.update(category);
        }else {
        	articleCategoryService.save(category);
        }
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	ArticleCategory category = articleCategoryService.find(id);
    	 
        request.setAttribute("entity", category);
        request.setAttribute("parentCategories", articleCategoryService.findFirdLevel());
        return "category/add";
    }
    
    @RequestMapping(value = "/category/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("category") ArticleCategory category, HttpServletRequest request) {
        
    	articleCategoryService.update(category);
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("category") ArticleCategory category, HttpServletRequest request) {
        
    	articleCategoryService.delete(category.getId());
        return "redirect:/category/list";
    }
    
    
}
