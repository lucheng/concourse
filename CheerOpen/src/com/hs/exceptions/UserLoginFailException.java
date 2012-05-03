package com.hs.exceptions;

//���췽�����ܱ��̳�
//shfit+alt+s+c
public class UserLoginFailException extends RuntimeException{
	
	public UserLoginFailException(){
		super();
	}
	
	public UserLoginFailException(String message){
		super(message);
	}
	
	
	
	public UserLoginFailException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public UserLoginFailException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		RuntimeException re=new RuntimeException("fail");
		re.printStackTrace();
		
		UserLoginFailException ulfe=new UserLoginFailException("fail");
		ulfe.printStackTrace();
	}

}
