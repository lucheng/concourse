package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;


import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.ClassInfo;
import edu.bupt.spring.service.ClassInfoService;

@Service
public class CategoryInfoServiceImpl extends DaoSupport<ClassInfo> implements ClassInfoService {

	public List<ClassInfo> findAll() {
		Query query = em.createQuery("select o from CategoryInfo o ");
		return query.getResultList();
	}

	

}
