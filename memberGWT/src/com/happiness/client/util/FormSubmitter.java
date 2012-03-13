package com.happiness.client.util;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.RequestException;
import com.google.gwt.http.client.Response;
import com.google.gwt.http.client.URL;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONString;
import com.google.gwt.json.client.JSONValue;
import com.google.gwt.user.client.Window;
import com.happiness.client.common.LoginWindow;
import com.smartgwt.client.util.SC;
import com.smartgwt.client.widgets.form.DynamicForm;

public class FormSubmitter {

	public static native void redirect(String url)/*-{
		$wnd.location = url;
	}-*/;

	public static void submitForm(DynamicForm form, String target,
			RequestCallback callbackHandler) {

		RequestBuilder requestBuilder = new RequestBuilder(RequestBuilder.POST,
				URL.encode(target));
		requestBuilder.setHeader("Content-Type",
				"application/x-www-form-urlencoded");
		try {
			requestBuilder.sendRequest(getFormValueString(form),
					new OpenBuyCallback(callbackHandler));

		} catch (Exception e) {
			Window.alert("数据提交异常：" + e.toString());
		}
	}

	public static void submitForm(List<DynamicForm> forms, String target,
			RequestCallback callbackHandler) {

		RequestBuilder requestBuilder = new RequestBuilder(RequestBuilder.POST,
				URL.encode(target));

		requestBuilder.setHeader("Content-Type",
				"application/x-www-form-urlencoded");
		try {
			requestBuilder.sendRequest(getFormValueString(forms),
					new OpenBuyCallback(callbackHandler));
		} catch (RequestException e) {
			Window.alert("数据提交异常：" + e.toString());
		}
	}

	public static void submitRequest(String requestStr, String target,
			RequestCallback callbackHandler) {

		RequestBuilder requestBuilder = new RequestBuilder(RequestBuilder.POST,
				URL.encode(target));

		requestBuilder.setHeader("Content-Type",
				"application/x-www-form-urlencoded");

		try {
			requestBuilder.sendRequest(requestStr, new OpenBuyCallback(
					callbackHandler));
		} catch (RequestException e) {
			Window.alert("数据提交异常：" + e.toString());
		}
	}

	@SuppressWarnings("unchecked")
	public static String getFormValueString(DynamicForm form) {

		Map<String, Object> requestValues = form.getValues();
		StringBuilder parameter = new StringBuilder();
		try {
			for (String key : requestValues.keySet()) {
				if (requestValues.get(key) != null) {
					if (key.toLowerCase().endsWith("date")) {
						parameter
								.append(key)
								.append("=")
								.append(((Date) requestValues.get(key))
										.getTime()).append("&");
					} else {

						parameter
								.append(key)
								.append("=")
								.append(replaceString(requestValues.get(key)
										.toString())).append("&");

					}
				}
			}
		} catch (Exception e) {
			SC.warn(e.toString());
		}

//		 SC.say(parameter.toString());
		return parameter.toString();
	}

	@SuppressWarnings("unchecked")
	public static String getFormValueJsonString(DynamicForm form) {
		Map<String, Object> requestValues = form.getValues();
		JSONObject input = new JSONObject();

		for (String key : requestValues.keySet()) {
			if (requestValues.get(key) != null) {
				JSONString value;

				if (key.toLowerCase().endsWith("date")) {
					value = new JSONString(String.valueOf(((Date) requestValues
							.get(key)).getTime()));
				} else {
					value = new JSONString(requestValues.get(key).toString());
				}
				input.put(key, value);
			}
		}

		if (input.size() > 0)
			return input.toString();
		else
			return "";
	}

	@SuppressWarnings("unchecked")
	public static String getFormValueString(List<DynamicForm> formList) {
		StringBuilder parameter = new StringBuilder();
		for (DynamicForm form : formList) {
			Map<String, Object> requestValues = form.getValues();
			for (String key : requestValues.keySet()) {
				if (requestValues.get(key) != null) {
					if (key.toLowerCase().endsWith("date")) {
						parameter
								.append(key)
								.append("=")
								.append(((Date) requestValues.get(key))
										.getTime()).append("&");
					} else {
						parameter.append(key).append("=")
								.append(requestValues.get(key).toString())
								.append("&");
					}
				}
			}
		}

		return parameter.toString();
	}

	public static Map<String, Object> getNewValueMap(
			Map<String, Object> requestValues) {
		for (String key : requestValues.keySet()) {
			if (requestValues.get(key) != null) {
				if (key.toLowerCase().indexOf("date") != -1
						&& !key.toLowerCase().endsWith("_op")) {
					requestValues.put(key,
							((Date) requestValues.get(key)).getTime());
				}
			}
		}
		return requestValues;
	}

	public static String replaceString(String oldString) {
		if (oldString.indexOf("'") != -1) {
			oldString = oldString.replaceAll("'", "\\'");
		}
		if (oldString.indexOf("\"") != -1) {
			oldString = oldString.replaceAll("\"", "\\\"");
		}

		if (oldString.indexOf("\r\n") != -1) {
			oldString = oldString.replaceAll("\r\n", "\\u000d\\u000a");
		}
		if (oldString.indexOf("\n") != -1) {
			oldString = oldString.replaceAll("\n", "\\u000a");
		}
		return oldString;
	}

	public static String replaceBack(String oldString) {

		if (oldString.indexOf("u000du000a") != -1) {
			oldString = oldString.replaceAll("u000du000a", "\r\n");
		}
		if (oldString.indexOf("u000a") != -1) {
			oldString = oldString.replaceAll("u000a", "\n");
		}
		return oldString;
	}

	public static String escapeHTML(String s) {
		StringBuffer sb = new StringBuffer();
		int n = s.length();
		for (int i = 0; i < n; i++) {
			char c = s.charAt(i);
			switch (c) {
			case '<':
				sb.append("&lt;");
				break;
			case '>':
				sb.append("&gt;");
				break;
			case '&':
				sb.append("&amp;");
				break;
			case '"':
				sb.append("&quot;");
				break;
			case 'à':
				sb.append("&agrave;");
				break;
			case 'À':
				sb.append("&Agrave;");
				break;
			case 'â':
				sb.append("&acirc;");
				break;
			case 'Â':
				sb.append("&Acirc;");
				break;
			case 'ä':
				sb.append("&auml;");
				break;
			case 'Ä':
				sb.append("&Auml;");
				break;
			case 'å':
				sb.append("&aring;");
				break;
			case 'Å':
				sb.append("&Aring;");
				break;
			case 'æ':
				sb.append("&aelig;");
				break;
			case 'Æ':
				sb.append("&AElig;");
				break;
			case 'ç':
				sb.append("&ccedil;");
				break;
			case 'Ç':
				sb.append("&Ccedil;");
				break;
			case 'é':
				sb.append("&eacute;");
				break;
			case '?':
				sb.append("&Eacute;");
				break;
			case 'è':
				sb.append("&egrave;");
				break;
			case 'È':
				sb.append("&Egrave;");
				break;
			case 'ê':
				sb.append("&ecirc;");
				break;
			case 'Ê':
				sb.append("&Ecirc;");
				break;
			case 'ë':
				sb.append("&euml;");
				break;
			case 'Ë':
				sb.append("&Euml;");
				break;
			case 'Ï':
				sb.append("&Iuml;");
				break;
			case 'ô':
				sb.append("&ocirc;");
				break;
			case 'Ô':
				sb.append("&Ocirc;");
				break;
			case 'ö':
				sb.append("&ouml;");
				break;
			case 'Ö':
				sb.append("&Ouml;");
				break;
			case 'ø':
				sb.append("&oslash;");
				break;
			case 'Ø':
				sb.append("&Oslash;");
				break;
			case 'ß':
				sb.append("&szlig;");
				break;
			case 'ù':
				sb.append("&ugrave;");
				break;
			case 'Ù':
				sb.append("&Ugrave;");
				break;
			case 'û':
				sb.append("&ucirc;");
				break;
			case 'Û':
				sb.append("&Ucirc;");
				break;
			case 'ü':
				sb.append("&uuml;");
				break;
			case 'Ü':
				sb.append("&Uuml;");
				break;
			case '®':
				sb.append("&reg;");
				break;
			case '©':
				sb.append("&copy;");
				break;
			case '�':
				sb.append("&euro;");
				break;
			case ' ':
				sb.append("&nbsp;");
				break;

			default:
				sb.append(c);
				break;
			}
		}
		return sb.toString();
	}

	/*public static void checkLogin(RequestCallback requestCallback) {
		RequestBuilder requestBuilder = new RequestBuilder(RequestBuilder.GET,
				URL.encode(ServiceTarget.CHECK_MYLOGIN + "?t="
						+ SequenceNumberUtil.createNewRequestId()));

		try {
			requestBuilder.sendRequest(null, requestCallback);
		} catch (RequestException e) {
			Window.alert("数据提交异常：" + e.toString());
		}
	}*/
}

class OpenBuyCallback implements RequestCallback {
	RequestCallback callback;
	JSONValue jsonValue;

	OpenBuyCallback(RequestCallback requestCallback) {
		this.callback = requestCallback;
	}

	protected boolean formatToJson(Response response) {
		try {
			jsonValue = JSONParser.parseStrict(response.getText());
		} catch (Exception e) {
			new LoginWindow(false).show();
			return false;
		}
		return true;
	}

	@Override
	public void onResponseReceived(Request request, Response response) {
		if (200 == response.getStatusCode()) {
			if (formatToJson(response)) {
				callback.onResponseReceived(request, response);
			}
		} else {
			SC.say("数据交互异常，请检查网络状况。");
		}
	}

	@Override
	public void onError(Request request, Throwable exception) {
		callback.onError(request, exception);

	}
}
