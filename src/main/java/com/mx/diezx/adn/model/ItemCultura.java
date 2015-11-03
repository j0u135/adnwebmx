package com.mx.diezx.adn.model;

public class ItemCultura{

	int id;
	int tipo;
	String detalle;
	
	public ItemCultura(int id, int tipo, String detalle) {
		super();
		this.id = id;
		this.tipo = tipo;
		this.detalle = detalle;
	}

	
	public ItemCultura() {
		super();
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
}

