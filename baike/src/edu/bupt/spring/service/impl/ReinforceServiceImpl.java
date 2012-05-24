package edu.bupt.spring.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Reinforce;
import edu.bupt.spring.service.ReinforceService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service
public class ReinforceServiceImpl extends DaoSupport<Reinforce> implements ReinforceService {

    private static final Logger logger = LoggerFactory.getLogger(ReinforceServiceImpl.class);

}