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
import edu.bupt.spring.entity.Brand;
import edu.bupt.spring.service.BrandService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("brandController")
public class BrandController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Autowired
    @Qualifier("brandServiceImpl")
	private BrandService brandService;
	
	
	@RequestMapping(value = "/brand/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<Article> pageView = new PageView<Article>(100, page);
		QueryResult<Article> qr = articleService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("brand/list").addObject("entity", brandService.findAll());
    }
    
    @RequestMapping(value = "/brand/add", method = {RequestMethod.GET})
    public String add(Model model, HttpServletRequest request){
    	return "brand/input";
    }
    
    @RequestMapping(value = "/brand/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("brand") Brand brand) {
    	if(brand.getId() > 0){
    		brandService.update(brand);
        }else {
        	brandService.save(brand);
        }
        return "redirect:/article/list";
    }
    
    @RequestMapping(value = "/brand/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Brand brand = brandService.find(id);
    	 
    	 request.setAttribute("entity", brand);
         return "brand/input";
    }
    
    @RequestMapping(value = "/brand/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        
    	brandService.update(brand);
        return "redirect:/brand/list";
    }
    
    @RequestMapping(value = "/brand/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        
    	brandService.delete(brand.getId());
        return "redirect:/brand/list";
    }
    
    
}
