package com.tag;


import javax.servlet.jsp.tagext.TagSupport;



public class Test01 extends TagSupport {

	public int doStartTag() {	// doStartTag()를 오버라이딩
		
		try {
			
		}catch( Exception e ) {
			e.printStackTrace();
		}
		
		//return SKIP_BODY;	//	body부분을 처리하지 않음.
		return EVAL_BODY_INCLUDE;	// body 부분을 처리.
	}
}
