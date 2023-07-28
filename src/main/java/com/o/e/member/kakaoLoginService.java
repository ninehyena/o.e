package com.o.e.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class kakaoLoginService {
	//DAO 역할
	
	public String getAccessToken(String auth_code) throws Exception {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=da627de1500bad51608594d4556e9751"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost/e/kakaoLogin"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + auth_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode_getAcceess : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			            
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);
			
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
//		return access_Token;
	}
	
	public HashMap<String, Object> getUserInfo(String access_token) throws Throwable {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode_userInfo : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8")); 

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body_getUserInfo : " + result);
			System.out.println("result type : " + result.getClass().getName()); // java.lang.String
			
			JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result); //결과물을 json형식으로
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject(); //닉네임이 담겨있는 곳
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject(); //이메일이 담겨있는 곳
	        
	        //String id = element.getAsJsonObject().get("id").getAsString(); //아이디는 엘리먼트에 직접 연결 가능
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString(); // 닉네임은 엘리먼트 - properties 안에 있음
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();//이메일은 엘리먼트 - kakao_account 안에 있음
	        
	        //userInfo.put("id", id); //id는 안씀
	        userInfo.put("email", email);
	        userInfo.put("nickname", nickname);
	        br.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	
	//카카오 로그아웃
	public void kakaoLogout(String access_Token) throws Throwable{
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    
	    try {
	        URL url = new URL(reqURL);
	        System.out.println(access_Token);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode_logout : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	        
	    } catch (IOException e) {
	    	System.out.println("일반 회원 로그아웃");
	    }
	}
	
	//카카오 연결 끊기
	public void unlink(String access_Token) throws Throwable {
//	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    String reqURL = "https://kauth.kakao.com/oauth/logout?client_id=da627de1500bad51608594d4556e9751"
	    		+ "&logout_redirect_uri=http://localhost/e/kakaoLogout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	        conn.setRequestMethod("POST");
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode_unlink : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("함께 로그아웃 결과값: 1"+result +" 2");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
}
