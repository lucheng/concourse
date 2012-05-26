package edu.bupt.spring.service;

import java.util.List;


import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.MemberRank;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-26
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
public interface MemberRankService extends DAO<MemberRank> {

	public List<MemberRank> findAll();
}
