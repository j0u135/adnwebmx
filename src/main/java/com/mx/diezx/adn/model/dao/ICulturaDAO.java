package com.mx.diezx.adn.model.dao;

import com.mx.diezx.adn.model.Cultura;
import com.mx.diezx.adn.model.ItemCultura;

public interface ICulturaDAO {
	
	public Cultura getCulturaDetalle();

	public void guardarItemCultura(ItemCultura item);

	public void nuevoItemCultura(ItemCultura item);

	public void eliminarItemCultura(ItemCultura item);

}
