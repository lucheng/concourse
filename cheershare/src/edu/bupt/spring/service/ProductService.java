package edu.bupt.spring.service;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Product;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface ProductService extends DAO<Product> {

	public boolean findByNumiid(long num_iid);
}