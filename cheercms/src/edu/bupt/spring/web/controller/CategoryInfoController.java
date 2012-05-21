package edu.bupt.spring.web.controller;

import java.util.List;

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

import edu.bupt.spring.entity.CategoryInfo;
import edu.bupt.spring.service.CategoryInfoService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("categoryController")
public class CategoryInfoController {
    
	private static final Logger logger = LoggerFactory.getLogger(CategoryInfoController.class);
	
	@Autowired
    @Qualifier("categoryInfoServiceImpl")
	private CategoryInfoService categoryInfoService;
	
	@RequestMapping(value = "/category/list")
    public String list(HttpServletRequest request){
    	List<CategoryInfo> list = categoryInfoService.findAll();
    	request.setAttribute("list", list);
        return "category/list";
    }
    
    @RequestMapping(value = "/category/add")
    public String add(Model model){
        
    	return "category/add";
    }
    
    @RequestMapping(value = "/category/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("category") CategoryInfo category, HttpServletRequest request) {
        
        categoryInfoService.save(category);
        return "redirect:/category/list";
    }
    
    @RequestMapping(value = "/category/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	CategoryInfo category = categoryInfoService.find(id);
    	logger.info(category.toString());
        request.setAttribute("entity", category);
        return "category/edit";
    }
    
    @RequestMapping(value = "/category/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("category") CategoryInfo category, HttpServletRequest request) {
        
    	categoryInfoService.update(category);
        return "redirect:/category/list";
    }
    
    
}
