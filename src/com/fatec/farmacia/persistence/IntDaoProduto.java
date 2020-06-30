package com.fatec.farmacia.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fatec.farmacia.model.Produto;

public interface IntDaoProduto 
{
	public List<Produto> getTodosProd() throws SQLException;
	public Produto getProduto(long idProd) throws SQLException;
	public List<Produto> getProdutosporChave(String chaves) throws SQLException;
	public Produto getProdutoNome(String nome) throws SQLException;
	public void insereProduto(Produto prod) throws SQLException;
	public void atualizaProd(Produto prod) throws SQLException;
}
