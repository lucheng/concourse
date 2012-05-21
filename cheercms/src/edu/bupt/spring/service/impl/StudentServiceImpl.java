package edu.bupt.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;


import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Student;
import edu.bupt.spring.service.StudentService;

@Service
public class StudentServiceImpl extends DaoSupport<Student> implements StudentService {

	public List<Student> findByType(String type) {
		return null;
	}

	

}
