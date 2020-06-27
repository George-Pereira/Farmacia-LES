package com.fatec.farmacia.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fatec.farmacia.model.Produto;

public interface IntDaoProduto 
{
	public List<Produto> getTodosProd() throws SQLException;
	public Produto getProduto(long idProd) throws SQLException;
}
