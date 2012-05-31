package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Brand;
import edu.bupt.spring.service.BrandService;

@Service
public class BrandServiceImpl extends DaoSupport<Brand> implements BrandService {

	public List<Brand> findAll() {
		Query query = em.createQuery("select o from Brand o ");
		return query.getResultList();
	}
	

}
