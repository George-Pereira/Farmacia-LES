package com.fatec.farmacia.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fatec.farmacia.model.Carrinho;
import com.fatec.farmacia.model.Produto;
import com.fatec.farmacia.persistence.DaoCompra;
import com.fatec.farmacia.persistence.IntDaoCompra;

@WebServlet("/comprar")
public class ServletCompra extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		comprar(req,resp);
	}

	private void comprar(HttpServletRequest req, HttpServletResponse resp) 
	{
		Carrinho cart = (Carrinho) req.getSession().getAttribute("CARRINHO");
		IntDaoCompra dao = new DaoCompra();
		try 
		{
			long idCompra = dao.getIdCompra(cart.getIdCliente());
			for(Produto p : cart.getCart()) 
			{
				dao.comprar(p, cart.getIdCliente(),idCompra);
				cart.getCart().clear();
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
