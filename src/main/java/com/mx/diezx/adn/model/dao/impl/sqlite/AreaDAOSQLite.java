package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Area;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IAreaDAO;

public class AreaDAOSQLite implements IAreaDAO {
	
	protected static final String SELECT = "SELECT idArea, area, descripcion FROM areas";
	
	private static final int ADMINISTRADOR_ADN = 1;
	private static final int ADMINISTRADOR = 2;

	public ArrayList<Area> getTodasAreas(Usuario consultante){
		
		ResultSet resultado = null;
		ArrayList <Area> lista_areas = new ArrayList<Area>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query = "";
				if(consultante.getTipo() == ADMINISTRADOR_ADN || consultante.getTipo() == ADMINISTRADOR || consultante.getPersonal() > 0 ){
					query = SELECT;
				}else{
					query = SELECT + " WHERE area = '" + consultante.getArea() + "'";
				}
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							Area area = null;
							area = mapearArea(resultado);
							lista_areas.add(area);
						}
					} catch (SQLException e) {
						e.printStackTrace();
						return null;
					}
				}
				st.close();
			}
			c.cerrarConexion();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return lista_areas;
	}
	
	public void createArea(Area obj_area){

	}
	
	public void deleteAreaById(int id){
		
	}
	
	public Area getAreaById(int id){
		return null;
	}
	
	private Area mapearArea(ResultSet resultado){
		
		Area area;
		area = new Area();
		
		try {
			area.setIdArea(parseIntResultado(resultado, 1));
			area.setArea(parseStringResultado(resultado, 2));
			area.setDescripcion(parseStringResultado(resultado, 3));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return area;
	}

	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
		
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}
}
