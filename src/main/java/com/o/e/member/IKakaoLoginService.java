package com.o.e.member;

import java.util.HashMap;

public interface IKakaoLoginService {
	//Mapper.java 역할
	String getAccessToken(String authorize_code) throws Throwable;
	
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
}
