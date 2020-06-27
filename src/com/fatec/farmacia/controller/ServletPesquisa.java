package com.fatec.farmacia.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fatec.farmacia.model.Produto;
import com.fatec.farmacia.persistence.DaoProduto;
import com.fatec.farmacia.persistence.IntDaoProduto;

public class ServletPesquisa extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
		pesquisar(req, resp);
	}

	private void pesquisar(HttpServletRequest req, HttpServletResponse resp) 
	{
		String chavePesq = req.getParameter("ip_pesquisa");
		List<Produto> lista = new LinkedList<Produto>();
		IntDaoProduto dao = new DaoProduto();
		try 
		{
			lista = dao.getProdutoporChave(chavePesq);
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
