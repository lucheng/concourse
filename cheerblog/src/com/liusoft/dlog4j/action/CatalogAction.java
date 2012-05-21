/*
 *  CatalogAction.java
 *  
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *  
 *  Author: Winter Lau
 *  http://dlog4j.sourceforge.net
 *  
 */
package com.liusoft.dlog4j.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.liusoft.dlog4j.DLOGSecurityManager;
import com.liusoft.dlog4j.beans.CatalogBean;
import com.liusoft.dlog4j.beans.DiaryBean;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.beans.TypeBean;
import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.dao.CatalogDAO;
import com.liusoft.dlog4j.dao.UserDAO;
import com.liusoft.dlog4j.formbean.CatalogForm;

/**
 * �ռǷ�����ز�����Action��
 * @author liudong
 */
public class CatalogAction extends AdminActionBase {

	final static String CATALOGS = "catalogs";

	/**
	 * ɾ�������ռǷ��������Ȩ��
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doDeleteCatalogUser(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception 			
	{
		CatalogForm catalog = (CatalogForm) form;
		SiteBean site = getSiteBean(request);
		CatalogBean bean = CatalogDAO.getCatalogByID(catalog.getId());
		//���sid��catalog_id�Ƿ��Ӧ
		if(bean!=null && bean.getSite().getId()==site.getId()){
			CatalogDAO.deletePermission(catalog.getId(), catalog.getUserid());
		}
		return makeForward(mapping.findForward("catalog-users"), catalog
				.getSid(), "cat_id", catalog.getId());
	}
	/**
	 * ��ӷ����ռǷ��������Ȩ��
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doCreateCatalogUser(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception 			
	{
		CatalogForm catalog = (CatalogForm) form;
		super.validateClientId(request, catalog);
		ActionMessages msgs = new ActionMessages();
		UserBean loginUser = super.getLoginUserAfterValidateSiteOwner(request);
		//���userid�Ƿ����
		if (catalog.getUserid() < 1
				|| UserDAO.getUserByID(catalog.getUserid()) == null) {
			msgs.add("userid", new ActionMessage("error.user_not_found",
					new Integer(catalog.getUserid())));
		}
		else if(catalog.getUserid()== loginUser.getId()){
			//��������Լ�
		}
		else{
			SiteBean site = getSiteBean(request);
			//���catalog_id�Ƿ���Ч
			CatalogBean bean = CatalogDAO.getCatalogByID(catalog.getId());
			if(bean==null){
				msgs.add("userid", new ActionMessage("error.catalog_not_found",
						new Integer(catalog.getId())));
			}
			//���sid��catalog_id�Ƿ��Ӧ
			else if(bean.getSite().getId()!=site.getId()){
				msgs.add("userid", new ActionMessage("error.catalog_deny",
						new Integer(catalog.getId())));
			}
			else{
				//�ж��Ƿ��Ѿ�����Ȩ����Ϣ
				int role = CatalogDAO.getUserRoleInCatalog(catalog.getId(), catalog.getUserid());
				if(role < 0){
					//������Ȩ��
					CatalogDAO.createPermission(catalog.getId(), catalog
							.getUserid(), catalog.getRole());
				}
				else if (role < catalog.getRole()){
					CatalogDAO.updatePermission(catalog.getId(), catalog
							.getUserid(), catalog.getRole());
				}
			}
		}
		if(!msgs.isEmpty()){
			saveMessages(request, msgs);
			return mapping.findForward("adduser");
		}
		return makeForward(mapping.findForward("catalog-users"), catalog
				.getSid(), "cat_id", catalog.getId());
	}
	/**
	 * �����ռǷ���
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doCreateCatalog(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception 			
	{
		CatalogForm catalog = (CatalogForm)form;
		ActionMessages msgs = new ActionMessages();
		
		if(StringUtils.isEmpty(catalog.getName()))
			msgs.add("name", new ActionMessage("error.empty_not_allowed"));
		else if(DLOGSecurityManager.IllegalGlossary.existIllegalWord(catalog.getName()))
			msgs.add("name", new ActionMessage("error.illegal_glossary"));
		else if(DLOGSecurityManager.IllegalGlossary.existIllegalWord(catalog.getDetail()))
			msgs.add("detail", new ActionMessage("error.illegal_glossary"));
		else{
			SiteBean site = super.getSiteBean(request);
			CatalogBean cbean = new CatalogBean();
			cbean.setName(super.autoFiltrate(site, catalog.getName()));
			if(StringUtils.isNotEmpty(catalog.getDetail())){
				String detail = super.autoFiltrate(site, catalog.getDetail());
				cbean.setDetail(super.filterScriptAndStyle(detail));
			}
			cbean.setType(catalog.getType());
			cbean.setSite(site);
			cbean.setCreateTime(new Date());
			if(catalog.getCatalog()>0){
				cbean.setCatalog(new TypeBean(catalog.getCatalog()));
			}
			try{
				CatalogDAO.create(cbean, catalog.getId(), catalog.getDirection()==1);
			}catch(Exception e){
				msgs.add("catalog", new ActionMessage("error.database", e.getMessage()));
			}			
		}
		
		if(!msgs.isEmpty()){
			saveMessages(request, msgs);
			return mapping.getInputForward();
		}
		return makeForward(mapping.findForward(CATALOGS), catalog.getSid());
	}

	/**
	 * �����ռǷ���
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doUpdateCatalog(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception 			
	{
		CatalogForm catalog = (CatalogForm) form;
		String errMsg = null;

		if (StringUtils.isEmpty(catalog.getName()))
			errMsg = getMessage(request, null, "error.empty_not_allowed");
		else if(DLOGSecurityManager.IllegalGlossary.existIllegalWord(catalog.getName()))
			errMsg = getMessage(request, null, "error.illegal_glossary");
		else if(DLOGSecurityManager.IllegalGlossary.existIllegalWord(catalog.getDetail()))
			errMsg = getMessage(request, null, "error.illegal_glossary");
		else {
			try {
				CatalogBean cbean = CatalogDAO.getCatalogByID(catalog.getId());
				cbean.setName(super.autoFiltrate(cbean.getSite(), catalog.getName()));
				if(StringUtils.isNotEmpty(catalog.getDetail())){
					String detail = super.autoFiltrate(cbean.getSite(), catalog.getDetail());
					cbean.setDetail(super.filterScriptAndStyle(detail));
				}
				cbean.setType(catalog.getType());
				int logCount = CatalogDAO.getDiaryCount(catalog.getId(), false,
						DiaryBean.STATUS_NORMAL);
				cbean.setArticleCount(logCount);
				
				//�����������
				if(catalog.getCatalog()>0){
					if(cbean.getCatalog()==null)
						cbean.setCatalog(new TypeBean(catalog.getCatalog()));
					else if(cbean.getCatalog().getId()!=catalog.getCatalog())
						cbean.setCatalog(new TypeBean(catalog.getCatalog()));						
				}
				else if(cbean.getCatalog()!=null){
					cbean.setCatalog(null);
				}
				
				CatalogDAO.flush();
			} catch (Exception e) {
				errMsg = getMessage(request, null, "error.database", e
						.getMessage());
			}
		}

		ActionForward page = null;
		if(errMsg!=null)
			page = makeForward(mapping.findForward(CATALOGS), catalog
				.getSid(), "cat_id=" + catalog.getId() + "#edit");
		else
			page = makeForward(mapping.findForward(CATALOGS), catalog.getSid());
		return msgbox(mapping, form, request, response, errMsg, page.getPath());
	}

	/**
	 * ɾ���ռǷ���
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response, String s_cat_id)
			throws Exception 
	{
		CatalogForm lform = (CatalogForm)form;
		ActionForward page = makeForward(mapping.findForward(CATALOGS), lform.getSid());
		try{
			int cat_id = Integer.parseInt(s_cat_id);
			//���������Ƿ��б�־Ϊɾ�����ռǻ����ǲݸ�ȣ���������ʾ�û�����ɾ��
			if(CatalogDAO.getDiaryCount(cat_id,true,0)>0){
				String msg = getMessage(request,null,"error.catalog_not_empty");
				return msgbox(mapping,form,request,response,msg,page.getPath());
			}
			CatalogDAO.delete(lform.getSid(), cat_id);
		}catch(Exception e){
			context().log("delete catalog #"+s_cat_id+" failed.", e);
		}
		return page;
	}
	/**
	 * �����ƶ��ռǷ���
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doMoveUp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response, String s_cat_id)
			throws Exception 
	{
		CatalogForm lform = (CatalogForm)form;
		try{
			int cat_id = Integer.parseInt(s_cat_id);
			CatalogDAO.move(getSiteBean(request), cat_id, true);
		}catch(Exception e){
			context().log("move up catalog #"+s_cat_id+" failed.", e);
		}
		return makeForward(mapping.findForward(CATALOGS), lform.getSid());
	}
	/**
	 * �����ƶ��ռǷ���
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doMoveDown(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response, String s_cat_id)
			throws Exception
	{
		CatalogForm lform = (CatalogForm)form;
		try{
			int cat_id = Integer.parseInt(s_cat_id);
			CatalogDAO.move(getSiteBean(request), cat_id, false);
		}catch(Exception e){
			context().log("move up catalog #"+s_cat_id+" failed.", e);
		}
		return makeForward(mapping.findForward(CATALOGS), lform.getSid());
	}

	/**
	 * �ƶ��ռǵ�����ķ��������������
	 * ��Ŀ�������Ϊ-1��ʱ���ƶ���������
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward doMoveToCatalog(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		CatalogForm lform = (CatalogForm)form;
		SiteBean site = getSiteBean(request);
		if(lform.getToCatalog()==-1){
			//move to trash
			CatalogDAO.removeDiary(site, lform.getFromCatalog());
		}
		else if(lform.getToCatalog()>0){
			CatalogBean toCat = CatalogDAO.getCatalogByID(lform.getToCatalog());
			if(toCat!=null && toCat.getSite().getId()==site.getId()){
				CatalogBean fromCat = CatalogDAO.getCatalogByID(lform.getFromCatalog());
				if(fromCat!=null && fromCat.getSite().getId()==site.getId())
					CatalogDAO.moveDiary(site,fromCat,toCat);
			}
		}
		return makeForward(mapping.findForward(CATALOGS), site.getId());
	}
}
