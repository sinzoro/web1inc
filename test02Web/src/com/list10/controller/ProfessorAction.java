package com.list10.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.list.service.ProfessorService;

/**
 * Servlet implementation class SampleAction
 */
public class ProfessorAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//String cmd = request.getParameter("cmd");
		
		String cmd = "select";
		if(cmd.equals("insert")) {
				// 등록
			
			
		}else if(cmd.equals("select")) {
			// search
			
			ProfessorService sSvc = new ProfessorService();
			ArrayList list = sSvc.getProfessorList();
			
			request.setAttribute("list", list);
			
			String url = "/stj10_jstl2/professorList.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
			
		}else if(cmd.equals("selectOne")) {
			
			
		}else if(cmd.equals("update")) {
			// 수정
			
		}else if(cmd.equals("delete")) {
			// 삭제
		
		}
		
		
	}

}



