package edu.bupt.spring.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Tag;
import edu.bupt.spring.service.TagService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service
public class TagServiceImpl extends DaoSupport<Tag> implements TagService {

    private static final Logger logger = LoggerFactory.getLogger(TagServiceImpl.class);

}