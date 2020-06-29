package com.fatec.farmacia.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fatec.farmacia.model.Administrador;

public class DaoAdmin implements IntDaoAdmin
{
	private Connection connect;
	public DaoAdmin() 
	{
		IntDaoGenerica dao = new DaoGenerica();
		connect = dao.getConnection();
	}
	@Override
	public Administrador autenticaAdmin(String user, String senha) throws SQLException 
	{
		Administrador adm = new Administrador();
		String sql = "SELECT * FROM adm WHERE email = ? AND senha = ?";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setString(1, user);
		stmt.setString(2, senha);
		ResultSet rs = stmt.executeQuery();
		if(rs.next())
		{
			adm.setEmail(rs.getString("email"));
			adm.setSenha(rs.getString("senha"));
			adm.setNome(rs.getString("nome"));
		}
		return adm;
	}
}
