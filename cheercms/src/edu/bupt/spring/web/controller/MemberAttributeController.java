package edu.bupt.spring.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.entity.MemberAttribute;
import edu.bupt.spring.entity.MemberRank;
import edu.bupt.spring.pager.PageParam;
import edu.bupt.spring.pager.PageView;
import edu.bupt.spring.pager.QueryResult;
import edu.bupt.spring.service.MemberAttributeService;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-26
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("memberAttributeController")
public class MemberAttributeController extends BaseController{
    
	@Autowired
    @Qualifier("memberAttributeServiceImpl")
	private MemberAttributeService memberAttributeService;
	
	@RequestMapping(value = "/memberAttribute/list")
    public ModelAndView list(HttpServletRequest request){
		
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		pageparam = new PageParam(request);
		
		PageView<MemberAttribute> pageView = new PageView<MemberAttribute>(pageparam.getPageSize(), pageparam.getPageNumber());
		QueryResult<MemberAttribute> qr = memberAttributeService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), "", pageparam.getQueryParams().toArray(), pageparam.getOrderby());
		pageView.setQueryResult(qr);
		
		
		responseMap.put("pageView", pageView);
		
		return new ModelAndView("memberAttribute/list").addAllObjects(responseMap);
    }
    
    @RequestMapping(value = "/memberAttribute/add", method = {RequestMethod.GET})
    public String add(Model model, HttpServletRequest request){
    	return "memberAttribute/add";
    }
    
    @RequestMapping(value = "/memberAttribute/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	MemberAttribute memberAttribute = memberAttributeService.find(id);
    	 
    	 request.setAttribute("entity", memberAttribute);
         return "memberAttribute/add";
    }
    
    @RequestMapping(value = "/memberAttribute/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("memberAttribute") MemberAttribute memberAttribute) {
    	if(memberAttribute.getId() > 0){
    		memberAttributeService.update(memberAttribute);
        }else {
        	memberAttributeService.save(memberAttribute);
        }
        return "redirect:/memberAttribute/list";
    }
    
    @RequestMapping(value = "/memberAttribute/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("memberAttribute") MemberAttribute memberAttribute, HttpServletRequest request) {
        
    	memberAttributeService.delete(memberAttribute.getId());
        return "redirect:/memberAttribute/list";
    }
    
    
}
