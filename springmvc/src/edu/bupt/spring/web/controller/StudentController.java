package edu.bupt.spring.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import edu.bupt.spring.demo.entity.Student;
import edu.bupt.spring.demo.service.StudentService;


@Controller
public class StudentController {
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@RequestMapping("/studentList.form")
	public ModelAndView getStudentList(){
		List<Student> students=studentService.findByType("");
		return new ModelAndView("studentList").addObject("students",students);
	}
}
