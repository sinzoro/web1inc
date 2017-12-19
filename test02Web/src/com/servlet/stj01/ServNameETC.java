package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServNameETC
 */
public class ServNameETC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServNameETC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		out.write( "<html>" );
		out.write( "<body>" );
		out.write( "Server Name : "+ request.getServerName() +"<br>");
		out.write( "protocol : "+ request.getProtocol() +"<br>");
		out.write( "Server Port : "+ request.getServerPort() +"<br>");
		out.write( "Server method(get,post) : "+ request.getMethod() +"<br>");
		out.write( "Server logical root : "+ request.getSession().getServletContext().getRealPath("/") +"<br>");
		out.write( "Server virtual root : "+ request.getSession().getServletContext().getContextPath() +"<br>");
		out.write( "QueryString( get sytle ) : "+ request.getQueryString() +"<br>");
		out.write( "client ID(addr) : "+ request.getRemoteAddr() +"<br>");
		out.write( "client ID(host) : "+ request.getRemoteHost() +"<br>");
		out.write( "client ID(port) : "+ request.getRemotePort() +"<br>");
		out.write( "client ID(user) : "+ request.getRemoteUser() +"<br>");
		out.write( "befor page : "+ request.getHeader("Referer") +"<br>");
		out.write( "browser ver : "+ request.getHeader("User-Agent") +"<br>");
		out.write( "</body>" );
		out.write( "</html>" );
		
		System.out.println( "service" );
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.write( "<html>" );
		out.write( "<body>" );
		out.write( "doGet" );
		out.write( "</body>" );
		out.write( "</html>" );
		
		System.out.println( "doget" );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
