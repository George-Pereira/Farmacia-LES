package com.fatec.farmacia.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fatec.farmacia.model.Produto;
import com.fatec.farmacia.persistence.DaoProduto;
import com.fatec.farmacia.persistence.IntDaoProduto;

@WebServlet("/cadprod")
public class ServletPro extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	{
		String cmd = req.getParameter("cmd");
		String nome_prod = req.getParameter("Input_Nome");
		Produto prod = new Produto();
		IntDaoProduto dao = new DaoProduto();
		if(cmd.equals("pesquisar")) 
		{
			try 
			{
				
				prod = dao.getProdutoNome(nome_prod);
				if(req.getSession().getAttribute("PESQUISA") != null) 
				{
					req.getSession().removeAttribute("PESQUISA");
				}
				req.getSession().setAttribute("PESQUISA", prod);
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		else if(cmd.equals("cadastrar")) 
		{
			String catprod = req.getParameter("Input_Categoria");
			String desc = req.getParameter("Input_Descricao");
			String preco = req.getParameter("preco");
			double val = Double.parseDouble(preco.substring(2));
			int estq = Integer.parseInt(req.getParameter("Input_Estoque"));
			prod.setNomeRemedio(nome_prod);
			prod.setQuantEst(estq);
			prod.setValUnit(val);
			prod.setDetalhes(desc);
			prod.setTipoRemedio(catprod);
			try 
			{
				dao.insereProduto(prod);
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		else 
		{
			try 
			{
				prod = dao.getProdutoNome(nome_prod);
				String catprod = req.getParameter("Input_Categoria");
				String desc = req.getParameter("Input_Descricao");
				String preco = req.getParameter("preco");
				double val = Double.parseDouble(preco.substring(2));
				int estq = Integer.parseInt(req.getParameter("Input_Estoque"));
				prod.setNomeRemedio(nome_prod);
				prod.setQuantEst(estq);
				prod.setValUnit(val);
				prod.setDetalhes(desc);
				prod.setTipoRemedio(catprod);
				dao.atualizaProd(prod);
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		try 
		{
			resp.sendRedirect("./cadastroProd.jsp");
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}

	}
}