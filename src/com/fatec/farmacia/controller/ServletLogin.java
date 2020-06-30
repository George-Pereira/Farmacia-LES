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

import com.fatec.farmacia.model.Administrador;
import com.fatec.farmacia.model.Carrinho;
import com.fatec.farmacia.model.Cliente;
import com.fatec.farmacia.persistence.DaoAdmin;
import com.fatec.farmacia.persistence.DaoCliente;
import com.fatec.farmacia.persistence.IntDaoAdmin;
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
		String user = req.getParameter("InputEmail");
		String pass = req.getParameter("InputSenha");
		try 
		{
			if(user.contains("@admin.com")) 
			{
				IntDaoAdmin dao = new DaoAdmin();
				Administrador adm = dao.autenticaAdmin(user, pass);
				if(adm.getEmail().equals(user)) 
				{
					if(adm.getSenha().equals(pass)) 
					{
						req.getSession().setAttribute("ADMIN", adm);
						resp.sendRedirect("./relatorio.jsp");
					}
				}
				else 
				{
					resp.sendRedirect("./login.jsp");
				}
			}
			else 
			{
				IntDaoCliente dao = new DaoCliente();
				cli = dao.autenticaAcesso(user, pass);
				if(cli != null)
				{
					HttpSession session = req.getSession();
					session.setAttribute("CLIENTE", cli);
					Carrinho cartCli = new Carrinho();
					cartCli.setIdCliente(cli.getId());
					session.setAttribute("CARRINHO", cartCli);
					resp.sendRedirect("./principal.jsp");
				}
				else
				{
					resp.sendRedirect("./login.jsp");
				}
			}
		}
		catch (SQLException | IOException e) 
		{
			e.printStackTrace();
		}
	}
}
