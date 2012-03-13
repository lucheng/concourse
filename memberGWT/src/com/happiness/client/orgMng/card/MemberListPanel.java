package com.happiness.client.orgMng.card;

import java.util.LinkedHashMap;

import com.smartgwt.client.data.DataSource;
import com.smartgwt.client.data.fields.DataSourceTextField;
import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.types.DSDataFormat;
import com.smartgwt.client.types.VerticalAlignment;
import com.smartgwt.client.util.BooleanCallback;
import com.smartgwt.client.util.SC;
import com.smartgwt.client.widgets.IButton;
import com.smartgwt.client.widgets.Window;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.CloseClickEvent;
import com.smartgwt.client.widgets.events.CloseClickHandler;
import com.smartgwt.client.widgets.form.DynamicForm;
import com.smartgwt.client.widgets.form.fields.SelectItem;
import com.smartgwt.client.widgets.form.fields.TextItem;
import com.smartgwt.client.widgets.grid.ListGrid;
import com.smartgwt.client.widgets.grid.ListGridRecord;
import com.smartgwt.client.widgets.grid.events.SelectionChangedHandler;
import com.smartgwt.client.widgets.grid.events.SelectionEvent;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.VLayout;
import com.smartgwt.client.widgets.toolbar.ToolStrip;
import com.smartgwt.client.widgets.toolbar.ToolStripButton;

public class MemberListPanel extends VLayout {

	public static String cacheNameSelected = "";
	
	private static ListGrid cacheListGrid = new ListGrid();
	
	public static void refreshData() {

		cacheListGrid.setDataSource(new MemberDS());
		cacheListGrid.fetchData();
	}
	
	public MemberListPanel() {

		setAlign(VerticalAlignment.BOTTOM);

		cacheListGrid.setHeight("50%");
		cacheListGrid.setLoadingDataMessage("数据加载中...");
		cacheListGrid.setEmptyMessage("无记录");
		cacheListGrid.setAlternateRecordStyles(true);
		cacheListGrid.setShowAllRecords(true);
		cacheListGrid.setShowRowNumbers(true);
		cacheListGrid.setLeaveScrollbarGap(false);
		cacheListGrid.setDataSource(new MemberDS());
//		cacheListGrid.setAutoFetchData(true);

		cacheListGrid.addSelectionChangedHandler(new SelectionChangedHandler() {
			@Override
			public void onSelectionChanged(SelectionEvent event) {

				cacheNameSelected = "";
				ListGridRecord selectedRecord = cacheListGrid.getSelectedRecord();
				cacheNameSelected = selectedRecord.getAttribute("cacheName");
			}
		});

		VLayout operationLayout = new VLayout();
		operationLayout.setWidth100();

		VLayout listLayout = new VLayout();
		listLayout.setWidth100();
		listLayout.setHeight("50%");
		listLayout.setShowResizeBar(true);
		listLayout.setAnimateResizeTime(200);
		listLayout.setResizeBarTarget("next");
		listLayout.addMember(new CacheListTopBar());
		listLayout.addMember(cacheListGrid);

		operationLayout.addMember(listLayout);
		
		addMember(operationLayout);

	}
	
	private class EditCacheWindow extends Window {
		
		public EditCacheWindow() {
			
			setWidth(700);
			setHeight(550);
			setTitle("查看缓存信息");
			setShowMinimizeButton(false);
			setIsModal(true);
			setShowModalMask(true);
			centerInPage();
			addCloseClickHandler(new CloseClickHandler() {

				@Override
				public void onCloseClick(CloseClickEvent event) {
					// TODO Auto-generated method stub
					destroy();
				}
			});

			final DynamicForm cacheForm = new DynamicForm();
			cacheForm.setHeight("90%");
			cacheForm.setNumCols(4);
			cacheForm.setIsGroup(true);
			cacheForm.setGroupTitle("缓存信息");
			cacheForm.setAlign(Alignment.CENTER);
			
			TextItem cacheName = new TextItem("cacheName", "缓存名称");
			TextItem cacheSize = new TextItem("cacheSize","缓存大小");
			TextItem hitCount = new TextItem("hitCount", "命中次数");
			
			TextItem missCountTot = new TextItem("missCountTot", "错失");
			TextItem missCountNotFound = new TextItem("missCountNotFound", "未找到");
			TextItem missCountExpired = new TextItem("missCountExpired", "过期");
			TextItem missCountSoftRef = new TextItem("missCountSoftRef", "软引用");
			
			TextItem removeHitCount = new TextItem("removeHitCount", "删除命中");
			TextItem removeMissCount = new TextItem("removeMissCount", "删除未命中");
			TextItem expireTime = new TextItem("expireTime", "过期");
			
			SelectItem useSoftReference = new SelectItem("useSoftReference", "使用软引用");
			LinkedHashMap<String, String> valueMap = new LinkedHashMap<String, String>();
			valueMap.put("true", "是");
			valueMap.put("false", "否");
			useSoftReference.setValueMap(valueMap);
			
			
			TextItem useFileSystemStore = new TextItem("useFileSystemStore", "使用文件存储");
			
			TextItem hrs = new TextItem("hrs", "小时");
			TextItem mins = new TextItem("mins", "分钟");
			TextItem secs = new TextItem("secs", "秒");
			
			TextItem maxMemory = new TextItem("UTIL_CACHE_MAX_IN_MEMORY", "内存最大值");
			TextItem utilExpireTime = new TextItem("UTIL_CACHE_EXPIRE_TIME", "过期时间");
			
			cacheForm.setFields(cacheName, cacheSize, hitCount, missCountTot, missCountNotFound, missCountExpired, missCountSoftRef, removeHitCount, 
					removeMissCount, expireTime, useSoftReference, useFileSystemStore, hrs, mins, secs, maxMemory, utilExpireTime);
//			cacheForm.setDataSource(new EditCacheDS(cacheNameSelected));
			cacheForm.fetchData();
			
			final IButton saveButton = new IButton("保存");
			saveButton.setIcon("openbuy/16/accept.png");
			saveButton.setWidth(120);
			saveButton.addClickHandler(new com.smartgwt.client.widgets.events.ClickHandler() {
				public void onClick(ClickEvent event) {

					if (!cacheForm.validate()) {
						SC.warn("请检查输入内容是否正确！");
						return;
					}

					saveButton.setTitle("提交中...");
					saveButton.setDisabled(true);

					/*FormSubmitter.submitForm(cacheForm, ServiceTarget.EDIT_UTIL_CACHE_UPDATE, new RequestCallback() {

						@Override
						public void onError(Request request, Throwable exception) {
							com.google.gwt.user.client.Window.alert("表单数据提交错误："+ exception.getMessage());
						}

						@SuppressWarnings("deprecation")
						@Override
						public void onResponseReceived(Request request, Response response) {
							if (response.getStatusCode() == 200) {
								String responseText = response.getText();
								try {
									JSONValue jsonValue = JSONParser.parse(responseText);
									JSONObject jsonObject = jsonValue.isObject();
									if (jsonObject != null) {
										if (jsonObject.get("success").isBoolean().booleanValue()) {
											CacheListPanel.refreshData();
											SC.say("缓存更新成功！");
											destroy();
										} else {
											SC.warn("缓存更新："+ jsonObject.get("msg").toString());
										}
									}

								} catch (JSONException ex) {
									com.google.gwt.user.client.Window.alert("应答数据解析错误："+ ex.toString());
								}
							} else {
								com.google.gwt.user.client.Window.alert("服务端应答错误，应答码："+ response.getStatusCode());
							}
							saveButton.setTitle("保存");
							saveButton.setDisabled(false);
						}
					});*/
				}
			});

			final IButton cancelButton = new IButton("返回");
			cancelButton.setIcon("openbuy/16/cancel.png");
			cancelButton.setWidth(120);
			cancelButton.addClickHandler(new com.smartgwt.client.widgets.events.ClickHandler() {
				public void onClick(ClickEvent event) {
					destroy();
				}
			});

			HLayout buttonLayout = new HLayout(25);
			buttonLayout.setMargin(10);
			buttonLayout.setAlign(Alignment.CENTER);
			buttonLayout.addMember(saveButton);
			buttonLayout.addMember(cancelButton);

			addItem(cacheForm);
			addItem(buttonLayout);

		}
	}

	private class CacheListTopBar extends ToolStrip {

		public CacheListTopBar() {
			setWidth100();
			addSpacer(3);
			
			/////////////////////////////////////////
			
			ToolStripButton addButton = new ToolStripButton("删除缓存");
			addButton.setPrompt("删除缓存");
			addButton.setIcon("openbuy/16/package_go.png");
			addButton.addClickHandler(new com.smartgwt.client.widgets.events.ClickHandler() {
				public void onClick(ClickEvent event) {
					
					if (cacheNameSelected == null || cacheNameSelected.equals("")){
						SC.warn("您没有选定需要删除的缓存信息，请选定后删除。");
					}else{
						SC.confirm("删除商品分类", "确定删除缓存信息 么？", new BooleanCallback() {

							@Override
							public void execute(Boolean yes) {
								if (yes != null && yes == true){
									/*FormSubmitter.submitRequest("UTIL_CACHE_NAME=" + cacheNameSelected, ServiceTarget.CLEAR_CACHE_BY_NAME, new RequestCallback() {

										@Override
										public void onError(Request request, Throwable exception) {
											com.google.gwt.user.client.Window.alert("数据提交错误："	+ exception.getMessage());
										}

										@Override
										@SuppressWarnings( { "deprecation" })
										public void onResponseReceived(Request request, Response response) {
											if (response.getStatusCode() == 200) {
												String responseText = response.getText();
												try {
													JSONValue jsonValue = JSONParser.parse(responseText);
													JSONObject jsonObject = jsonValue.isObject();
													if (jsonObject != null) {
														if (jsonObject.get("success").isBoolean().booleanValue()) {
															refreshData();
															SC.say("缓存信息删除成功！");
														} else {
															SC.warn("缓存信息删除失败："+ jsonObject.get("msg").toString());
														}
													}

												} catch (JSONException ex) {
													com.google.gwt.user.client.Window.alert("应答数据解析错误："+ ex.toString());
												}
											} else {
												com.google.gwt.user.client.Window.alert("服务端应答错误，应答码："+ response.getStatusCode());
											}

										}
									});*/

								}
									
							}

						});
					}
				}
			});
			addButton(addButton);
			addSeparator();
			
			/////////////////////////////////////////
			
			ToolStripButton deleteButton = new ToolStripButton("修改缓存");
			deleteButton.setPrompt("修改缓存");
			deleteButton.setIcon("openbuy/16/package_go.png");
			deleteButton.addClickHandler(new com.smartgwt.client.widgets.events.ClickHandler() {
				public void onClick(ClickEvent event) {
					new EditCacheWindow().show();
				}
			});

			addButton(deleteButton);
			addSeparator();
		}

	}
		
}


class MemberDS extends DataSource {
	
	public MemberDS() {
		
		setID(id);
		setDataFormat(DSDataFormat.JSON);
		setRecordXPath("members");
		
		DataSourceTextField idField = new DataSourceTextField("pk");
		idField.setPrimaryKey(true);
		idField.setRequired(true);
		idField.setHidden(true);
		
		DataSourceTextField id = new DataSourceTextField("id", "缓存名称");
		DataSourceTextField name = new DataSourceTextField("name", "缓存名称");
		
		DataSourceTextField cacheSize = new DataSourceTextField("company","缓存大小");
		
		DataSourceTextField hitCount = new DataSourceTextField("smallImageUrl", "命中次数");
		
		setFields(id, name, cacheSize, hitCount);
//		setDataURL(ServiceTarget.FIND_UTIL_CACHE);
		setDataURL("ds/huiyuan.json");

	}
}