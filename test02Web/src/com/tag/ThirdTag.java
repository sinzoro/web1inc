package com.tag;


import javax.servlet.jsp.tagext.TagSupport;



public class ThirdTag extends TagSupport {

	int count = 0;
	public int doStartTag() {	// doStartTag()를 오버라이딩
		
		try {
			System.out.println( "doStartTag()" );
			pageContext.getOut().println( "doStartTag() : " );
		}catch( Exception e ) {
			e.printStackTrace();
		}
		
		//return SKIP_BODY;	//	body부분을 처리하지 않음.(출력x)
		return EVAL_BODY_INCLUDE;	// body 부분을 처리.
	}
	
	public int doAfterBody() {	// doAfterBodyTag()를 오버라이딩
		
		if(count<5) {
			count++;
			try {
				pageContext.getOut().println( "<br>doAfterBody() count : " + count );
			}catch( Exception e ) {
				e.printStackTrace();
			}
			return EVAL_BODY_AGAIN;
		}else {
			// return SKIP_BODY;
			return SKIP_BODY;
		}
		
	}
	
	public int doEndTag() {
		
		try {
			System.out.println( "doEndTag()" );
			pageContext.getOut().println("<br>doEndTag");
			//count = 0;
		}catch( Exception e ) {
			e.printStackTrace();
		}
		
		return EVAL_PAGE;	// 태그 아래부분 코드 수행
		//return SKIP_PAGE;	// 태그 아래 부븐 코드수행 하지 않음
		
	}
	
}
