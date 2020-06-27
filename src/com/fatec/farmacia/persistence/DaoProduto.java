package com.fatec.farmacia.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.fatec.farmacia.model.Produto;

public class DaoProduto implements IntDaoProduto
{
	private Connection connect;
	public DaoProduto() 
	{
		IntDaoGenerica daogen = new DaoGenerica();
		connect = daogen.getConnection();
	}
	public List<Produto> getTodosProd() throws SQLException
	{
		List<Produto> itensLoja = new LinkedList<Produto>();
		String sql = "SELECT * FROM f_LisSimples()";
		PreparedStatement stmt = connect.prepareStatement(sql);
		ResultSet res = stmt.executeQuery();
		while(res.next()) 
		{
			Produto prod = new Produto();
			prod.setIdRemedio(res.getLong("id"));
			prod.setNomeRemedio(res.getString("Nome"));
			prod.setTipoRemedio(res.getString("Tipo"));
			prod.setValUnit(res.getDouble("Preco"));
			prod.setDetalhes(res.getString("Descricao"));
			itensLoja.add(prod);
		}
		return itensLoja;
	}
	public Produto getProduto(long idProduto) throws SQLException 
	{
		Produto resultado = new Produto();
		String sql = "SELECT prod.id, prod.nomeProd, t.categoria, prod.preco, prod.descricao, prod.quantidade FROM produtos prod INNER JOIN tipo t ON prod.idtipo = t.id WHERE prod.id = ?";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setLong(1, idProduto);
		ResultSet result = stmt.executeQuery();
		if(result.next()) 
		{
			resultado.setIdRemedio(result.getLong("id"));
			resultado.setDetalhes(result.getString("descricao"));
			resultado.setNomeRemedio(result.getString("nomeProd"));
			resultado.setValUnit(result.getDouble("preco"));
			resultado.setTipoRemedio(result.getString("categoria"));
			resultado.setQuantEst(result.getInt("quantidade"));
		}
		return resultado;
	}
	public List<Produto> getProdutosporChave(String chaves) throws SQLException
	{
		List<Produto> lista = new LinkedList<Produto>();
		String sql = "SELECT * FROM f_listagem(?)";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setString(1, chaves);
		ResultSet result = stmt.executeQuery();
		while(result.next()) 
		{
			Produto prod = new Produto();
			prod.setIdRemedio(result.getLong("Id"));
			prod.setNomeRemedio(result.getString("Nome"));
			prod.setQuantEst(result.getInt("Quantidade"));
			prod.setTipoRemedio(result.getString("Tipo"));
			prod.setValUnit(result.getDouble("Preco"));
			lista.add(prod);
		}
		return lista;
	}
}
