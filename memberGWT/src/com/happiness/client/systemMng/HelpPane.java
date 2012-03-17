package com.happiness.client.systemMng;

import com.smartgwt.client.types.Overflow;
import com.smartgwt.client.widgets.HTMLPane;

public class HelpPane extends HTMLPane {
    
	public HelpPane() {
        setContentsURL("ds/miniapp/demoApp_helpText.html");
        setOverflow(Overflow.AUTO);
        setStyleName("defaultBorder");
        setPadding(10);
    }
}
