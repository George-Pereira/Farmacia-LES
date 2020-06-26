package com.fatec.farmacia.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fatec.farmacia.model.Produtos_Venda;

public interface IntDaoCompra 
{
	List<Produtos_Venda> construirRelatorio() throws SQLException;
}
