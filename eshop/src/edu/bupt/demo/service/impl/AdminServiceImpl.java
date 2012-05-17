package edu.bupt.demo.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.bupt.common.dao.DaoSupport;
import edu.bupt.demo.model.Admin;
import edu.bupt.demo.service.AdminService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service("AdminService")
public class AdminServiceImpl extends DaoSupport<Admin> implements AdminService {

    private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	public List<Admin> findByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

   
}