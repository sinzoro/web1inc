package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetParameterNames
 */
public class GetParameterNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetParameterNames() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		Enumeration<String> er =  request.getParameterNames();

		String sss = null;
		String[] sss2 = null;
		while( er.hasMoreElements() ) {
			//System.out.println( er.nextElement() );
			sss = er.nextElement();
			out.write( sss +" : " );
			sss2 = request.getParameterValues(sss);
			for( int i=0; i<sss2.length ; i++ ) {
				out.write( sss2[i] +"&nbsp;&nbsp;" );
			}
			out.write( "<p>" );
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
