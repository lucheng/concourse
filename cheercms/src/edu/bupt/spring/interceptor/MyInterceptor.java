package edu.bupt.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.entity.User;

/**
 * 
 * @author linzhe
 * @Date   2012-5-18
 * @email  m23linzhe@gmail.com
 * @qq     398024808
 */
public class MyInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
		User loginAdmin = (User)request.getSession().getAttribute("loginAdmin");
		if(loginAdmin == null){
			return false;
		}
		return true;
	}

}
