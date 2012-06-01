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

import edu.bupt.spring.entity.ArticleCategory;
import edu.bupt.spring.entity.ProductCategory;
import edu.bupt.spring.service.ProductCategoryService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("productCategoryController")
public class ProductCategoryController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(ProductCategoryController.class);
	
	@Autowired
    @Qualifier("productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	
	@RequestMapping(value = "/productCategory/checkSign", method = {RequestMethod.GET})
    @ResponseBody
	public boolean checkSign(HttpServletRequest request){
		
		String sign = (String) request.getParameter("sign");
		return productCategoryService.checkSign(sign);
    }
	
	@RequestMapping(value = "/productCategory/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<CategoryInfo> pageView = new PageView<CategoryInfo>(100, page);
		QueryResult<CategoryInfo> qr = categoryInfoService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("productCategory/list").addObject("entry", productCategoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/productCategory/add")
    public ModelAndView add(){
    	return new ModelAndView("productCategory/input").addObject("parentCategories", productCategoryService.findFirdLevel());
    }
    
    @RequestMapping(value = "/productCategory/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("productCategory") ProductCategory productCategory, @ModelAttribute("parentId")Integer parentId) {
        
    	if(parentId != null && parentId > 0){
    		ProductCategory parent = productCategoryService.find(parentId);
    		productCategory.setParent(parent);	
    	}
    	
    	if(productCategory.getId() > 0){
    		productCategoryService.update(productCategory);
        }else {
        	productCategoryService.save(productCategory);
        }
        return "redirect:/productCategory/list";
    }
    
    @RequestMapping(value = "/productCategory/edit/{id}", method = {RequestMethod.GET})
    public ModelAndView edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Map<String, Object> modelMap = new HashMap<String, Object>();
    	
    	modelMap.put("entry", productCategoryService.find(id));
    	modelMap.put("parentCategories", productCategoryService.findFirdLevel());
        
        return new ModelAndView("productCategory/input").addAllObjects(modelMap);
    }
    
    @RequestMapping(value = "/productCategory/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("productCategory") ProductCategory productCategory, HttpServletRequest request) {
        
    	productCategoryService.update(productCategory);
        return "redirect:/productCategory/list";
    }
    
    @RequestMapping(value = "/productCategory/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("productCategory") ProductCategory productCategory, HttpServletRequest request) {
        
    	productCategoryService.delete(productCategory.getId());
        return "redirect:/productCategory/list";
    }
    
    
}
