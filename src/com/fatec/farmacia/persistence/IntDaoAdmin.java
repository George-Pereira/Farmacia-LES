package com.fatec.farmacia.persistence;

import java.sql.SQLException;

import com.fatec.farmacia.model.Administrador;

public interface IntDaoAdmin 
{
	public Administrador autenticaAdmin(String user, String senha) throws SQLException;
}