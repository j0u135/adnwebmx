package com.adn.controlador;

public class PresentacionInicial {
	
	private int id;
	private String descripcion;
	private String url;
	private Boolean activo;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Boolean getActivo() {
		return activo;
	}
	
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	
	public String toJson(String arreglo){
		return 
			arreglo + ".push({" + 
			"'id' : " + this.getId() +
			",'descripcion' : '" + this.getDescripcion() +"'," +
			"'url' : '" + this.getUrl() + "'," +
			"'activo' : " + this.getActivo() +
			"});";
	}

}
