package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PagingListRst
 */
public class PagingListRst extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PagingListRst() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType( "text/html; charset=euc-kr" );
		PrintWriter out = response.getWriter();
		
		String tmp = null;
		tmp = ( request.getParameter("allCount") );
		tmp = ( tmp.equals("")?"0":tmp );
		int allCount = Integer.valueOf(tmp);
		tmp = request.getParameter("pageContentCount");
		tmp = ( tmp.equals("")?"0":tmp );
		int pageContentCount =  Integer.valueOf(tmp);
		tmp =  request.getParameter("pageViewMaxCount");
		tmp = ( tmp.equals("")?"0":tmp );
		int pageViewMaxCount =  Integer.valueOf(tmp);
		tmp =  request.getParameter("selectPageNum");
		tmp = ( tmp.equals("")?"0":tmp );
		int selectPageNum =  Integer.valueOf(tmp);
		
		/// 셋팅값
		out.write("전체게시물 갯수 : ");
		out.write(allCount+"");
		out.write("<br>");
		out.write("페이지당 게시물 갯수 : ");
		out.write(pageContentCount+"");
		out.write("<br>");
		out.write("페이지당 보이는 페이지 수 : ");
		out.write(pageViewMaxCount+"");
		out.write("<br>");
		out.write("선택 페이지 : ");
		out.write(selectPageNum+"");
		out.write("<br>");
		
		//page
		out.write("<html>");
		out.write("<head>");
		out.write("<title>Paging</title>");
		out.write("</head>");
		out.write("<body>");
		
		//출력 테이블
				if( allCount <= 0 ) {
					out.write("출력값이 없습니다");
				}else {
					out.write("<table border=1>");
					
					for( int i=0; i<pageContentCount; i++ ) {
						if( (allCount-i-(selectPageNum-1)*pageContentCount) <= 0 ) {
							out.write("<tr>");
							out.write("<td width='100'>");
								out.write( "&nbsp;" );
							out.write("</td>");
							out.write("<td width='100'>");
								out.write( "&nbsp;" );
							out.write("</td>");
							out.write("</tr>");
						}else {
							out.write("<tr>");
							out.write("<td width='100'>");
								out.write( i+"" );
							out.write("</td>");
							out.write("<td width='100'>");
								out.write( (allCount-i-(selectPageNum-1)*pageContentCount)+"" );
							out.write("</td>");
							out.write("</tr>");
						}
					}
					out.write("<tr>");
					out.write("<td colspan='2' align=center >");
						int s = allCount/pageContentCount;
						int c = allCount%pageContentCount;
						if( c != 0 ) {
							s++;
						}
						if( selectPageNum > 1 ) {
							out.write("<");
						}
						for( int i=selectPageNum; i<selectPageNum+pageViewMaxCount ; i++ ) {
							
							if( selectPageNum==i ) {
								out.write( "("+i+")" );
							}else {
								out.write( "["+i+"]" );
							}
							if( s <= i ) {
								break;
							}
						}//for
						if( s-selectPageNum >= pageViewMaxCount ) {
							out.write(">");
						}
					out.write("</td>");
					out.write("</tr>");
					
					out.write("</table>");
				}
		
		out.write("</body>");
		out.write("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
