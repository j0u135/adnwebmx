package com.adn.controlador;

public class Arbol {

	private int idArbol;
	private int idArea;
	private String fhCreacion;
	private String creadoPor;
	
	
	public Arbol() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Arbol(int idArbol, int idArea, String fhCreacion, String creadoPor) {
		super();
		this.idArbol = idArbol;
		this.idArea = idArea;
		this.fhCreacion = fhCreacion;
		this.creadoPor = creadoPor;
	}
	
	public Arbol(int idArea, String fhCreacion, String creadoPor) {
		super();
		this.idArea = idArea;
		this.fhCreacion = fhCreacion;
		this.creadoPor = creadoPor;
	}


	public int getIdArbol() {
		return idArbol;
	}
	public void setIdArbol(int idArbol) {
		this.idArbol = idArbol;
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
