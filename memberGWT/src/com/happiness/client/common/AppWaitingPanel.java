package com.happiness.client.common;

import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.widgets.Canvas;
import com.smartgwt.client.widgets.Label;
import com.smartgwt.client.widgets.Window;
import com.smartgwt.client.widgets.events.RightMouseDownEvent;
import com.smartgwt.client.widgets.events.RightMouseDownHandler;
import com.smartgwt.client.widgets.layout.HLayout;

public class AppWaitingPanel extends Window {
	private static AppWaitingPanel instance;
	HLayout hl = new HLayout();
	Label lb = new Label();

	public static AppWaitingPanel getInstance() {
		if (instance == null) {
			instance = new AppWaitingPanel();
		}
		return instance;
	}

	private AppWaitingPanel() {
		setShowHeader(false);
		setShowEdges(false);
		setCanDrag(false);
		setBackgroundColor("#d0dff6");
		setWidth(200);
		setHeight(60);
		setIsModal(true);
		addRightMouseDownHandler(new RightMouseDownHandler() {

			@Override
			public void onRightMouseDown(RightMouseDownEvent event) {
				destroy();
			}
		});
	}

	public void show() {
		super.centerInPage();
		hl.setAlign(Alignment.CENTER);
		hl.setWidth100();
		String imgHTML = Canvas.imgHTML("openbuy/loadingSmall.gif");
		lb.setContents("<span>" + imgHTML + "&nbsp;&nbsp;数据交互请稍候<span>");
		lb.setWidth(110);
		hl.addMember(lb);
		addItem(hl);
		super.show();
	}

}
