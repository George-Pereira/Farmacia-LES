package com.fatec.farmacia.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.fatec.farmacia.model.Produtos_Venda;

public class DaoCompra implements IntDaoCompra
{
	public Connection connect;
	public DaoCompra() 
	{
		IntDaoGenerica dao = new DaoGenerica();
		connect = dao.getConnection();
		
	}
	@Override
	public List<Produtos_Venda> construirRelatorio() throws SQLException 
	{
		List<Produtos_Venda> prodVendidos = new LinkedList<Produtos_Venda>();
		String sql = "SELECT * f_relatorio()";
		PreparedStatement stmt = connect.prepareStatement(sql);
		ResultSet result = stmt.executeQuery();
		while(result.next()) 
		{
			Produtos_Venda pv = new Produtos_Venda();
			pv.setId(result.getLong("cod_Prod"));
			pv.setNome(result.getString("nome_Prod"));
			pv.setReceitaProd(result.getDouble("valor_Prod"));
			pv.setQtd(result.getInt("qntdVend"));
			pv.setReceita((pv.getReceita() + result.getDouble("val_total")));
		}
		return prodVendidos;
	}

}
