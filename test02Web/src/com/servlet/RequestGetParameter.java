package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestGetParameter
 */
public class RequestGetParameter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestGetParameter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String city = request.getParameter("city");
		String sradio = request.getParameter("sradio");
		String pet = request.getParameter("pet");
		
		String[] city2 = request.getParameterValues("city");
		String[] sradio2 = request.getParameterValues("sradio");
		String[] pet2 = request.getParameterValues("pet");
		
		out.write("<html>");
		out.write("<body>");
		out.write("<p> name : " + name);
		out.write("<p> content : " + content);
		out.write("<p> city : " + city);
		out.write("<p> sradio : " + sradio);
		out.write("<p> pet : " + pet);
		
		for( int i=0; i<city2.length ; i++ ) {
			out.write("<p> city2 : " + city2[i] );
		}
		for( int i=0; i<sradio2.length ; i++ ) {
			out.write("<p> sradio2 : " + sradio2[i] );
		}
		for( int i=0; i<pet2.length ; i++ ) {
			out.write("<p> pet2 : " + pet2 [i] );
		}
		
		
		out.write("</body>");
		out.write("</html>");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
