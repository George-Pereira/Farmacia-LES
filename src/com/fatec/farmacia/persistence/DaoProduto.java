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
			prod.setDetalhes(res.getString("Detalhe"));
			itensLoja.add(prod);
		}
		return itensLoja;
	}
	public Produto getProduto(long idProduto) throws SQLException 
	{
		Produto resultado = new Produto();
		String sql = "SELECT prod.id, prod.re_nome, t.classe, prod.re_preco, prod.re_resu, prod.re_quant FROM remedio prod INNER JOIN tipo t ON prod.re_idtipo = t.id WHERE prod.id = ?";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setLong(1, idProduto);
		ResultSet result = stmt.executeQuery();
		if(result.next()) 
		{
			resultado.setIdRemedio(result.getLong("id"));
			resultado.setDetalhes(result.getString("re_resu"));
			resultado.setNomeRemedio(result.getString("re_nome"));
			resultado.setValUnit(result.getDouble("re_preco"));
			resultado.setTipoRemedio(result.getString("classe"));
			resultado.setQuantEst(result.getInt("re_quant"));
		}
		return resultado;
	}
}
