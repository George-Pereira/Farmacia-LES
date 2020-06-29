package com.fatec.farmacia.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fatec.farmacia.model.Carrinho;
import com.fatec.farmacia.model.Produto;

@WebServlet("/remover")
public class ServletRemove extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Carrinho cart = (Carrinho)req.getSession().getAttribute("CARRINHO");
		long id = Integer.parseInt(req.getParameter("id"));
		for(Produto p : cart.getCart()) 
		{
			if(p.getIdRemedio() == id) 
			{
				cart.getCart().remove(p);
				break;
			}
		}
		resp.sendRedirect("./carrinho.jsp");
	}
}
