package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.PresentacionInicial;

public class PresentacionIniciaDAO {

	protected static final String SELECT_PRESENTACION_ACTIVA_SQL = "SELECT id, descripcion, url, activo FROM PRESENTACIONINICIAL WHERE activo = 1";
	protected static final String UPDATE_PRESENTACION_SQL = "UPDATE PRESENTACIONINICIAL SET";
	protected static final String DELETE_PRESENTACIONINICIAL_SQL = "DELETE FROM PRESENTACIONINICIAL WHERE id =";
	protected static final String INSERT_PRESENTACION_SQL = "INSERT INTO PRESENTACIONINICIAL (descripcion, url, activo) VALUES ";
	protected static final String SELECT_PRESENTACIONES_SQL = "SELECT * FROM PRESENTACIONINICIAL";
	
	private PresentacionInicial mapearPresentacion(ResultSet resultado){
		
		PresentacionInicial presentacion;
		presentacion = new PresentacionInicial();
		
		try {
			presentacion.setId(Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):""));
			presentacion.setDescripcion(resultado.getString(1)!=null?resultado.getString(2):"");
			presentacion.setUrl(resultado.getString(1)!=null?resultado.getString(3):"");
			presentacion.setActivo(resultado.getString(4).equals("0") || resultado.getString(4).equals("false") ?false:true);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return presentacion;
	}
	
	public PresentacionInicial encontrarPresentacionActiva(){
		ResultSet resultado = null;
		PresentacionInicial presentacion_activa = null;
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_PRESENTACION_ACTIVA_SQL;
System.out.println(query);System.out.println(query);System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){							
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
	
	public ArrayList <PresentacionInicial> encontrarTodasPresentaciones(){
		ResultSet resultado = null;
		ArrayList <PresentacionInicial> lista_presentaciones = new ArrayList<PresentacionInicial>();
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_PRESENTACIONES_SQL;
System.out.println(query);System.out.println(query);
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
	
	public boolean agregarPresentacion(PresentacionInicial presentacion){
		
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
				return false;
			}
		}
		else{
			return false;
		}
		return true;
	}
	
	
	public boolean agregarPresentacionValidandoActivo(PresentacionInicial presentacion){
		if(presentacion != null){
			if(presentacion.getActivo() == true){
				PresentacionInicial presentacion_activa = this.encontrarPresentacionActiva();
				if (presentacion_activa == null || presentacion_activa.getId() == presentacion.getId()){
					agregarPresentacion(presentacion);
				}
				else {
					presentacion_activa.setActivo(false);
					editarPresentacion(presentacion_activa);
					agregarPresentacion(presentacion);
				}
			}
			else{
				agregarPresentacion(presentacion);
			}
		}
		else{
			return false;
		}
		return true;
	}
	
	
	public boolean editarPresentacion(PresentacionInicial presentacion){
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
	
	public boolean editarPresentacionValidandoActivo(PresentacionInicial presentacion){
		if(presentacion != null){
			if(presentacion.getActivo() == true){
				PresentacionInicial presentacion_activa = this.encontrarPresentacionActiva();
				if (presentacion_activa == null || presentacion_activa.getId() == presentacion.getId()){
					editarPresentacion(presentacion);
				}
				else {
					presentacion_activa.setActivo(false);
					editarPresentacion(presentacion_activa);
					editarPresentacion(presentacion);
				}
			}
			else{
				editarPresentacion(presentacion);
			}
		}
		else{
			return false;
		}
		return true;
	}
	
	public boolean eliminarPresentacion(PresentacionInicial presentacion){
		if(presentacion != null){
			int id = presentacion.getId();
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= DELETE_PRESENTACIONINICIAL_SQL + id;
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
	
}
