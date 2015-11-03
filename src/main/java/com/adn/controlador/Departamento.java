package com.adn.controlador;

public class Departamento {

	int idArea;
	int idDepto;
	String nbDepto;
	String descDepto;
	String fhCreacion;
	String creadoPor;
	
	
	public Departamento() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Departamento(int idArea, int idDepto, String nbDepto,
			String descDepto, String fhCreacion, String creadoPor) {
		super();
		this.idArea = idArea;
		this.idDepto = idDepto;
		this.nbDepto = nbDepto;
		this.descDepto = descDepto;
		this.fhCreacion = fhCreacion;
		this.creadoPor = creadoPor;
	}

	public Departamento(int idArea, String nbDepto, String descDepto,
			String fhCreacion, String creadoPor) {
		super();
		this.idArea = idArea;
		this.nbDepto = nbDepto;
		this.descDepto = descDepto;
		this.fhCreacion = fhCreacion;
		this.creadoPor = creadoPor;
	}
	public int getIdArea() {
		return idArea;
	}
	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}
	public int getIdDepto() {
		return idDepto;
	}
	public void setIdDepto(int idDepto) {
		this.idDepto = idDepto;
	}
	public String getNbDepto() {
		return nbDepto;
	}
	public void setNbDepto(String nbDepto) {
		this.nbDepto = nbDepto;
	}
	public String getDescDepto() {
		return descDepto;
	}
	public void setDescDepto(String descDepto) {
		this.descDepto = descDepto;
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
