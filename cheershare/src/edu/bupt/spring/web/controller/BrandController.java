package edu.bupt.spring.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.base.PageView;
import edu.bupt.spring.base.QueryResult;
import edu.bupt.spring.entity.Brand;
import edu.bupt.spring.service.BrandService;


@Controller
public class BrandController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Resource(name="brandServiceImpl")
	private BrandService brandService;
	
	private String name;
	
	private void formQuery(){
		
		if(name != null && !name.trim().equals("")){
			
			jpql.append(" (o.name like ?) ").append(params.size()+1);
			params.add("%"+ name.trim()+ "%");
		}
	}
	
	@RequestMapping("/brand/list")
	public ModelAndView list(String pageSize){
		
		formQuery();
		PageView<Brand> pageView = new PageView<Brand>(15, page);
		QueryResult<Brand> qr = brandService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		
		return new ModelAndView("brand/list").addObject("pageView",pageView);
	}
	
	@RequestMapping(value = "/brand/add")
    public String add(){
        
    	return "brand/add";
    }
    
    @RequestMapping(value = "/brand/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        
    	logger.info(brand.getId()+"");
    	if(brand.getId() > 0){
    		brandService.update(brand);
    	} else {
    		brandService.save(brand);
    	}
        return "redirect:/brand/list";
    }
    
    @RequestMapping(value = "/brand/edit/{id}", method = {RequestMethod.GET})
    public ModelAndView edit(@PathVariable Integer id, HttpServletRequest request) {
        
        return new ModelAndView("brand/edit").addObject("entity",brandService.find(id));
    }
}
