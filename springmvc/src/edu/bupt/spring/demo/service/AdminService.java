package edu.bupt.spring.demo.service;

import java.util.List;


import edu.bupt.spring.demo.dao.DAO;
import edu.bupt.spring.demo.entity.Admin;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface AdminService extends DAO<Admin> {

	public List<Admin> findByType(String type);
}