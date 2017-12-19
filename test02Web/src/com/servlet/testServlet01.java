package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class testServlet01
 */
public class testServlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testServlet01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//	
		response.setContentType("text/html; charset=euc-kr");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("<br>");
		response.getWriter().append("hello zoro");
		
		///
		
		///
		
		//response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<br>test zoro");
		
		// out.print( "" );
		out.print( "<html>" );
		out.print( "<boyd>" );
		out.print( "hello servlet zoro Ä²Ä² ¤Ð¤Ð" );
		out.print( "</body>" );
		out.print( "</html>" );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
