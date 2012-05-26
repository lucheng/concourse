package edu.bupt.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;


import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Member;
import edu.bupt.spring.service.MemberService;

@Service
public class MemberServiceImpl extends DaoSupport<Member> implements MemberService {

	public List<Member> findByType(String type) {
		return null;
	}

	

}
