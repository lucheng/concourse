package com.hs.utils;

import org.hibernate.Session;

public interface HibetnateCallBack {
	
	//该接口用来实现动态更新
	
	public Object doInHibernate(Session session)throws Exception;

}
