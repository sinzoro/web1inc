package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionAttributeView
 */
public class SessionAttributeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionAttributeView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		HttpSession session = request.getSession();
//		
//		String name = (String) session.getAttribute("name");
//		String content = (String) session.getAttribute("content");
//		String city = (String) session.getAttribute("city");
//		String sradio = (String) session.getAttribute("sradio");
//		String pet = (String) session.getAttribute("pet");
		
		ServletContext application = getServletConfig().getServletContext();
		
		String name = (String) application.getAttribute("name");
		String content = (String) application.getAttribute("content");
		String city = (String) application.getAttribute("city");
		String sradio = (String) application.getAttribute("sradio");
		String pet = (String) application.getAttribute("pet");
		
		PrintWriter out = response.getWriter();
		
    	out.write( name +"<br>" );
    	out.write( content +"<br>" );
    	out.write( city +"<br>" );
    	out.write( sradio +"<br>" );
    	out.write( pet +"<br>" );
    	
    	
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
