package edu.bupt.spring.service;

import java.util.List;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.ProductCategory;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface ProductCategoryService extends DAO<ProductCategory> {

	public List<ProductCategory> findAll();
	public List<ProductCategory> findFirdLevel();
	public boolean checkSign(String sign);
}
