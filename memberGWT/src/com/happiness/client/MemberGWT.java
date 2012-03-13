package com.happiness.client;

import java.util.ArrayList;
import java.util.List;

import com.google.gwt.core.client.EntryPoint;
import com.happiness.client.common.AppModuleBar;
import com.happiness.client.common.AppTopBar;
import com.happiness.client.data.ItemSupplyXmlDS;
import com.happiness.client.data.SupplyCategoryXmlDS;
import com.happiness.client.systemMng.SystemMngPanel;
import com.smartgwt.client.data.Criteria;
import com.smartgwt.client.data.DataSource;
import com.smartgwt.client.types.SelectionType;
import com.smartgwt.client.types.VisibilityMode;
import com.smartgwt.client.widgets.ImgButton;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.ClickHandler;
import com.smartgwt.client.widgets.form.fields.ComboBoxItem;
import com.smartgwt.client.widgets.form.fields.FilterCriteriaFunction;
import com.smartgwt.client.widgets.grid.ListGridRecord;
import com.smartgwt.client.widgets.grid.events.CellContextClickEvent;
import com.smartgwt.client.widgets.grid.events.CellContextClickHandler;
import com.smartgwt.client.widgets.grid.events.CellSavedEvent;
import com.smartgwt.client.widgets.grid.events.CellSavedHandler;
import com.smartgwt.client.widgets.grid.events.RecordClickEvent;
import com.smartgwt.client.widgets.grid.events.RecordClickHandler;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.SectionStack;
import com.smartgwt.client.widgets.layout.SectionStackSection;
import com.smartgwt.client.widgets.layout.VLayout;
import com.smartgwt.client.widgets.menu.Menu;
import com.smartgwt.client.widgets.menu.MenuItem;
import com.smartgwt.client.widgets.menu.events.MenuItemClickEvent;
import com.smartgwt.client.widgets.tree.events.NodeClickEvent;
import com.smartgwt.client.widgets.tree.events.NodeClickHandler;

public class MemberGWT extends VLayout implements EntryPoint {
    
	private HLayout main = new HLayout();
    
    private static ImgButton membermngButton = new ImgButton();
	private static ImgButton systemmngButton = new ImgButton();
	private static ImgButton orgmngButton = new ImgButton();
	private static ImgButton serviceEngineButton = new ImgButton();
	private static ImgButton dataFileButton = new ImgButton();
	private static ImgButton homeButton = new ImgButton();
	
	public static void showMemberMngPanel() {
		membermngButton.select();
//		memberMngPanel.setVisible(true);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showSystemMngPanel() {
		systemmngButton.select();
//		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(true);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showOrgMngPanel() {
		orgmngButton.select();
//		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(true);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showServiceEngineMngPanel() {
		serviceEngineButton.select();
//		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(true);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showDataFileMngPanel() {
		dataFileButton.select();
//		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(true);
//		statisticsMngPanel.setVisible(false);
	}

	public static void showStatisticsPanel() {
		homeButton.select();
//		memberMngPanel.setVisible(false);
//		logingMngPanel.setVisible(false);
//		entityEngineMngPanel.setVisible(false);
//		serviceEngineMngPanel.setVisible(false);
//		dataFileMngPanel.setVisible(false);
//		statisticsMngPanel.setVisible(true);
	}
	
    @Override
	public void onModuleLoad() {
        
    	setWidth100();
        setHeight100();
        setLayoutMargin(0);
        
        addMember(new AppTopBar("userId"));
        
        List<ImgButton> appButtons = new ArrayList<ImgButton>();

		appButtons.add(membermngButton);
		appButtons.add(systemmngButton);
		appButtons.add(serviceEngineButton);
		appButtons.add(orgmngButton);
		appButtons.add(dataFileButton);
		appButtons.add(homeButton);
		
        addMember(new AppModuleBar(appButtons));
        
        membermngButton.setSize("113", "35");
		membermngButton.setSrc("openbuy/button/productmng.png");
		membermngButton.setPrompt("缓存及调试工具");
		membermngButton.setShowDown(false);
		membermngButton.setActionType(SelectionType.RADIO);
		membermngButton.setRadioGroup("productmngAppButton");
		membermngButton.select();
		
		membermngButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {

				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showMemberMngPanel();
				}
			}

		});

		systemmngButton.setSize("113", "35");
		systemmngButton.setShowRollOver(true);
		systemmngButton.setSrc("openbuy/button/promotionmng.png");
		systemmngButton.setPrompt("日志工具");
		systemmngButton.setShowDown(false);
		systemmngButton.setActionType(SelectionType.RADIO);
		systemmngButton.setRadioGroup("productmngAppButton");
		systemmngButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {
				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showSystemMngPanel();
				}
			}

		});

		orgmngButton.setSize("113", "35");
		orgmngButton.setShowRollOver(true);
		orgmngButton.setSrc("openbuy/button/feature.png");
		orgmngButton.setPrompt("实体引擎工具");
		orgmngButton.setShowDown(false);
		orgmngButton.setActionType(SelectionType.RADIO);
		orgmngButton.setRadioGroup("productmngAppButton");
		orgmngButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {
				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showOrgMngPanel();
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

		
		homeButton.setSize("113", "35");
		homeButton.setSrc("openbuy/button/home.png");
		homeButton.setPrompt("系统首页");
		homeButton.setShowDown(false);
		homeButton.setActionType(SelectionType.RADIO);
		homeButton.setRadioGroup("productmngAppButton");
		homeButton.addClickHandler(new ClickHandler() {

			@Override
			public void onClick(ClickEvent event) {

				ImgButton button = (ImgButton) event.getSource();
				Boolean selected = button.getSelected();
				if (selected) {
					showStatisticsPanel();
				}
			}

		});
        
       
        addMember(main);
        setupContextMenu();
        
        draw();
    }

    private void setupContextMenu(){
    	main.addMember(new SystemMngPanel());
    }
    

}