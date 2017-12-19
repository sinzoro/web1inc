package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class helloServletConfig3
 */
public class helloServletConfig3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public helloServletConfig3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset=euc-kr");	// Á© À­ÁÙ¿¡ ÇØ¾ß Àû¿ë?
		String name = getInitParameter("name");
		String job = getInitParameter("job");
		String ServletName = getServletName();
		
		ServletConfig config = getServletConfig();
		String name2 = config.getInitParameter("name");
		String job2 = config.getInitParameter("job");
		
		PrintWriter out = response.getWriter();
		out.print("<br>");
		out.print("<html>");
		out.print("<boyd>");
		out.print("name : "+name);
		out.print("<br>");
		out.print("name : "+name2);
		out.print("<p>");
		out.print("job : "+job);
		out.print("<br>");
		out.print("job : "+job2);
		out.print("<br>");
		out.print("servlet : "+ServletName);
		out.print("</boyd>");
		out.print("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
