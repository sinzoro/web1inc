package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetCookieViewServlet
 */
public class SetCookieViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SetCookieViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		
		Cookie[] ckArr = request.getCookies();

		for( Cookie ck : ckArr ) {
			out.write( ck.toString() );
			out.write( " : " );
			out.write( ck.getName() );
			out.write( " : " );
			out.write( ck.getValue() );
			out.write( " : " );
			out.write( "<br>" );
		}
		///
		String id = null;
		String pw = null;
		String name = null;
		if( ckArr != null && ckArr.length > 0 ) {
		for( Cookie ck : ckArr ) {
			name = ck.getName();
			if( name.equals("id") ) {
				id = ck.getValue();
			}//if
			if( name.equals("pw") ) {
				pw = ck.getValue();
			}//if
			out.write( ck.getName() +"<br>");
		}//for
		}//if
		// 쿠키 바로 삭제
		if( ckArr != null & ckArr.length > 0 ) {
			
			for( int i=0; i<ckArr.length; i++ ) {
				if( ckArr[i].getName().equals("id") ) {
					Cookie cookie = new Cookie( "id", "" );
					cookie.setMaxAge(3);
					response.addCookie(cookie);
				}
			}
			
		}
		
		out.write( "<html>" );
		out.write( "<body>" );
		out.write( "id : "+id );
		out.write( "<br>" );
		out.write( "pw : "+pw );
		out.write( "<br>" );
		out.write( "</body>" );
		out.write( "</html>" );
		
	}

}
