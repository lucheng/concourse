package com.happiness.client.common;

import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.widgets.IButton;
import com.smartgwt.client.widgets.Window;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.ClickHandler;
import com.smartgwt.client.widgets.events.CloseClickEvent;
import com.smartgwt.client.widgets.events.CloseClickHandler;
import com.smartgwt.client.widgets.form.DynamicForm;
import com.smartgwt.client.widgets.form.fields.PasswordItem;
import com.smartgwt.client.widgets.form.fields.TextItem;
import com.smartgwt.client.widgets.form.fields.events.KeyPressEvent;
import com.smartgwt.client.widgets.form.fields.events.KeyPressHandler;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.VLayout;

public class LoginWindow extends Window {
	final DynamicForm form = new DynamicForm();

	public LoginWindow(boolean showClose) {
		setWidth(500);
		setHeight(150);
		setHeaderIcon("openbuy/16/group.png", 16, 16);
		if (showClose)
			setTitle("登录管理控制平台 ");
		else
			setTitle("会话过期或已退出，请重新登录 ");
		setShowMinimizeButton(false);
		setShowCloseButton(showClose);
		setIsModal(true);
		setShowModalMask(true);
		setMembersMargin(15);
		centerInPage();
		addCloseClickHandler(new CloseClickHandler() {

			@Override
			public void onCloseClick(CloseClickEvent event) {
				
				destroy();
			}
		});

		VLayout vl = new VLayout();

		form.setHeight100();
		TextItem partyId = new TextItem("USERNAME", "用户名");
		partyId.setWidth(300);
		partyId.setRequired(true);
		partyId.setHint("<font color=red face=Courier New>*</font>");
		PasswordItem password = new PasswordItem("PASSWORD", "密　码");
		password.setWidth(300);
		password.setRequired(true);
		password.setHint("<font color=red face=Courier New>*</font>");
		password.addKeyPressHandler(new KeyPressHandler() {

			@Override
			public void onKeyPress(KeyPressEvent event) {
				if (event.getKeyName().equals("Enter"))
					doLogin();
			}
		});
		form.setFields(partyId, password);

		IButton okButton = new IButton("登录");
		okButton.setIcon("openbuy/16/accept.png");
		okButton.addClickHandler(new ClickHandler() {

			public void onClick(ClickEvent event) {
				doLogin();
			}

		});

		IButton cancleButton = new IButton("返回");
		cancleButton.setIcon("openbuy/16/cancel.png");
		cancleButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				destroy();
			}
		});

		HLayout hlayout = new HLayout(15);
		hlayout.setMargin(15);
		hlayout.setAlign(Alignment.CENTER);
		hlayout.addMember(okButton);
		if (showClose)
			hlayout.addMember(cancleButton);

		vl.addMember(form);
		vl.addMember(hlayout);

		addItem(vl);
	}

	private void doLogin() {

		if (form.validate()) {
			/*FormSubmitter.submitForm(form, ServiceTarget.LOGIN_URL,
					new RequestCallback() {
						public void onError(Request request, Throwable exception) {
						}

						public void onResponseReceived(Request request,
								Response response) {
							if (200 == response.getStatusCode()) {

								String responseText = response.getText();
								try {
									JSONValue jsonValue = JSONParser
											.parseStrict(responseText);
									JSONObject jsonObject = jsonValue
											.isObject();
									if (jsonObject != null) {
										if (jsonObject.get("success")
												.isBoolean().booleanValue()) {
											FormSubmitter.redirect("main");
										} else {
											SC.warn("登录失败："
													+ jsonObject.get("msg")
															.toString());
										}
									}

								} catch (JSONException ex) {
									com.google.gwt.user.client.Window
											.alert("应答数据解析错误：" + ex.toString());
								}
							} else {
								com.google.gwt.user.client.Window
										.alert("服务端应答错误，应答码："
												+ response.getStatusCode());
							}

						}

					});*/
		}
	}
}
