package com.mx.diezx.adn.model;

public class HojaRuta {
	
	private int id;
	private int anio;
	private String estatus;
	private int mes;
	private String mes_palabra;
	private int resultado;
	private String usuario;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public int getMes() {
		return mes;
	}
	public void setMes(int mes) {
		this.mes = mes;
	}
	public int getResultado() {
		return resultado;
	}
	public void setResultado(int resultado) {
		this.resultado = resultado;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getMes_palabra() {
		return mes_palabra;
	}
	public void setMes_palabra(String mes_palabra) {
		this.mes_palabra = mes_palabra;
	}

}
