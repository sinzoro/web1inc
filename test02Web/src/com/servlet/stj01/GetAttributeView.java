package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetAttributeView
 */
public class GetAttributeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAttributeView() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	response.setContentType("text/html charset=euc-kr"); 
    	PrintWriter out = response.getWriter();
    	
    	out.write( "<p>" + (String)request.getAttribute("name") );
    	out.write( "<p>" + (String)request.getAttribute("content") );
    	out.write( "<p>" + (String)request.getAttribute("city") );
    	out.write( "<p>" + (String)request.getAttribute("sradio") );
    	out.write( "<p>" );
    	if( request.getAttribute("pet2") != null ) {
    		String[] attributePet = (String[])request.getAttribute("pet2");
    		attributePet = (attributePet==null?new String[0]:attributePet);
    		for( String n : attributePet ) {
    			out.write( "pet : " + n );
    			out.write( "<br>" );
    		}
    	}
    	
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
