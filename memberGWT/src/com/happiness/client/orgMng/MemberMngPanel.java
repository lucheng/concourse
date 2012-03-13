package com.happiness.client.orgMng;

import com.happiness.client.orgMng.card.MemberListPanel;
import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.types.VisibilityMode;
import com.smartgwt.client.widgets.grid.ListGrid;
import com.smartgwt.client.widgets.grid.ListGridField;
import com.smartgwt.client.widgets.grid.ListGridRecord;
import com.smartgwt.client.widgets.grid.events.RecordClickEvent;
import com.smartgwt.client.widgets.grid.events.RecordClickHandler;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.SectionStack;
import com.smartgwt.client.widgets.layout.SectionStackSection;
import com.smartgwt.client.widgets.layout.VLayout;

public class MemberMngPanel extends HLayout {

	MemberListPanel memberOperate;
	
	public MemberMngPanel() {
		
		setWidth100();
		setHeight100();
		
		VLayout sideLayout = new VLayout();
		sideLayout.setWidth("15%");
		sideLayout.setHeight100();
		sideLayout.setShowResizeBar(true);

		SectionStack sectionStack = new SectionStack();
		sectionStack.setVisibilityMode(VisibilityMode.MULTIPLE);
		sectionStack.setAnimateSections(true);

		ListGridRecord[] cacheMenu = new ListGridRecord[3];

		ListGridRecord cacheList = new ListGridRecord();
		cacheList.setAttribute("menuId", "cacheList");
		cacheList.setAttribute("menuName", "缓存列表");

		ListGridRecord logingList = new ListGridRecord();
		logingList.setAttribute("menuId", "logView");
		logingList.setAttribute("menuName", "浏览日志");
		
		ListGridRecord debugLevel = new ListGridRecord();
		debugLevel.setAttribute("menuId", "debugLevel");
		debugLevel.setAttribute("menuName", "调试级别");

		cacheMenu[0] = cacheList;
		cacheMenu[1] = logingList;
		cacheMenu[2] = debugLevel;

		ListGrid cacheListGrid = new ListGrid();
		cacheListGrid.setShowHeader(false);
		cacheListGrid.setData(cacheMenu);
		cacheListGrid.setShowAllRecords(true);
		cacheListGrid.setAutoFetchData(true);
//		cacheListGrid.fetchData();
		cacheListGrid.setLeaveScrollbarGap(false);

		ListGridField listGridField = new ListGridField("menuName");
		listGridField.setAlign(Alignment.CENTER);
		cacheListGrid.setFields(listGridField);
		cacheListGrid.addRecordClickHandler(new RecordClickHandler() {
			@Override
			public void onRecordClick(RecordClickEvent event) {
				showMainPanel(event.getRecord().getAttribute("menuId"));
			}
		});

		SectionStackSection cacheSection = new SectionStackSection("缓存维护");
		cacheSection.setExpanded(true);
		cacheSection.setResizeable(false);
		cacheSection.setItems(cacheListGrid);
		
		// ----------------------------------------

		ListGridRecord[] logMenu = new ListGridRecord[2];

		ListGridRecord serviceList = new ListGridRecord();
		serviceList.setAttribute("menuId", "serviceList");
		serviceList.setAttribute("menuName", "服务日志");
		
		ListGridRecord debugList = new ListGridRecord();
		debugList.setAttribute("menuId", "debugLevel");
		debugList.setAttribute("menuName", "调试级别");

//		logMenu[0] = logingList;
		logMenu[0] = serviceList;
//		logMenu[2] = debugList;
		
		ListGrid logListGrid = new ListGrid();
		logListGrid.setShowHeader(false);
		logListGrid.setData(logMenu);
		logListGrid.setShowAllRecords(true);
		logListGrid.setAutoFetchData(true);
		logListGrid.fetchData();
		logListGrid.setLeaveScrollbarGap(false);

		ListGridField maillistGridField = new ListGridField("menuName");
		maillistGridField.setAlign(Alignment.CENTER);
		logListGrid.setFields(maillistGridField);
		logListGrid.addRecordClickHandler(new RecordClickHandler() {
			@Override
			public void onRecordClick(RecordClickEvent event) {
				showMainPanel(event.getRecord().getAttribute("menuId"));
			}
		});

		SectionStackSection logSection = new SectionStackSection("日志管理");
		logSection.setExpanded(true);
		logSection.setResizeable(false);
		logSection.setItems(logListGrid);

		sectionStack.setSections(cacheSection, logSection);
		sideLayout.addMember(sectionStack);

		addMember(sideLayout);

		VLayout operationLayout = new VLayout();

		memberOperate = new MemberListPanel();
		operationLayout.addMember(memberOperate);

		addMember(operationLayout);

	}

	protected void showMainPanel(String menuId) {
		
		if (menuId.equals("cacheList")) {
			
			memberOperate.setVisible(true);
			memberOperate.refreshData();
			
		} else if (menuId.equals("logView")) {
			
			memberOperate.setVisible(false);
//			logViewPanel.setVisible(true);
			
//			debugLevelPanel.setVisible(false);
			
		} else if (menuId.equals("debugLevel")) {
			
			memberOperate.setVisible(false);
//			logViewPanel.setVisible(false);
//			debugLevelPanel.setVisible(true);
			
//			logViewPanel.refreshData();
			
		} else if (menuId.equals("logingList")) {
			
			memberOperate.setVisible(false);
//			logViewPanel.setVisible(true);
//			debugLevelPanel.setVisible(false);
			
//			debugLevelPanel.refreshData();
			
		} else if (menuId.equals("serviceList")) {
			
			memberOperate.setVisible(false);
			
//			debugLevelPanel.setVisible(false);
			
		}
	}

}