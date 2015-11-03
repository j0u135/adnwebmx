package com.adn.controlador;

public class Dashboard {
	
	private String nombre;
	private String definicion;
	private String activo;
	
	public String getActivo() {
		return activo;
	}
	public void setActivo(String activo) {
		this.activo = activo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDefinicion() {
		return definicion;
	}
	public void setDefinicion(String definicion) {
		this.definicion = definicion;
	}
	
	
	public Dashboard(String nombre, String definicion, String activo) {
		  super();
		  this.nombre = nombre;
		  this.definicion = definicion;
		  this.activo = activo;
	}

}
