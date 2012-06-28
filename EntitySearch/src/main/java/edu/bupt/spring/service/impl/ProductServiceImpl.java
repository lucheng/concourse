package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Product;
import edu.bupt.spring.entity.Shop;
import edu.bupt.spring.service.ProductService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service
public class ProductServiceImpl extends DaoSupport<Product> implements ProductService {

	public boolean findByNumiid(long numIid) {
		
		Query query = em.createQuery("select o from Product o where num_iid="+ numIid);
		List list = (List<Product>) query.getResultList();
		if(list.size() > 0){
			return true;
		}
		return false;
	}

}