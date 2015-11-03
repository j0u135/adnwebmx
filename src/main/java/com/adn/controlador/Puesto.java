package com.adn.controlador;

public class Puesto {
	 
	 private int idArea;
	 private int idDepartamento;
	 private int idDiagrama;
	 private int idPuesto;
	 private String color;
	 private String creadoPor;
	 private String descPuesto;
	 private String fhCreacion;
	 private String indCtrlAsoc;
	 private String indEstratAsoc;
	 private String nbPuesto;
	 private int nuNodoArbol;
	 private int nuNodoPadre;
	 
	public Puesto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Puesto(int idArea, int idDepartamento, int idDiagrama, int idPuesto,
			String color, String creadoPor, String descPuesto,
			String fhCreacion, String indCtrlAsoc, String indEstratAsoc,
			String nbPuesto, int nuNodoArbol, int nuNodoPadre) {
		super();
		this.idArea = idArea;
		this.idDepartamento = idDepartamento;
		this.idDiagrama = idDiagrama;
		this.idPuesto = idPuesto;
		this.color = color;
		this.creadoPor = creadoPor;
		this.descPuesto = descPuesto;
		this.fhCreacion = fhCreacion;
		this.indCtrlAsoc = indCtrlAsoc;
		this.indEstratAsoc = indEstratAsoc;
		this.nbPuesto = nbPuesto;
		this.nuNodoArbol = nuNodoArbol;
		this.nuNodoPadre = nuNodoPadre;
	}


	public int getIdArea() {
		return idArea;
	}
	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}
	public int getIdDepartamento() {
		return idDepartamento;
	}
	public void setIdDepartamento(int idDepartamento) {
		this.idDepartamento = idDepartamento;
	}
	public int getIdDiagrama() {
		return idDiagrama;
	}
	public void setIdDiagrama(int idDiagrama) {
		this.idDiagrama = idDiagrama;
	}
	public int getIdPuesto() {
		return idPuesto;
	}
	public void setIdPuesto(int idPuesto) {
		this.idPuesto = idPuesto;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(String creadoPor) {
		this.creadoPor = creadoPor;
	}
	public String getDescPuesto() {
		return descPuesto;
	}
	public void setDescPuesto(String descPuesto) {
		this.descPuesto = descPuesto;
	}
	public String getFhCreacion() {
		return fhCreacion;
	}
	public void setFhCreacion(String fhCreacion) {
		this.fhCreacion = fhCreacion;
	}
	public String getIndCtrlAsoc() {
		return indCtrlAsoc;
	}
	public void setIndCtrlAsoc(String indCtrlAsoc) {
		this.indCtrlAsoc = indCtrlAsoc;
	}
	public String getIndEstratAsoc() {
		return indEstratAsoc;
	}
	public void setIndEstratAsoc(String indEstratAsoc) {
		this.indEstratAsoc = indEstratAsoc;
	}
	public String getNbPuesto() {
		return nbPuesto;
	}
	public void setNbPuesto(String nbPuesto) {
		this.nbPuesto = nbPuesto;
	}
	public int getNuNodoArbol() {
		return nuNodoArbol;
	}
	public void setNuNodoArbol(int nuNodoArbol) {
		this.nuNodoArbol = nuNodoArbol;
	}
	public int getNuNodoPadre() {
		return nuNodoPadre;
	}
	public void setNuNodoPadre(int nuNodoPadre) {
		this.nuNodoPadre = nuNodoPadre;
	}
	 	 
}
