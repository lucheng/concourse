package edu.bupt.spring.service;

import java.util.List;


import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Member;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface MemberService extends DAO<Member> {

	public List<Member> findByType(String type);
}