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

import edu.bupt.spring.base.PageView;
import edu.bupt.spring.base.QueryResult;
import edu.bupt.spring.entity.Member;
import edu.bupt.spring.service.MemberRankService;
import edu.bupt.spring.service.MemberService;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-26
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("memberController")
public class MemberController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
    @Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
    @Qualifier("memberRankServiceImpl")
	private MemberRankService memberRankService;
	
	@RequestMapping(value = "/member/list")
    public ModelAndView list(int pageSize){
		
		PageView<Member> pageView = new PageView<Member>(pageSize, pageNumber);
		QueryResult<Member> qr = memberService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " ", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);
		
		return new ModelAndView("member/list").addObject("pageView", pageView);
    }
    
    @RequestMapping(value = "/member/add", method = {RequestMethod.GET})
    public String add(Model model, HttpServletRequest request){
    	request.setAttribute("parentCategories", memberRankService.findAll());	
    	return "article/add";
    }
    
    @RequestMapping(value = "/member/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Member member = memberService.find(id);
    	 
    	 request.setAttribute("entity", member);
    	 request.setAttribute("parentCategories", memberRankService.findAll());
         return "member/add";
    }
    
    @RequestMapping(value = "/member/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("member") Member member) {
    	if(member.getId() > 0){
    		memberService.update(member);
        }else {
        	memberService.save(member);
        }
        return "redirect:/member/list";
    }
    
    @RequestMapping(value = "/member/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("member") Member member, HttpServletRequest request) {
        
    	memberService.delete(member.getId());
        return "redirect:/member/list";
    }
    
    
}
