package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

/**
 * Servlet implementation class SetCookieServlet
 */
public class SetCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Cookie idCookie = new Cookie("id", id);
		Cookie pwCookie = new Cookie("pw", pw);
		
		//idCookie.setMaxAge( 3 );	// response.addCookie ������ ���� �ؾ��� - �����غ��� �翬�Ѱų�.. ���� �ٿ� ��
		//idCookie.setMaxAge(0);
		//idCookie.setPath("/temp");
		//idCookie.setDomain("localhost");
		//idCookie.setDomain("www.daum.net");
		
		response.addCookie(idCookie);
		response.addCookie(pwCookie);
		//response.flushBuffer();
		
		//idCookie.setMaxAge( 3 );	// response.addCookie ������ ���� �ؾ��� (����ȵ�)
		/// ������ �̵� �� ���� �ؾ��� ��Ű�� �� �޾���
//		Cookie[] cookies = request.getCookies();
//		String name = null;
//		if( cookies != null && cookies.length > 0 ) {
//			for( Cookie c : cookies ) {
//				name = c.getName();
//				System.out.println( "name : " +name );
//				if( "id".equals(name) ) {
//					c = new Cookie( "id","" );
//					c.setMaxAge(3);
//					response.addCookie(c);
//				}
//				if( "pw".equals(name) ) {
//					c = new Cookie( "pw","" );
//					c.setMaxAge(3);
//					response.addCookie(c);
//				}
//			}
//		}		
		
		System.out.println( id );
		response.sendRedirect("/test02Web/stj01/SetCookieViewServlet");
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
