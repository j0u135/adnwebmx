package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.Prioridad;
import com.mx.diezx.adn.model.Usuario;

public interface IPrioridadDAO {
	
	ArrayList<Prioridad> getPrioridadesByUsuarioYYear(Usuario usuario, int year);

}
