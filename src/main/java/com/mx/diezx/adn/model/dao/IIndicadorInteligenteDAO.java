package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.IndicadorInteligente;
import com.mx.diezx.adn.model.Usuario;

public interface IIndicadorInteligenteDAO {
	
	public ArrayList<IndicadorInteligente> getIndicadoresByUsuarioYYear(Usuario usuario, int year);
	public ArrayList<IndicadorInteligente> getIndicadoresMesesByUsuarioYYear(Usuario usuario, int year);
	public ArrayList<IndicadorInteligente> getIndicadores();
	public IndicadorInteligente getIndicadorResultados(int idIndicador, int year);

}
