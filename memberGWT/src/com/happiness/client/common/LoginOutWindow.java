package com.happiness.client.common;

import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.types.VerticalAlignment;
import com.smartgwt.client.widgets.IButton;
import com.smartgwt.client.widgets.Window;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.ClickHandler;
import com.smartgwt.client.widgets.form.DynamicForm;
import com.smartgwt.client.widgets.form.fields.HeaderItem;
import com.smartgwt.client.widgets.form.fields.PasswordItem;
import com.smartgwt.client.widgets.form.fields.TextItem;
import com.smartgwt.client.widgets.form.fields.events.KeyPressEvent;
import com.smartgwt.client.widgets.form.fields.events.KeyPressHandler;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.VLayout;

public class LoginOutWindow extends Window {
	final DynamicForm form = new DynamicForm();

	public LoginOutWindow() {
		setCanDragReposition(false);
		setShowHeader(false);
		setShowEdges(false);
		setBackgroundColor("#ffffff");
		setWidth100();
		setHeight100();
		setIsModal(true);
		setMembersMargin(15);
		centerInPage();

		VLayout vl = new VLayout();
		vl.setAlign(VerticalAlignment.CENTER);

		TextItem partyId = new TextItem("USERNAME", "用户名");
		partyId.setWidth(200);
		partyId.setRequired(true);
		partyId.setHint("<font color=red face=Courier New>*</font>");
		PasswordItem password = new PasswordItem("PASSWORD", "密　码");
		password.setWidth(200);
		password.setRequired(true);
		password.setHint("<font color=red face=Courier New>*</font>");
		password.addKeyPressHandler(new KeyPressHandler() {

			@Override
			public void onKeyPress(KeyPressEvent event) {
				if (event.getKeyName().equals("Enter"))
					doLogin();
			}
		});
		
		HeaderItem headerItem = new HeaderItem();
		headerItem.setTextAlign(Alignment.CENTER);
		headerItem.setValue("　　　已退出系统，请重新登录。");
		form.setFields(headerItem,partyId, password);

		IButton okButton = new IButton("登　录");
		okButton.setWidth(80);
		okButton.setHeight(30);
		okButton.setIcon("openbuy/16/key.png");
		okButton.addClickHandler(new ClickHandler() {

			public void onClick(ClickEvent event) {
				doLogin();
			}

		});

		HLayout hlayout = new HLayout();
		hlayout.setWidth100();

		hlayout.setAlign(Alignment.CENTER);

		VLayout vls = new VLayout();
		vls.setWidth(350);
		vls.setAlign(VerticalAlignment.CENTER);
		vls.addMember(form);

		VLayout vlsb = new VLayout();
		vlsb.setWidth(100);
		vlsb.setAlign(VerticalAlignment.CENTER);
		vlsb.addMember(okButton);

		hlayout.addMember(vls);
		hlayout.addMember(vlsb);

	
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
									SC.warn("登录失败：请检查用户名及密码！");
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
