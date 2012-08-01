/**
 * Copyright    : Copyright(C) 2000-2009. HIT-CIR. All Rights Reserved
 * File Summary : AutoSuggest Servlet
 * Author       : Fandywang 
 * Create time  : 2009-12-13
 * Project Name : yuetan
 * Version      : 1.0
 */
package edu.hit.irlab.yuetan.autosuggest.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hit.irlab.yuetan.autosuggest.AutoSuggest;

/**
 * The Class AutoSuggestServlet.
 * 
 * @author Fandywang
 */
public class AutoSuggestServlet extends HttpServlet {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The as. */
	private static AutoSuggest as;

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() {
		as = new AutoSuggest();
	}
	
	/**
	 * Handle the request and return the result content.
	 * 
	 * @param request the request
	 * @param response the response
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) {
		// get the request text
		String request_text = getRequestText(request);
        
		ArrayList<String> result = null;
		if (request_text != null && request_text.length() > 0 )
		{// get the result
			result = getReturnContent(request_text);
		}
		// send the result
		//sendContent(response, returnmsg);
		if( result != null && result.size() > 0 )
		{
			for (int i = 0; i < result.size(); i++) {
				request.setAttribute("key" + i, result.get(i));
			}
		}
		
	    try {
			request.getRequestDispatcher("./keysxml.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * Handle the request and return the result content.
	 * 
	 * @param request the request
	 * @param response the response
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) {
		doGet(request, response);
	}

	/**
	 * Get the request text and do preprocessing.
	 * 
	 * @param request the request
	 * 
	 * @return the requestext
	 */
	private String getRequestText(HttpServletRequest request) {
		try {
			String text = URLDecoder.decode(request.getParameter("word"), "UTF-8");
			text = text.trim();
			return text;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Get the result.
	 * 
	 * @param request_text the request_text
	 * 
	 * @return result
	 */
	private ArrayList<String> getReturnContent(String request_text) {
		return as.find(request_text);
	}
	
	/**
	 * Send the result.
	 * 
	 * @param response the response
	 * @param sendcontent the sendcontent
	 */
	/*
	private void sendContent(HttpServletResponse response, String sendcontent) {
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		 
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println(sendcontent);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
}
