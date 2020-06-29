package com.fatec.farmacia.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import com.fatec.farmacia.model.Carrinho;
import com.fatec.farmacia.model.Produto;
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
		String sql = "SELECT * FROM f_relatorio()";
		PreparedStatement stmt = connect.prepareStatement(sql);
		ResultSet result = stmt.executeQuery();
		while(result.next())
		{
			Produtos_Venda pv = new Produtos_Venda();
			pv.setId(result.getLong("cod_Prod"));
			pv.setNome(result.getString("nome_Prod"));
			PreparedStatement state = connect.prepareStatement("SELECT preco FROM produtos WHERE id = ?");
			state.setLong(1, pv.getId());
			ResultSet preco = state.executeQuery();
			if(preco.next()) 
			{
				pv.setPrecoUnit(preco.getDouble("preco"));
			}
			pv.setQtd(result.getInt("qntdVend"));
			pv.setReceita(result.getDouble("valor_prod") * pv.getQtd());
			pv.setDtCompra(result.getDate("dtcompra"));
			prodVendidos.add(pv);
		}
		return prodVendidos;
	}
	@Override
	public void comprar(Produto prod, long idCli, long idCompra) throws SQLException 
	{
		String sql = "{call sp_venda (?,?,?,?,?,?,?,?)}";
		CallableStatement stmt = connect.prepareCall(sql);
		stmt.setLong(1, idCompra);
		stmt.setLong(2, idCli);
		stmt.setLong(3, prod.getIdRemedio());
		stmt.setString(4, prod.getNomeRemedio());
		stmt.setString(5, prod.getTipoRemedio());
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		stmt.setDate(6, date);
		stmt.setInt(7, prod.getQuant());
		stmt.setDouble(8, prod.getValUnit());
		stmt.execute();
		stmt.close();
	}
	@Override
	public long getIdCompra(long idCli) throws SQLException {
		long id = 0;
		String sql = "SELECT id FROM compra WHERE cli_id = ?";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setLong(1, idCli);
		ResultSet res = stmt.executeQuery();
		while(res.next()) 
		{
			if(res.isLast()) 
			{
				id = (res.getLong("id") + 1);
			}
		}
		if(id == 0) 
		{
			id++;
		}
		res.close();
		stmt.close();
		return id;
	}
}
