package com.adn.controlador;

public class Diagrama {
	
	private int idDiagrama;
	private int idDeparatamento;
	private int idArea;
	private String fhCreacion;
	private String creadoPor;
	
	public Diagrama() {
		super();
		// TODO Auto-generated constructor stub
	}
		
	public Diagrama(int idDiagrama, int idDeparatamento, int idArea,
			String fhCreacion, String creadoPor) {
		super();
		this.idDiagrama = idDiagrama;
		this.idDeparatamento = idDeparatamento;
		this.idArea = idArea;
		this.fhCreacion = fhCreacion;
		this.creadoPor = creadoPor;
	}
	
	public Diagrama(int idArea, String fhCreacion, String creadoPor) {
		super();
		this.idArea = idArea;
		this.fhCreacion = fhCreacion;
		this.creadoPor = creadoPor;
	}

	public int getIdDiagrama() {
		return idDiagrama;
	}
	public void setIdDiagrama(int idDiagrama) {
		this.idDiagrama = idDiagrama;
	}
	public int getIdDeparatamento() {
		return idDeparatamento;
	}
	public void setIdDeparatamento(int idDeparatamento) {
		this.idDeparatamento = idDeparatamento;
	}
	public int getIdArea() {
		return idArea;
	}
	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}
	public String getFhCreacion() {
		return fhCreacion;
	}
	public void setFhCreacion(String fhCreacion) {
		this.fhCreacion = fhCreacion;
	}
	public String getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(String creadoPor) {
		this.creadoPor = creadoPor;
	}
}
