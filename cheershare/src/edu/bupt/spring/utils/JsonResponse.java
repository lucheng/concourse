package edu.bupt.spring.utils;


public class JsonResponse<T> {

	private T object;
	private int code;
	private String message;
	
	final public static int SUCCESS = 100;
	final public static int FAIL = 101;
	final public static int IS_EXIST = 102;
	
	public JsonResponse(T object, int code){
		
		this.object = object;
		this.code = code;
	}
	
	public JsonResponse(int code, String message){
		this.code = code;
		this.message = message;
	}
	
	public T getObject() {
		return object;
	}
	public void setObject(T object) {
		this.object = object;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
