package com.fatec.farmacia.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		
	}
}
