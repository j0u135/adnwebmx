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
import com.mx.diezx.adn.model.dao.impl.sqlite.AreaDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.CulturaDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.DepartamentoDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.HojaRutaDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.IndicadorInteligenteDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.PresentacionInicialDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.PrioridadDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.PuestoDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.ScoreCardDAOSQLite;
import com.mx.diezx.adn.model.dao.impl.sqlite.UserDAOSQLite;

public class DAOFactorySQLite extends DAOFactory {	
	
	@Override
	public IAreaDAO getAreaDAO(){
		return new AreaDAOSQLite();
	}

	@Override
	public IDepartamentoDAO getDepartamentoDAO() {
		return new DepartamentoDAOSQLite();
	}

	@Override
	public IPuestoDAO getPuestoDAO() {
		return new PuestoDAOSQLite();
	}

	@Override
	public IHojaRutaDAO getHojaRutaDAO() {
		return new HojaRutaDAOSQLite();
	}

	@Override
	public IUsuarioDAO getUsuarioDAO() {
		return new UserDAOSQLite();
	}

	@Override
	public IIndicadorInteligenteDAO getIndicadorInteligenteDAO() {
		return new IndicadorInteligenteDAOSQLite();
	}

	@Override
	public IPrioridadDAO getPrioridadDAO() {
		return new PrioridadDAOSQLite();
	}

	@Override
	public IPresentacionInicialDAO getPresentacionInicialDAO() {
		return new PresentacionInicialDAOSQLite();
	}

	@Override
	public ICulturaDAO getCulturaDAO() {
		return new CulturaDAOSQLite();
	}
	
	@Override
	public IScoreCardDAO getScoreCardDAO() {
		return new ScoreCardDAOSQLite();
	}
	
}
