package edu.bupt.spring.web.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
@Controller("articleCategoryController")
public class ArticleCategoryController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(ArticleCategoryController.class);
	
	@Autowired
    @Qualifier("articleCategoryServiceImpl")
	private ArticleCategoryService articleCategoryService;
	
	@RequestMapping(value = "/articleCategory/checkSign", method = {RequestMethod.GET})
    @ResponseBody
	public boolean checkSign(HttpServletRequest request){
		
		String sign = (String) request.getParameter("sign");
		return articleCategoryService.checkSign(sign);
    }
	
	@RequestMapping(value = "/articleCategory/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<CategoryInfo> pageView = new PageView<CategoryInfo>(100, page);
		QueryResult<CategoryInfo> qr = categoryInfoService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("articleCategory/list").addObject("entry", articleCategoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/articleCategory/add")
    public ModelAndView add(){
    	return new ModelAndView("articleCategory/input").addObject("parentCategories", articleCategoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/articleCategory/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("articleCategory") ArticleCategory articleCategory, @ModelAttribute("parentId")Integer parentId) {
        
    	if(parentId != null && parentId > 0){
    		ArticleCategory parent = articleCategoryService.find(parentId);
    		articleCategory.setParent(parent);	
    	}
    	
    	if(articleCategory.getId() > 0){
        	articleCategoryService.update(articleCategory);
        }else {
        	articleCategoryService.save(articleCategory);
        }
        return "redirect:/articleCategory/list";
    }
    
    @RequestMapping(value = "/articleCategory/edit/{id}", method = {RequestMethod.GET})
    public ModelAndView edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Map<String, Object> modelMap = new HashMap<String, Object>();
    	
    	modelMap.put("entry", articleCategoryService.find(id));
    	modelMap.put("parentCategories", articleCategoryService.findFirdLevel());
        
        return new ModelAndView("articleCategory/input").addAllObjects(modelMap);
    }
    
    @RequestMapping(value = "/articleCategory/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("articleCategory") ArticleCategory articleCategory, HttpServletRequest request) {
        
    	articleCategoryService.update(articleCategory);
        return "redirect:/articleCategory/list";
    }
    
    @RequestMapping(value = "/articleCategory/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("articleCategory") ArticleCategory articleCategory, HttpServletRequest request) {
        
    	articleCategoryService.delete(articleCategory.getId());
        return "redirect:/articleCategory/list";
    }
    
    
}
