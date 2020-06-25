package com.fatec.farmacia.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fatec.farmacia.model.Cliente;
import com.fatec.farmacia.model.Endereco;
import com.fatec.farmacia.persistence.DaoCliente;
import com.fatec.farmacia.persistence.IntDaoCliente;


@WebServlet("/cadastrar")
public class ServletCadastro extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		cadastrar(req,resp);
	}

	private void cadastrar(HttpServletRequest req, HttpServletResponse resp) 
	{
		Cliente cli = new Cliente();
		Endereco end = new Endereco();
		cli.setPrimeiroNome(req.getParameter("fnome"));
		cli.setSobreNome(req.getParameter("lnome"));
		cli.setCpf(req.getParameter("cpf"));
		cli.setEmail(req.getParameter("email"));
		cli.setSenha(req.getParameter("pass"));
		IntDaoCliente daocli = new DaoCliente();
		end.setCep(req.getParameter("cep"));
		end.setLogradouro(req.getParameter("lograd"));
		end.setPorta(Integer.parseInt(req.getParameter("num")));
		try {
			daocli.cadastraCliente(cli,end);
			resp.sendRedirect("./login.jsp");
		}
		catch (SQLException | IOException e) 
		{
			e.printStackTrace();
		}
	}
}
