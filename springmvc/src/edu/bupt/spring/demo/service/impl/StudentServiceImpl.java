package edu.bupt.spring.demo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;


import edu.bupt.spring.demo.dao.DaoSupport;
import edu.bupt.spring.demo.entity.Student;
import edu.bupt.spring.demo.service.StudentService;

@Service
public class StudentServiceImpl extends DaoSupport<Student> implements StudentService {

	public List<Student> findByType(String type) {
		return null;
	}

	

}
