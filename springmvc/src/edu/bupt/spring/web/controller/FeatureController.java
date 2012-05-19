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
import edu.bupt.spring.entity.Feature;
import edu.bupt.spring.service.FeatureService;


/**
 * 
 * @author  linzhe
 * @Date    2012-5-19
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("featureController")
public class FeatureController extends BaseController{

private static final Logger logger = LoggerFactory.getLogger(FeatureController.class);
	
	@Resource(name="featureServiceImpl")
	private FeatureService featureService;
	
	private String name;
	
	private void formQuery(){
		
		if(name != null && !name.trim().equals("")){
			
			jpql.append(" (o.name like ?) ").append(params.size()+1);
			params.add("%"+ name.trim()+ "%");
		}
	}
	
	@RequestMapping("/feature/list")
	public ModelAndView list(String pageSize){
		
		formQuery();
		PageView<Feature> pageView = new PageView<Feature>(15, page);
		QueryResult<Feature> qr = featureService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		
		return new ModelAndView("feature/list").addObject("pageView",pageView);
	}
	
	@RequestMapping(value = "/feature/add")
    public String add(){
        
    	return "feature/add";
    }
    
    @RequestMapping(value = "/feature/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("brand") Feature feature, HttpServletRequest request) {
        
    	logger.info(feature.getId()+"");
    	if(feature.getId() > 0){
    		featureService.update(feature);
    	} else {
    		featureService.save(feature);
    	}
        return "redirect:/feature/list";
    }
    
    @RequestMapping(value = "/feature/edit/{id}", method = {RequestMethod.GET})
    public ModelAndView edit(@PathVariable Integer id, HttpServletRequest request) {
        
        return new ModelAndView("feature/edit").addObject("entity",featureService.find(id));
    }
    
}
