package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.Puesto;
import com.mx.diezx.adn.model.Usuario;

public interface IPuestoDAO {
	
	public ArrayList<Puesto> getPuestosByDepartamento(int id_departamento, Usuario consultante);

}
