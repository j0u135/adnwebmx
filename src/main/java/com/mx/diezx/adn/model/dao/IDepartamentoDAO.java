package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.Departamento;
import com.mx.diezx.adn.model.Usuario;

public interface IDepartamentoDAO {
	
	public ArrayList<Departamento> getDepartamentosByArea(int area, Usuario consultante);
	
}
