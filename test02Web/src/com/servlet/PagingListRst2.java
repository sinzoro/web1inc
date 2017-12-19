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
public class PagingListRst2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PagingListRst2() {
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
		tmp = ( tmp==null?"100":tmp );
		tmp = ( tmp.equals("")?"100":tmp );
		int allCount = Integer.valueOf(tmp);
		tmp = request.getParameter("pageContentCount");
		tmp = ( tmp==null?"10":tmp );
		tmp = ( tmp.equals("")?"10":tmp );
		int pageContentCount =  Integer.valueOf(tmp);
		tmp =  request.getParameter("pageViewMaxCount");
		tmp = ( tmp==null?"10":tmp );
		tmp = ( tmp.equals("")?"10":tmp );
		int pageViewMaxCount =  Integer.valueOf(tmp);
		tmp =  request.getParameter("selectPageNum");
		tmp = ( tmp==null?"1":tmp );
		tmp = ( tmp.equals("")?"1":tmp );
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
							out.write("<td width='200'>");
								out.write( "&nbsp;" );
							out.write("</td>");
							out.write("<td width='200'>");
								out.write( "&nbsp;" );
							out.write("</td>");
							out.write("</tr>");
						}else {
							out.write("<tr>");
							out.write("<td width='200'>");
								out.write( i+"" );
							out.write("</td>");
							out.write("<td width='200'>");
								out.write( (allCount-i-(selectPageNum-1)*pageContentCount)+"" );
							out.write("</td>");
							out.write("</tr>");
						}
					}
					out.write("<tr>");
					out.write("<td colspan='2' align=center >");
						out.write("<table border='0'>");
						out.write("<tr>");
							int s = allCount/pageContentCount;
							int c = allCount%pageContentCount;
							int sels = (selectPageNum-1)/pageViewMaxCount;
							int selc = selectPageNum%pageViewMaxCount;
							if( c != 0 ) {
								s++;
							}
							if( selc != 0 ) {
								//sels++;
							}
							if( sels >= 1 ) {
								out.write( "<td><a href='/test02Web/PagingListRst2?allCount="+allCount+"&pageContentCount="+pageContentCount
										+"&pageViewMaxCount="+pageViewMaxCount+"&selectPageNum="
										+(selectPageNum-pageViewMaxCount<1?1:selectPageNum-pageViewMaxCount)+ "' target='_self'><</a></td>" );
							}
							for( int i=(sels*pageViewMaxCount)+1; i<=(sels*pageViewMaxCount)+pageViewMaxCount ; i++ ) {
								
								if( selectPageNum==i ) {
									out.write( "<td><a href='/test02Web/PagingListRst2?allCount="+allCount+"&pageContentCount="+pageContentCount
											+"&pageViewMaxCount="+pageViewMaxCount+"&selectPageNum="+i+" ' target='_self'>("+i+")</a></td>" );
								}else {
									out.write( "<td><a href='/test02Web/PagingListRst2?allCount="+allCount+"&pageContentCount="+pageContentCount
											+"&pageViewMaxCount="+pageViewMaxCount+"&selectPageNum="+i+ "' target='_self'>["+i+"]</a></td>" );
								}
								if( s <= i ) {
									break;
								}
							}//for
							if( s/pageViewMaxCount > sels ) {
								out.write( "<td><a href='/test02Web/PagingListRst2?allCount="+allCount+"&pageContentCount="+pageContentCount
										+"&pageViewMaxCount="+pageViewMaxCount+"&selectPageNum="
										+(selectPageNum+pageViewMaxCount>s?s:selectPageNum+pageViewMaxCount)+ "' target='_self'>></a></td>" );
							}

						out.write("</tr>");
						out.write("</table>");
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
