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
	@Override
	public Produto getProdutoNome(String nome) throws SQLException 
	{
		String query = "SELECT id, nomeProd, idtipo, quantidade, descricao, preco FROM produtos WHERE nomeProd = ?";
		PreparedStatement stmt = connect.prepareStatement(query);
		stmt.setString(1, nome);
		Produto prod = new Produto();
		ResultSet result = stmt.executeQuery();
		if(result.next()) 
		{
			prod.setIdRemedio(result.getLong("id"));
			prod.setNomeRemedio(result.getString("nomeProd"));
			PreparedStatement state = connect.prepareStatement("SELECT categoria FROM tipo WHERE id = ?");
			state.setLong(1, result.getLong("idtipo"));
			ResultSet rs = state.executeQuery();
			if(rs.next()) 
			{
				prod.setTipoRemedio(rs.getString("categoria"));
			}
			rs.close();
			state.close();
			prod.setQuantEst(result.getInt("quantidade"));
			prod.setDetalhes(result.getString("descricao"));
			prod.setValUnit(result.getDouble("preco"));
		}
		return prod;
	}
	@Override
	public void insereProduto(Produto prod) throws SQLException 
	{
		String sql = "INSERT INTO produtos (nomeProd, idtipo, quantidade, descricao, preco) VALUES(?, ?, ?, ?, ?)";
		PreparedStatement state = connect.prepareStatement(sql);
		state.setString(1, prod.getNomeRemedio());
		PreparedStatement st = connect.prepareStatement("SELECT id FROM tipo WHERE categoria = ?");
		st.setString(1, prod.getTipoRemedio());
		ResultSet rs = st.executeQuery();
		if(rs.next())
		{
			long idCat = rs.getLong("id");
			state.setLong(2, idCat);
		}
		rs.close();
		st.close();
		state.setInt(3, prod.getQuantEst());
		state.setString(4, prod.getDetalhes());
		state.setDouble(5, prod.getValUnit());
		state.execute();
		state.close();
	}
	@Override
	public void atualizaProd(Produto prod) throws SQLException 
	{
		String sql = "UPDATE produtos SET nomeProd = ?, idtipo = ?, quantidade = ?, descricao = ?, preco = ? WHERE id = ?";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setString(1, prod.getNomeRemedio());
		PreparedStatement st = connect.prepareStatement("SELECT id FROM tipo WHERE categoria = ?");
		st.setString(1, prod.getTipoRemedio());
		ResultSet rs = st.executeQuery();
		if(rs.next())
		{
			stmt.setLong(2, rs.getLong("id"));
		}
		st.close();
		rs.close();
		stmt.setInt(3, prod.getQuantEst());
		stmt.setString(4, prod.getDetalhes());
		stmt.setDouble(5, prod.getValUnit());
		stmt.setLong(6, prod.getIdRemedio());
		stmt.execute();
		stmt.close();
	}
}
