package com.happiness.client.common;

import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.types.ImageStyle;
import com.smartgwt.client.types.VerticalAlignment;
import com.smartgwt.client.widgets.Img;
import com.smartgwt.client.widgets.Label;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.ClickHandler;
import com.smartgwt.client.widgets.toolbar.ToolStrip;
import com.smartgwt.client.widgets.toolbar.ToolStripButton;

public class AppTopBar extends ToolStrip {

	public AppTopBar(String userId) {
		setWidth100();
		addSpacer(6);

		Img logoImg = new Img("openbuy/top_logo.png", 93, 24);
		logoImg.setImageType(ImageStyle.NORMAL);

		addMember(logoImg);

		Label title = new Label("电子商务平台管理控制系统");
		title.setWrap(false);
		addMember(title);

		addFill();
		
		Label loginLabel = new Label();
		loginLabel.setHeight(30);
		loginLabel.setPadding(5);
		loginLabel.setAlign(Alignment.CENTER);
		loginLabel.setValign(VerticalAlignment.CENTER);
		loginLabel.setWrap(false);
		loginLabel.setContents("当前登录用户：" + userId + " ");

		addMember(loginLabel);
		addSpacer(10);
		
		ToolStripButton loginButton = new ToolStripButton("切换用户");
		loginButton.setIcon("openbuy/16/group.png");
		loginButton.addClickHandler(new ClickHandler(){

			@Override
			public void onClick(ClickEvent event) {
				new LoginWindow(true).show();
				
			}});
		addButton(loginButton);
		addSeparator();
		
		ToolStripButton exitButton = new ToolStripButton("退出");
		exitButton.setIcon("openbuy/16/door_in.png");
		exitButton.addClickHandler(new ClickHandler(){

			@Override
			public void onClick(ClickEvent event) {
				AppWaitingPanel.getInstance().show();
				/*RequestBuilder reqbuilder = new RequestBuilder(RequestBuilder.GET,
						ServiceTarget.LOGOUT_URL);
				try {
					reqbuilder.sendRequest(null, new RequestCallback() {
						public void onError(Request request, Throwable exception) {
							exception.printStackTrace();
						}

						public void onResponseReceived(Request request,
								Response response) {
							if (200 == response.getStatusCode()) {
								SC.say("成功退出系统，请重新登录。");
								new LoginOutWindow().show();
							}
							AppWaitingPanel.getInstance().destroy();
						}
					});
				} catch (RequestException e) {
					e.printStackTrace();
				}*/
				
			}});
		addButton(exitButton);
		addSeparator();

		ToolStripButton guideButton = new ToolStripButton("向导");
		guideButton.setIcon("openbuy/16/direction.png");
		addButton(guideButton);
		addSeparator();
		
		ToolStripButton helpButton = new ToolStripButton("帮助");
		helpButton.setIcon("openbuy/16/help.png");
		helpButton.addClickHandler(new ClickHandler(){

			@Override
			public void onClick(ClickEvent event) {
				AppWaitingPanel.getInstance().show();
			}
			
		});
		addButton(helpButton);
		addSeparator();

		ToolStripButton serviceButton = new ToolStripButton("客服");
		serviceButton.setIcon("openbuy/16/heart.png");
		addButton(serviceButton);
		addSeparator();

		ToolStripButton purchaseButton = new ToolStripButton("购买");
		purchaseButton.setIcon("openbuy/16/coins.png");
		addButton(purchaseButton);

		addSpacer(6);

	}

}
