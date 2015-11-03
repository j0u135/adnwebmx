package com.mx.diezx.adn.model;

import java.util.ArrayList;

public class Cultura {
	
	ArrayList<ItemCultura> valores;
	ArrayList<ItemCultura> principios;
	ArrayList<ItemCultura> misiones;
	
	public Cultura() {
		super();
		valores = new ArrayList<ItemCultura>();
		principios = new ArrayList<ItemCultura>();
		misiones = new ArrayList<ItemCultura>();
	}

	
	public void setValorEnValores(int id, int tipo, String detalle){
		ItemCultura item = new ItemCultura(id, tipo, detalle);
		this.valores.add(item);
	}
	
	public void setPrincipioEnPrincipios(int id, int tipo, String detalle){
		ItemCultura item = new ItemCultura(id, tipo, detalle);
		this.principios.add(item);			
	}

	public void setMisionEnMisiones(int id, int tipo, String detalle){
		ItemCultura item = new ItemCultura(id, tipo, detalle);
		this.misiones.add(item);
	}
}
