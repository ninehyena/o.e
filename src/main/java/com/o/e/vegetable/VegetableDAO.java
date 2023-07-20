package com.o.e.vegetable;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VegetableDAO {

	@Autowired
	private SqlSession ss;
	
	// 채소 등록
	public void regVegetable(HttpServletRequest req) {
		try {
			String path = req.getRealPath("resources/images");
			System.out.println(path);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 채소 리스트 가져오기
	public void getList(HttpServletRequest req) {
		try {
			req.setAttribute("List", ss.getMapper(VegetableMapper.class).getList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
