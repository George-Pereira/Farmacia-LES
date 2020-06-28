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
import com.fatec.farmacia.persistence.DaoProduto;
import com.fatec.farmacia.persistence.IntDaoProduto;
@WebServlet("/add")
public class ServletAdd extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		addCarrinho(req, resp);
	}
	private void addCarrinho(HttpServletRequest req, HttpServletResponse resp) 
	{
		String idProd = (req.getParameter("idprod"));
		long id = Integer.parseInt(idProd);
		int qtn = Integer.parseInt(req.getParameter("qtd"));
		Carrinho cart = (Carrinho) req.getSession().getAttribute("CARRINHO");
		Produto prod = new Produto();
		IntDaoProduto dao = new DaoProduto();
		try 
		{
			prod = dao.getProduto(id);
			prod.setQuant(qtn);
			cart.getCart().add(prod);
			resp.sendRedirect("./carrinho.jsp");
		}
		catch (SQLException | IOException e) 
		{
			e.printStackTrace();
		}
	}
}

