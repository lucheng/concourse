package com.happiness.client.systemMng;

import java.util.ArrayList;
import java.util.List;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.user.client.ui.RootPanel;
import com.happiness.client.common.AppModuleBar;
import com.happiness.client.common.AppTopBar;
import com.happiness.client.orgMng.MemberMngPanel;
import com.smartgwt.client.types.SelectionType;
import com.smartgwt.client.util.DateUtil;
import com.smartgwt.client.widgets.ImgButton;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.ClickHandler;
import com.smartgwt.client.widgets.layout.Layout;
import com.smartgwt.client.widgets.layout.VLayout;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class CopyOfMemberGWT implements EntryPoint {
	
	VLayout main = new VLayout();
	
	private static Layout memberMngPanel;
//	private static Layout logingMngPanel;
//	private static Layout entityEngineMngPanel;
//	private static Layout serviceEngineMngPanel;
//	private static Layout dataFileMngPanel;
//	private static Layout statisticsMngPanel;

	private static ImgButton cachetmngButton = new ImgButton();
	private static ImgButton logingButton = new ImgButton();
	private static ImgButton entityEngineButton = new ImgButton();
	private static ImgButton serviceEngineButton = new ImgButton();
	private static ImgButton dataFileButton = new ImgButton();
	private static ImgButton statisticsButton = new ImgButton();


	public static void showCacheMngPanel() {
		cachetmngButton.select();
		memberMngPanel.setVisible(true);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showLogingMngPanel() {
		logingButton.select();
		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(true);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showEntityEngineMngPanel() {
		entityEngineButton.select();
		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(true);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showServiceEngineMngPanel() {
		serviceEngineButton.select();
		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(true);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showDataFileMngPanel() {
		dataFileButton.select();
		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(true);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showStatisticsPanel() {
		statisticsButton.select();
		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(true);
	}

	public void onModuleLoad() {

		memberMngPanel = new MemberMngPanel();
//		logingMngPanel = new MemberMngPanel();
//		entityEngineMngPanel = new MemberMngPanel();
//		serviceEngineMngPanel = new MemberMngPanel();
//		dataFileMngPanel = new MemberMngPanel();
//		statisticsMngPanel = new MemberMngPanel();

		// #########################################################

		cachetmngButton.setSize("113", "35");
		cachetmngButton.setSrc("openbuy/button/productmng.png");
		cachetmngButton.setPrompt("缓存及调试工具");
		cachetmngButton.setShowDown(false);
		cachetmngButton.setActionType(SelectionType.RADIO);
		cachetmngButton.setRadioGroup("productmngAppButton");
		cachetmngButton.select();
		
		cachetmngButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {

				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showCacheMngPanel();
				}
			}

		});

		logingButton.setSize("113", "35");
		logingButton.setShowRollOver(true);
		logingButton.setSrc("openbuy/button/promotionmng.png");
		logingButton.setPrompt("日志工具");
		logingButton.setShowDown(false);
		logingButton.setActionType(SelectionType.RADIO);
		logingButton.setRadioGroup("productmngAppButton");
		logingButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {
				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showLogingMngPanel();
				}
			}

		});

		entityEngineButton.setSize("113", "35");
		entityEngineButton.setShowRollOver(true);
		entityEngineButton.setSrc("openbuy/button/feature.png");
		entityEngineButton.setPrompt("实体引擎工具");
		entityEngineButton.setShowDown(false);
		entityEngineButton.setActionType(SelectionType.RADIO);
		entityEngineButton.setRadioGroup("productmngAppButton");
		entityEngineButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {
				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showEntityEngineMngPanel();
				}
			}

		});

		serviceEngineButton.setSize("113", "35");
		serviceEngineButton.setShowRollOver(true);
		serviceEngineButton.setSrc("openbuy/button/member.png");
		serviceEngineButton.setPrompt("服务引擎工具");
		serviceEngineButton.setShowDown(false);
		serviceEngineButton.setActionType(SelectionType.RADIO);
		serviceEngineButton.setRadioGroup("productmngAppButton");
		serviceEngineButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {
				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showServiceEngineMngPanel();
				}
			}

		});

		dataFileButton.setSize("113", "35");
		dataFileButton.setShowRollOver(true);
		dataFileButton.setSrc("openbuy/button/ordermng.png");
		dataFileButton.setPrompt("数据文件工具");
		dataFileButton.setShowDown(false);
		dataFileButton.setActionType(SelectionType.RADIO);
		dataFileButton.setRadioGroup("productmngAppButton");
		dataFileButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {
				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showDataFileMngPanel();
				}
			}

		});

		
		statisticsButton.setSize("113", "35");
		statisticsButton.setSrc("openbuy/button/home.png");
		statisticsButton.setPrompt("性能统计工具");
		statisticsButton.setShowDown(false);
		statisticsButton.setActionType(SelectionType.RADIO);
		statisticsButton.setRadioGroup("productmngAppButton");
//		statisticsButton.select();
		statisticsButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {

				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showStatisticsPanel();
				}
			}

		});

	}

	protected void drawPanel(JSONObject permissions, String userId) {

		List<ImgButton> appButtons = new ArrayList<ImgButton>();

		appButtons.add(cachetmngButton);
		appButtons.add(logingButton);
		appButtons.add(serviceEngineButton);
		appButtons.add(entityEngineButton);
		appButtons.add(dataFileButton);
		appButtons.add(statisticsButton);
		
		/*if (permissions == null || permissions.containsKey("FULL_ADMIN")) {
			appButtons.add(cachetmngButton);
			appButtons.add(logingButton);
			appButtons.add(serviceEngineButton);
			appButtons.add(entityEngineButton);
			appButtons.add(dataFileButton);
			appButtons.add(statisticsButton);
		} else {
			if (permissions.containsKey("ANALYSIS_ADMIN"))
				appButtons.add(statisticsButton);
			if (permissions.containsKey("CATALOG_ADMIN"))
				appButtons.add(cachetmngButton);
			if (permissions.containsKey("ORDERMGR_ADMIN"))
				appButtons.add(dataFileButton);
			if (permissions.containsKey("PARTYMGR_ADMIN"))
				appButtons.add(serviceEngineButton);
			if (permissions.containsKey("PROMOTION_ADMIN"))
				appButtons.add(logingButton);
			if (permissions.containsKey("CONFIG_ADMIN"))
				appButtons.add(entityEngineButton);
		}*/

		main.addMember(new AppTopBar(userId));
		main.addMember(new AppModuleBar(appButtons));

		memberMngPanel.setVisible(true);
		main.addMember(memberMngPanel);
		
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);

//		main.addMember(logingMngPanel);
//		main.addMember(serviceEngineMngPanel);
//		main.addMember(entityEngineMngPanel);
//		main.addMember(dataFileMngPanel);
//		main.addMember(statisticsMngPanel);

		// ############################################################

		main.setWidth100();
		main.setHeight100();
		main.draw();

		RootPanel p = RootPanel.get("loadingWrapper");
		if (p != null)
			RootPanel.getBodyElement().removeChild(p.getElement());

		DateUtil.setDefaultDisplayTimezone("00:00");
	}
}
