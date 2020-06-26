package com.fatec.farmacia.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fatec.farmacia.model.Cliente;
import com.fatec.farmacia.persistence.DaoCliente;
import com.fatec.farmacia.persistence.IntDaoCliente;

@WebServlet("/logon")
public class ServletLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		logar(req,resp);
	}

	private void logar(HttpServletRequest req, HttpServletResponse resp) 
	{
		Cliente cli;
		String user = req.getParameter("usuario");
		String pass = req.getParameter("senha");
		IntDaoCliente dao = new DaoCliente();
		try 
		{
			cli = dao.autenticaAcesso(user, pass);
			if(cli != null) 
			{
				resp.sendRedirect("./principal.jsp");
			}
			else 
			{
				resp.sendRedirect("./login.jsp");
			}
		}
		catch (SQLException | IOException e) 
		{
			e.printStackTrace();
		}
	}
}
