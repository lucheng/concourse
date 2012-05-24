package edu.bupt.spring.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Content;
import edu.bupt.spring.service.ContentService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service
public class ContentServiceImpl extends DaoSupport<Content> implements ContentService {

    private static final Logger logger = LoggerFactory.getLogger(ContentServiceImpl.class);

}