package com.fatec.farmacia.controller;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
		try {
			cadastrar(req,resp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private void cadastrar(HttpServletRequest req, HttpServletResponse resp) throws ParseException 
	{
		Cliente cli = new Cliente();
		Endereco end = new Endereco();
		cli.setPrimeiroNome(req.getParameter("Input_Nome"));
		cli.setSobreNome(req.getParameter("Input_Sobrenome"));
		cli.setCpf(req.getParameter("Input_CPF"));
		String dn = req.getParameter("Input_Data");
		Date dia = new SimpleDateFormat("dd/MM/yyyy").parse(dn);
		java.sql.Date dtNascimento = new java.sql.Date(dia.getTime());
		cli.setNascimento(dtNascimento);
		System.out.println(cli.getNascimento());
		cli.setTelfixo(req.getParameter("Input_TelRes"));
		cli.setTelcel(req.getParameter("Input_Cel"));
		cli.setEmail(req.getParameter("Input_Email"));
		cli.setSenha(req.getParameter("InputSenha"));
		cli.setSexo(req.getParameter("Input_Sexo"));
		IntDaoCliente daocli = new DaoCliente();
		end.setCep(req.getParameter("Input_CEP"));
		end.setLogradouro(req.getParameter("Input_Rua"));
		end.setPorta(Integer.parseInt(req.getParameter("Input_Numero")));
		end.setComplemento("Input_Complemento");
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
