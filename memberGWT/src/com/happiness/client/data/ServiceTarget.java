package com.happiness.client.data;

import com.google.gwt.core.client.GWT;


public final class ServiceTarget {

  private static String MEMBER = "member/";
  
  public static String FIND_UTIL_CACHE = GWT.getHostPageBaseURL() + MEMBER + "findUtilCache";
  public static String CLEAR_CACHE_BY_NAME = GWT.getHostPageBaseURL() + MEMBER + "clearCacheByName";
  public static String EDIT_UTIL_CACHE = GWT.getHostPageBaseURL() + MEMBER + "editUtilCache";
  public static String EDIT_UTIL_CACHE_UPDATE = GWT.getHostPageBaseURL() + MEMBER + "editUtilCacheUpdate";
  
}
