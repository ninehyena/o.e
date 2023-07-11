package com.o.e.vegetable;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VegetableDAO {

	@Autowired
	private SqlSession ss;
	
	public void getList(HttpServletRequest req) {
		try {
			req.setAttribute("List", ss.getMapper(VegetableMapper.class).getList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
