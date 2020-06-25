package com.fatec.farmacia.persistence;

import java.sql.SQLException;

import com.fatec.farmacia.model.Cliente;
import com.fatec.farmacia.model.Endereco;

public interface IntDaoCliente 
{
	public Cliente autenticaAcesso(String user, String password) throws SQLException;
	public void cadastraCliente(Cliente cli, Endereco end) throws SQLException;
}
