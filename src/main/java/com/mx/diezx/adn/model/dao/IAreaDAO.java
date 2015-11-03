package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.Area;
import com.mx.diezx.adn.model.Usuario;

public interface IAreaDAO {

	public ArrayList<Area> getTodasAreas(Usuario consultante);
	
	public void createArea(Area obj_area);
	
	public void deleteAreaById(int id);
	
	public Area getAreaById(int id);
	
}