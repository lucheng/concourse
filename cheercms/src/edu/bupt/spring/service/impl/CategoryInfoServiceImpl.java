package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.CategoryInfo;
import edu.bupt.spring.service.CategoryInfoService;

@Service
public class CategoryInfoServiceImpl extends DaoSupport<CategoryInfo> implements CategoryInfoService {

	public List<CategoryInfo> findAll() {
		Query query = em.createQuery("select o from CategoryInfo o ");
		return query.getResultList();
	}

	

}
