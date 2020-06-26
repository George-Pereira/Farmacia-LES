package com.fatec.farmacia.controller;
import java.sql.SQLException;
import java.util.Date;
import java.io.IOException;
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
		cli.setPrimeiroNome(req.getParameter("Input_Nome"));
		cli.setSobreNome(req.getParameter("Input_Sobrenome"));
		cli.setCpf(req.getParameter("Input_CPF"));
		@SuppressWarnings("deprecation")
		long data = java.util.Date.parse(req.getParameter("Input_Data"));
		Date nasc = new Date();
		nasc.setTime(data);
		cli.setNascimento(nasc);
		cli.setTelfixo(req.getParameter("Input_TelRes"));
		cli.setTelcel(req.getParameter("Input_Cel"));
		cli.setEmail(req.getParameter("Input_Email"));
		cli.setSenha(req.getParameter("InputSenha"));
		cli.setSexo(req.getParameter("Input_Sexo"));
		IntDaoCliente daocli = new DaoCliente();
		end.setCep(req.getParameter("Input_CEP"));
		end.setLogradouro(req.getParameter("Input_Rua"));
		end.setPorta(Integer.parseInt(req.getParameter("Input_Numero")));
		end.setCidade(req.getParameter("Input_Cidade"));
		end.setBairro(req.getParameter("Input_Bairro"));
		end.setUf(req.getParameter("Input_Estado"));
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
