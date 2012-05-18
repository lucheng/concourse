package edu.bupt.spring.demo.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;


import edu.bupt.spring.demo.dao.DaoSupport;
import edu.bupt.spring.demo.entity.ClassInfo;
import edu.bupt.spring.demo.service.ClassInfoService;

@Service
public class ClassInfoServiceImpl extends DaoSupport<ClassInfo> implements ClassInfoService {

	public List<ClassInfo> findAll() {
		Query query = em.createQuery("select o from ClassInfo o ");
		return query.getResultList();
	}

	

}
