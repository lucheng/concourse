package edu.bupt.spring.service;

import java.util.List;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Admin;
import edu.bupt.spring.entity.ClassInfo;
import edu.bupt.spring.entity.CategoryInfo;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface CategoryInfoService extends DAO<CategoryInfo> {

	public List<CategoryInfo> findAll();
}
