package com.fatec.farmacia.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fatec.farmacia.model.Carrinho;
import com.fatec.farmacia.model.Produto;
import com.fatec.farmacia.model.Produtos_Venda;

public interface IntDaoCompra 
{
	List<Produtos_Venda> construirRelatorio() throws SQLException;
	public void comprar(Produto prod, long idCli, long idCompra) throws SQLException;
	public long getIdCompra(long idCli) throws SQLException;
}
