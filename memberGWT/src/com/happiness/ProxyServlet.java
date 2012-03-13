package com.happiness;
/**
 *    Copyright 2009 Stou Sandalski (Siafoo.net)
 *    Copyright 1999-2008 The Apache Software Foundation
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 * 
 */


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

public class ProxyServlet extends HttpServlet {

    /**
     * 
     */
    private static final long serialVersionUID = 9L;

    private static  String targetServer = "http://127.0.0.1:8080/member";
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp, false);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp, true);
    }
    
    @SuppressWarnings("unchecked")
    protected void handleRequest(HttpServletRequest req, HttpServletResponse resp, boolean isPost) throws ServletException, IOException {

        HttpClient httpclient = new DefaultHttpClient();
        
        StringBuffer sb = new StringBuffer();
        /*if(req.getRequestURI().indexOf("html")>0){
          targetServer=req.getRequestURL().toString();
        }*/
        
        sb.append(targetServer);
        sb.append(req.getRequestURI());
        
        
        if(req.getQueryString() != null){
            sb.append("?" + req.getQueryString());
        }
        System.out.println("Proxy pass URL to:"+sb);
        HttpRequestBase targetRequest = null;
        
        if(isPost){
            HttpPost post = new HttpPost(sb.toString());
            
            Enumeration<String> paramNames = req.getParameterNames();

            String paramName = null;
            
            List <NameValuePair> params = new ArrayList <NameValuePair>();
            
            while(paramNames.hasMoreElements()){
                paramName = paramNames.nextElement();
                params.add(new BasicNameValuePair(paramName, req.getParameterValues(paramName)[0]));
            }
            
            post.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            targetRequest = post;
        }else{
            HttpGet get = new HttpGet(sb.toString());
            targetRequest = get;
        }

//        // This copies the headers but I never really cared to get it to work properly
//        System.out.println("Request Headers");
//        Enumeration<String> headerNames = req.getHeaderNames();
//        String headerName = null;
//        while(headerNames.hasMoreElements()){
//            headerName = headerNames.nextElement();
//            targetRequest.addHeader(headerName, req.getHeader(headerName));
//            System.out.println(headerName + " : " + req.getHeader(headerName));
//        }

        HttpResponse targetResponse = httpclient.execute(targetRequest);
        HttpEntity entity = targetResponse.getEntity();
        
        // Send the Response
        InputStream input = entity.getContent();
        OutputStream output = resp.getOutputStream();
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(input));
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(output));
        String line = reader.readLine();
        
        while(line != null){
            writer.write(line + "\n");
            line = reader.readLine();
        }

        reader.close();
        writer.close();
        httpclient.getConnectionManager().shutdown();
    }
    
}


