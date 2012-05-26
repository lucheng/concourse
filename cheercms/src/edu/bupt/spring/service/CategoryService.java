package edu.bupt.spring.service;

import java.util.List;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Category;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface CategoryService extends DAO<Category> {

	public List<Category> findAll();
	public List<Category> findFirdLevel();
}
