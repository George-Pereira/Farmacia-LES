package com.fatec.farmacia.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fatec.farmacia.model.Produtos_Venda;

public class DaoCompra implements IntDaoCompra
{

	@Override
	public List<Produtos_Venda> construirRelatorio() throws SQLException 
	{
		return null;
	}

}
