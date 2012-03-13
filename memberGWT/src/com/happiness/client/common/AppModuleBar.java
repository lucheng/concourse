package com.happiness.client.common;

import java.util.List;

import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.types.VerticalAlignment;
import com.smartgwt.client.widgets.ImgButton;
import com.smartgwt.client.widgets.Label;
import com.smartgwt.client.widgets.toolbar.ToolStrip;

public class AppModuleBar extends ToolStrip {

	public AppModuleBar(List<ImgButton> appButtons) {
		setHeight(50);
		setWidth100();
		setBorder("0px");

		addSpacer(10);

		for (ImgButton button : appButtons) {
			addMember(button);
			addSpacer(10);
		}

//		addFill();

		

	}

}
