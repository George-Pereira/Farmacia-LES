package com.fatec.farmacia.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fatec.farmacia.model.Cliente;
import com.fatec.farmacia.model.Endereco;

public class DaoCliente implements IntDaoCliente{
	private Connection connect;
	public DaoCliente() 
	{
		IntDaoGenerica daogen = new DaoGenerica();
		connect = daogen.getConnection();
	}
	@Override
	public Cliente autenticaAcesso(String user, String password) throws SQLException 
	{
		Cliente cli = null;
		String sql = "SELECT * FROM f_validaLogin(?,?)";
		PreparedStatement stmt = connect.prepareStatement(sql);
		stmt.setString(1, user);
		stmt.setString(2, password);
		ResultSet result = stmt.executeQuery();
		if(result.next()) 
		{
			cli = new Cliente();
			cli.setId(result.getLong("id"));
			cli.setPrimeiroNome(result.getString("fnome"));
			cli.setSobreNome(result.getString("lnome"));
			cli.setTelfixo(result.getString("telfixo"));
			cli.setTelcel(result.getString("telcel"));
			cli.setCpf(result.getString("cpf"));
			cli.setEmail(result.getString("email"));
			cli.setSenha(result.getString("senha"));
			cli.setSexo(result.getString("sexo"));
		}
		result.close();
		stmt.close();
		connect.close();
		return cli;
	}
	@Override
	public void cadastraCliente(Cliente cli, Endereco end) throws SQLException 
	{
		String sql = "{call sp_insercao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		CallableStatement state = connect.prepareCall(sql);
		state.setString(1, cli.getPrimeiroNome());
		state.setString(2, cli.getSobreNome());
		state.setString(3, cli.getCpf());
		state.setString(4, cli.getTelfixo());
		state.setString(5, cli.getTelcel());
		java.sql.Date dtsql = new Date(cli.getNascimento().getTime());
		state.setDate(6, dtsql);
		state.setString(7, cli.getEmail());
		state.setString(8, cli.getSenha());
		state.setString(9, cli.getSexo());
		state.setString(10, end.getCep());
		state.setString(11, end.getLogradouro());
		state.setInt(12, end.getPorta());
		state.setString(13, end.getComplemento());
		state.setString(14, end.getBairro());
		state.setString(15, end.getCidade());
		state.setString(16, end.getUf());
		state.execute();
		System.out.println("Inserção realizada");
		state.close();
		connect.close();
	}
}
