package edu.bupt.spring.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;

import edu.bupt.spring.entity.Student;

/**
 * @@org.springframework.web.servlet.handler.commonsattributes.PathMap("/home.mvc");
 */
public class FreemarkerHomeController extends AbstractCommandController {

	protected ModelAndView handle(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, BindException arg3)
			throws Exception {
		// TODO 自动生成方法存根
		return null;
	}

	protected ModelAndView handleRequestInternal(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		Student stu1 = new Student();
		stu1.setName("gaoxiang1");
		Student stu2 = new Student();
		stu2.setName("gaoxiang2");
		List a = new ArrayList();
		a.add(stu1);
		a.add(stu2);
		System.out.println(a);
		return new ModelAndView("success", "studentList", a);
	}

}