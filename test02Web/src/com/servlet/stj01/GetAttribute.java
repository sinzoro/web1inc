package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetAttribute
 */
public class GetAttribute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAttribute() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html charset=euc-kr"); 
    	PrintWriter out = response.getWriter();
    	
    	String tmp = request.getParameter("name");
    	tmp = (tmp==null?"noText":tmp);
    	tmp = (tmp.equals("")?"noText":tmp);
    	String name = tmp;
    	tmp = request.getParameter("content");
    	tmp = (tmp==null?"noText":tmp);
    	tmp = (tmp.equals("")?"noText":tmp);
    	String content = tmp;
    	tmp = request.getParameter("city");
    	tmp = (tmp==null?"noText":tmp);
    	tmp = (tmp.equals("")?"noText":tmp);
    	String city = tmp;
    	tmp = request.getParameter("sradio");
    	tmp = (tmp==null?"noText":tmp);
    	tmp = (tmp.equals("")?"noText":tmp);
    	String sradio = tmp;
    	tmp = request.getParameter("pet");
    	tmp = (tmp==null?"noText":tmp);
    	tmp = (tmp.equals("")?"noText":tmp);
    	String pet = tmp;
    	
    	Enumeration<String> attr = request.getParameterNames();

    	
    	out.write( "<html>" );
    	out.write( "<head>" );
    	out.write( "</head>" );
    	out.write( "<body>" );
    	out.write( "--------------------" );
    	out.write( "<br>" );
    	String key = null;
    	while( attr.hasMoreElements() ) {
    		key = attr.nextElement();
    		//out.write( request.getp );
    		out.write( key+" : "+request.getParameter(key) );
    		out.write( "<br>" );
    	}

    	out.write( "<br>" );
    	out.write( "--------------------" );
    	Map<String, String[]> map = request.getParameterMap();
    	Set<String> keySet = map.keySet();
    	Iterator<String> it = keySet.iterator();
    	String tmp2[] = null;
    	while( it.hasNext() ) {
    		key = it.next();
    		tmp2 = map.get(key);
    		for( String str : tmp2 ) {
    			out.write( key+" : "+ str );
    		}
    		
    		out.write( "<br>" );
    	}
    	
    	out.write( "<br>" );
    	out.write( "--------------------" );
    	out.write( "<br>" );
    	out.write( "name : " + name );
    	out.write( "<br>" );
    	out.write( "content : " + content );
    	out.write( "<br>" );
    	out.write( "city : " + city );
    	out.write( "<br>" );
    	out.write( "sradio : " + sradio );
    	out.write( "<br>" );
    	String pet2[] = request.getParameterValues("pet");
    	pet2 = (pet2==null?new String[0]:pet2);
    	for( int i = 0 ; i<pet2.length ; i++ ) {
			out.write( "pet : " + pet2[i] +"<br>" );
		}

    	out.write( "<br>" );
    	out.write( "</body>" );
    	out.write( "</html>" );
    	
    	//
    	request.setAttribute("name", name);
    	request.setAttribute("content", content);
    	request.setAttribute("city", city);
    	request.setAttribute("sradio", sradio);
    	request.setAttribute("pet2", pet2);
    	//
//    	String url = "/stj01/GetAttributeView";
//    	RequestDispatcher dis = getServletContext().getRequestDispatcher(url);
//    	dis.forward(request, response);
    	
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
