package com.happiness.client.util;

import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.RequestException;
import com.google.gwt.http.client.Response;
import com.google.gwt.json.client.JSONArray;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;

public class SelectListUtil {

	public static String[] getValueArray(String url, final String id) {

		RequestBuilder builder = new RequestBuilder(RequestBuilder.GET, url);
		String[] array = null ;
		try {
			builder.sendRequest(null, new RequestCallback() {
				public void onError(Request request, Throwable exception) {
				}

				public void onResponseReceived(Request request,
						Response response) {
					if (200 == response.getStatusCode()) {

						JSONArray jsonArray = JSONParser.parseStrict(
								response.getText()).isArray();

						if (jsonArray != null && jsonArray.size() > 0) {
							String[] array = new String[jsonArray.size()];

							for (int i = 0; i < jsonArray.size(); i++) {
								JSONObject jsonObject = jsonArray.get(i)
										.isObject();
								array[i] = jsonObject.get(id).isString()
										.stringValue();
								System.out.println(array[i]);
							}
						}
					}
				}
			});
		} catch (RequestException e) {
			e.printStackTrace();
		}
		return array;

	}
}
