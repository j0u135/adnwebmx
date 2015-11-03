package com.adn.controlador;

public class PrioridadMes {

	private int idPrioridadMes;
	private int idPrioridad;
	private String mes;
	private String anio;
	private String avanceProgramado;
	private String avanceReal;
	private String avanceInicial;
	private String estatus;
	private String peso;
	
	public int getIdPrioridadMes() {
		return idPrioridadMes;
	}

	public void setIdPrioridadMes(int idPrioridadMes) {
		this.idPrioridadMes = idPrioridadMes;
	}

	public int getIdPrioridad() {
		return idPrioridad;
	}

	public void setIdPrioridad(int idPrioridad) {
		this.idPrioridad = idPrioridad;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getAnio() {
		return anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public String getAvanceProgramado() {
		return avanceProgramado;
	}

	public void setAvanceProgramado(String avanceProgramado) {
		this.avanceProgramado = avanceProgramado;
	}

	public String getAvanceReal() {
		return avanceReal;
	}

	public void setAvanceReal(String avanceReal) {
		this.avanceReal = avanceReal;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public PrioridadMes() {
		// TODO Auto-generated constructor stub
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getAvanceInicial() {
		return avanceInicial;
	}

	public void setAvanceInicial(String avanceInicial) {
		this.avanceInicial = avanceInicial;
	}

}
