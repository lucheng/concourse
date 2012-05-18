package edu.bupt.spring.demo.service;

import java.util.List;


import edu.bupt.spring.demo.dao.DAO;
import edu.bupt.spring.demo.entity.ClassInfo;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface ClassInfoService extends DAO<ClassInfo> {

	public List<ClassInfo> findAll();
}
