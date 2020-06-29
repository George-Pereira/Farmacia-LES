package com.fatec.farmacia.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class ServletLogout extends HttpServlet 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ServletLogout() {
        super();
    }
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        if(session.getAttribute("CLIENTE") != null){
            session.removeAttribute("CLIENTE");
            session.invalidate();
            resp.sendRedirect("login.jsp");
        }
        if(session.getAttribute("ADMIN") != null) 
        {
        	session.removeAttribute("ADMIN");
        	session.invalidate();
            resp.sendRedirect("login.jsp");
        }
	}
}
