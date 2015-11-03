package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.PresentacionInicial;
import com.mx.diezx.adn.model.dao.IPresentacionInicialDAO;

public class PresentacionInicialDAOSQLite implements IPresentacionInicialDAO {
	
	protected static final String SELECT_PRESENTACIONES = "SELECT id, descripcion, url, activo FROM PresentacionInicial";
	protected static final String SELECT_PRESENTACION_ACTIVA = "SELECT id, descripcion, url, activo FROM PresentacionInicial WHERE activo = 1";
	protected static final String UPDATE_PRESENTACION_SQL = "UPDATE PresentacionInicial SET";
	protected static final String INSERT_PRESENTACION_SQL = "INSERT INTO PresentacionInicial (descripcion, url, activo) VALUES ";
	protected static final String DELETE_PRESENTACION = "DELETE FROM PresentacionInicial WHERE id = ";

	@Override
	public ArrayList<PresentacionInicial> getPresentaciones() {

		ResultSet resultado = null;
		ArrayList <PresentacionInicial> lista_presentaciones = new ArrayList<PresentacionInicial>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_PRESENTACIONES;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							PresentacionInicial presentacion = null;
							presentacion = mapearPresentacion(resultado);
							lista_presentaciones.add(presentacion);
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
		return lista_presentaciones;	
	}
	
	@Override
	public PresentacionInicial getPresentacionActiva() {

		ResultSet resultado = null;
		PresentacionInicial presentacion_activa = null;
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_PRESENTACION_ACTIVA;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							presentacion_activa = new PresentacionInicial();
							presentacion_activa = mapearPresentacion(resultado);
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
		return presentacion_activa;
		
	}

	@Override
	public void guardarPresentacion(PresentacionInicial presentacion) {
		if(presentacion != null){
			if(presentacion.getActivo() == true){
				PresentacionInicial presentacion_activa = this.getPresentacionActiva();
				if (presentacion_activa == null || presentacion_activa.getId() == presentacion.getId()){
					editarPresentacionSinValidacion(presentacion);
				}
				else {
					presentacion_activa.setActivo(false);
					editarPresentacionSinValidacion(presentacion_activa);
					editarPresentacionSinValidacion(presentacion);
				}
			}
			else{
				editarPresentacionSinValidacion(presentacion);
			}
		}
	}
	
	private boolean editarPresentacionSinValidacion(PresentacionInicial presentacion){
		if (presentacion != null) {
			
			Integer id = presentacion.getId();
			String descripcion = presentacion.getDescripcion();
			String url = presentacion.getUrl();
			int activo = presentacion.getActivo()? 1 : 0;
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= UPDATE_PRESENTACION_SQL + " descripcion ='" + descripcion + "', url='" + url + "', activo=" + activo + " WHERE id=" + id;
					System.out.println(query);
					st.executeUpdate(query);
					
					st.close();
				}
				c.cerrarConexion();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		else{
			return false;
		}
		return true;
	}
	
	@Override
	public void newPresentacionInicial(PresentacionInicial presentacion) {
		
		if(presentacion != null){
			if(presentacion.getActivo() == true){
				PresentacionInicial presentacion_activa = this.getPresentacionActiva();
				if (presentacion_activa == null){
					newPresentacionInicialSinValidarActivo(presentacion);
				}
				else {
					presentacion_activa.setActivo(false);
					editarPresentacionSinValidacion(presentacion_activa);
					newPresentacionInicialSinValidarActivo(presentacion);
				}
			}
			else{
				newPresentacionInicialSinValidarActivo(presentacion);
			}
		}
	}
	
	
	@Override
	public void deletePresentacion(PresentacionInicial presentacion) {
		if (presentacion != null) {
			
			Integer id = presentacion.getId();
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= DELETE_PRESENTACION + id;
					System.out.println(query);
					st.executeUpdate(query);
					
					st.close();
				}
				c.cerrarConexion();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	private void newPresentacionInicialSinValidarActivo(PresentacionInicial presentacion) {
		
		if (presentacion != null) {
			
			String descripcion = presentacion.getDescripcion();
			String url = presentacion.getUrl();
			boolean activo = presentacion.getActivo()? true : false;
			int activo_query = activo?1:0;
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= INSERT_PRESENTACION_SQL + "('" + descripcion + "', '" + url + "', '" + activo_query + "')";
	System.out.println(query);
					st.executeUpdate(query);
					
					st.close();
				}
				c.cerrarConexion();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private PresentacionInicial mapearPresentacion(ResultSet resultado){
		
		PresentacionInicial presentacion;
		presentacion = new PresentacionInicial();
		
		try {
			presentacion.setId(parseIntResultado(resultado, 1));
			presentacion.setDescripcion(parseStringResultado(resultado, 2));
			presentacion.setUrl(parseStringResultado(resultado, 3));
			presentacion.setActivo(parseStringResultado(resultado, 4).equals("1") || parseStringResultado(resultado, 4).equals("true") ?true:false);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return presentacion;
	}

	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}
}
