package com.mx.diezx.adn.model.dao.factory;

import com.mx.diezx.adn.model.dao.IAreaDAO;
import com.mx.diezx.adn.model.dao.ICulturaDAO;
import com.mx.diezx.adn.model.dao.IDepartamentoDAO;
import com.mx.diezx.adn.model.dao.IHojaRutaDAO;
import com.mx.diezx.adn.model.dao.IIndicadorInteligenteDAO;
import com.mx.diezx.adn.model.dao.IPresentacionInicialDAO;
import com.mx.diezx.adn.model.dao.IPrioridadDAO;
import com.mx.diezx.adn.model.dao.IPuestoDAO;
import com.mx.diezx.adn.model.dao.IScoreCardDAO;
import com.mx.diezx.adn.model.dao.IUsuarioDAO;

public abstract class DAOFactory  {
	
	public static final int SQLITE = 0;
	
	public static DAOFactory getFactory(int type){
		
		if(type == SQLITE){
			return new DAOFactorySQLite();
		}
		else{
			return null;
		}
		
	}
	
	public abstract IAreaDAO getAreaDAO();

	public abstract IDepartamentoDAO getDepartamentoDAO();

	public abstract IPuestoDAO getPuestoDAO();

	public abstract IHojaRutaDAO getHojaRutaDAO();

	public abstract IUsuarioDAO getUsuarioDAO();

	public abstract IIndicadorInteligenteDAO getIndicadorInteligenteDAO();

	public abstract IPrioridadDAO getPrioridadDAO();

	public abstract IPresentacionInicialDAO getPresentacionInicialDAO();

	public abstract ICulturaDAO getCulturaDAO();

	public abstract IScoreCardDAO getScoreCardDAO();
	
}
