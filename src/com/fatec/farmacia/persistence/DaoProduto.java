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
}
