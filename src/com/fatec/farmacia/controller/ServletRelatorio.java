package com.fatec.farmacia.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fatec.farmacia.model.Produtos_Venda;
import com.fatec.farmacia.persistence.DaoCompra;
import com.fatec.farmacia.persistence.IntDaoCompra;

public class ServletRelatorio extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		gerarRelatorio(req,resp);
	}

	private void gerarRelatorio(HttpServletRequest req, HttpServletResponse resp) 
	{
		IntDaoCompra daocomp = new DaoCompra();
		List<Produtos_Venda> lista = new LinkedList();
		try 
		{
			lista = daocomp.construirRelatorio();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
