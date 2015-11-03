package com.adn.controlador;

public class Area {
	 
	 private String area;
	 private String descripcion;
	 private String idArea;
	 
	 /**
	 * @return the idArea
	 */
	public String getIdArea() {
		return idArea;
	}
	/**
	 * @param idArea the idArea to set
	 */
	public void setIdArea(String idArea) {
		this.idArea = idArea;
	}
	public String getArea() {
	  return area;
	 }
	 public void setArea(String area) {
	  this.area = area;
	 }
	 
	 public String getDescripcion() {
		  return descripcion;
		 }
	public void setDescripcion(String descripcion) {
	  this.descripcion = descripcion;
	 }
	 
	 public Area(String area, String descripcion) {
	  super();
	  this.area = area;
	  this.descripcion = descripcion;
	  
	 }
	 
	 public Area(String area) {
		  super();
		  this.area = area;		  
		 }
	 public Area(){}
	 
}
