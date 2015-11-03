package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.HojaRuta;
import com.mx.diezx.adn.model.ReporteDepartamentosHojaRuta;
import com.mx.diezx.adn.model.ReporteUsuariosHojaRuta;
import com.mx.diezx.adn.model.Usuario;

public interface IHojaRutaDAO {
	
	public ArrayList<Integer> getYears();

	public ArrayList<HojaRuta> getHojaRumboByUsuarioYYear(Usuario usuario,
			int year);

	public ArrayList<ReporteUsuariosHojaRuta> getHojaRumboByDepartamentoYYear(
			int id_departamento, int year, Usuario consultante);

	public ArrayList<ReporteDepartamentosHojaRuta> getHojaRutaByAreaYYear(int area,
			int year, Usuario consultante);

}
