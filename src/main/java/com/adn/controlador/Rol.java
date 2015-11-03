package com.adn.controlador;

public class Rol {
	 
	 private String nombre;
	 private String idRol;
	 private String descripcion;
	 
	 /**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNombre() {
	  return nombre;
	 }
	 public void setNombre(String nombre) {
	  this.nombre = nombre;
	 }
	 
	 public String getIdRol() {
		  return idRol;
		 }
	public void setIdRol(String idRol) {
	  this.idRol = idRol;
	 }
	 
	 public Rol(String nombre, String idRol) {
	  super();
	  this.nombre = nombre;
	  this.idRol = idRol;
	  
	 }
	 
	 public Rol(){}
}
