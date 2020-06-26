package com.fatec.farmacia.model;

public class Remedio 
{
	private long idRemedio;
	private String nomeRemedio;
	private String tipoRemedio;
	private double valUnit;
	private String detalhes;
	public long getIdRemedio() 
	{
		return idRemedio;
	}
	public void setIdRemedio(long idRemedio) 
	{
		this.idRemedio = idRemedio;
	}
	public String getNomeRemedio() 
	{
		return nomeRemedio;
	}
	public void setNomeRemedio(String nomeRemedio) 
	{
		this.nomeRemedio = nomeRemedio;
	}
	public String getTipoRemedio() 
	{
		return tipoRemedio;
	}
	public void setTipoRemedio(String tipoRemedio) 
	{
		this.tipoRemedio = tipoRemedio;
	}
	public double getValUnit() {
		return valUnit;
	}
	public void setValUnit(double valUnit) {
		this.valUnit = valUnit;
	}
	public String getDetalhes() {
		return detalhes;
	}
	public void setDetalhes(String detalhes) {
		this.detalhes = detalhes;
	}
}
