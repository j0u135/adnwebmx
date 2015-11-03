package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.Usuario;

public interface IUsuarioDAO {
	
	public ArrayList<Usuario> getUsuariosByPuesto(int Puesto);
	
	public Usuario getUsuarioByUserName(String user_name);
	
	public ArrayList<Usuario> getUsuariosByPuestoYRol(int Puesto, Usuario consultante);

}
