package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetParameterMap
 */
public class GetParameterMap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetParameterMap() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		Map<String, String[]> map = request.getParameterMap();
		
		Set<String> setKey  = map.keySet();
		Iterator<String> it = setKey.iterator();
		
		
		String[] DataTmp = null;
		String keyTmp = null;
		while( it.hasNext() ) {
			keyTmp = it.next();
			DataTmp = map.get( keyTmp );
			out.write(  keyTmp +" : " );
			for( int i=0; i< DataTmp.length ; i++ ) {
				out.write( DataTmp[i]+"&nbsp;&nbsp;" );
			}
			out.write( "<br>" );
		}//while
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
