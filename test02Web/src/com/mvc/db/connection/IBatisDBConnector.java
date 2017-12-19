package com.mvc.db.connection;

import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IBatisDBConnector {

	private static SqlMapClient mySQLMap;

	static {
		try { // 접속설정파일로드
			//한글 제대로 출력
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			//
			
			String resource = "com/mvc/db/sqlconfig/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			mySQLMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static SqlMapClient getSqlMapInstance()
	{   // 인스턴스 반환 메서드
		return mySQLMap;    
	}

}
