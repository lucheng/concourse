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

import edu.bupt.spring.entity.MemberRank;
import edu.bupt.spring.pager.PageParam;
import edu.bupt.spring.pager.PageView;
import edu.bupt.spring.pager.QueryResult;
import edu.bupt.spring.service.MemberRankService;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-26
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("memberRankController")
public class MemberRankController extends BaseController{
    
	@Autowired
    @Qualifier("memberRankServiceImpl")
	private MemberRankService memberRankService;
	
	@RequestMapping(value = "/memberRank/list")
    public ModelAndView list(HttpServletRequest request){
		
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		pageparam = new PageParam(request);
		
		PageView<MemberRank> pageView = new PageView<MemberRank>(pageparam.getPageSize(), pageparam.getPageNumber());
		QueryResult<MemberRank> qr = memberRankService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), "", pageparam.getQueryParams().toArray(), pageparam.getOrderby());
		pageView.setQueryResult(qr);
		
		
		responseMap.put("pageView", pageView);
		
		return new ModelAndView("memberRank/list").addAllObjects(responseMap);
    }
    
    @RequestMapping(value = "/memberRank/add", method = {RequestMethod.GET})
    public String add(Model model, HttpServletRequest request){
    	return "memberRank/add";
    }
    
    @RequestMapping(value = "/memberRank/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	MemberRank memberRank = memberRankService.find(id);
    	 
    	 request.setAttribute("entity", memberRank);
         return "memberRank/add";
    }
    
    @RequestMapping(value = "/memberRank/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("memberRank") MemberRank memberRank) {
    	if(memberRank.getId() > 0){
    		memberRankService.update(memberRank);
        }else {
        	memberRankService.save(memberRank);
        }
        return "redirect:/memberRank/list";
    }
    
    @RequestMapping(value = "/memberRank/delete/{id}", method = {RequestMethod.POST})
    public String delete(@ModelAttribute("memberRank") MemberRank memberRank, HttpServletRequest request) {
        
    	memberRankService.delete(memberRank.getId());
        return "redirect:/memberRank/list";
    }
    
    
}
