package com.servlet.stj01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionAttribute
 */
public class SessionAttribute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionAttribute() {
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
    	
//    	HttpSession session = request.getSession(false);
//    	
//    	session.setAttribute("name", name);
//    	session.setAttribute("content", content);
//    	session.setAttribute("city", city);
//    	session.setAttribute("sradio", sradio);
//    	session.setAttribute("pet", pet);

    	
    	/////
    	ServletContext application = getServletConfig().getServletContext();
    	application.setAttribute("name", name);
    	application.setAttribute("content", content);
    	application.setAttribute("city", city);
    	application.setAttribute("sradio", sradio);
    	application.setAttribute("pet", pet);
    	
    	
    	
    	response.sendRedirect( request.getSession().getServletContext().getContextPath()+"/stj01/SessionAttributeView" );    	
    	
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
