package com.happiness.client.util;

import java.util.Date;

public class SequenceNumberUtil {

	public static String createNewProductId() {
		return "P" + new Date().getTime();
	}

	public static String createNewRequestId() {
		return String.valueOf(new Date().getTime());
	}

}
