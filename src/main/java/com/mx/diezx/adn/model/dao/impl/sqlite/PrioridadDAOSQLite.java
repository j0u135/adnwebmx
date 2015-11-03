package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Prioridad;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IPrioridadDAO;

public class PrioridadDAOSQLite implements IPrioridadDAO {

	protected static final String SELECT_PRIORIDADES_BY_USUARIO_Y_YEAR = "SELECT idPrioridades, Nombre, fhInicio, fhFin FROM Prioridades WHERE Usuario = '";
	protected static final String SELECT_MESES_BY_PRIORIDAD = "SELECT idPrioridadesMes, anio, mes, estatus, avance_programado, avance_real, avance_inicial FROM Prioridades_mes WHERE idPrioridades = ";
	
	@Override
	public ArrayList<Prioridad> getPrioridadesByUsuarioYYear(Usuario usuario,
			int year) {
		
		ResultSet resultado = null;
		ArrayList <Prioridad> lista_prioridades = new ArrayList<Prioridad>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_PRIORIDADES_BY_USUARIO_Y_YEAR + usuario.getUser() + "'";
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							Prioridad prioridad = null;
							prioridad = mapearPrioridad(resultado);
							
							if( contieneYear(prioridad.getFhInicio(), prioridad.getFhFin(), year) ){
								lista_prioridades.add(prioridad);
							}
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
		
		for(int i = 0; i < lista_prioridades.size(); i++){
			Prioridad prioridad = lista_prioridades.get(i);
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= SELECT_MESES_BY_PRIORIDAD + prioridad.getIdPrioridades();
					System.out.println(query);
					resultado = st.executeQuery(query);
					
					if(!resultado.equals("") && resultado != null){
						try {
							while(resultado.next()){
								try {
									int idPrioridadesMes = parseIntResultado(resultado, 1);
									int anio = parseIntResultado(resultado, 2);
									String mes = parseStringResultado(resultado, 3);
									int mes_numerico = mesNumerico(mes);
									String estatus = parseStringResultado(resultado, 4);
									float avance_programado = parseFloatResultado(resultado, 5);
									float avance_real = parseFloatResultado(resultado, 6);
									prioridad.setMesEnMeses(idPrioridadesMes, estatus, anio, mes, mes_numerico, avance_programado, avance_real);
								} catch (SQLException e) {
									e.printStackTrace();
									return null;
								}
							}
							prioridad.calculaUltimoMes();
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
		}
		return lista_prioridades;
	}
	
	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private float parseFloatResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Float.parseFloat(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}
	
	private Prioridad mapearPrioridad (ResultSet resultado){
		
		Prioridad prioridad;
		prioridad = new Prioridad();
		
		try {
			prioridad.setIdPrioridades(parseIntResultado(resultado, 1));
			prioridad.setNombre(parseStringResultado(resultado, 2));
			prioridad.setFhInicio_s(parseStringResultado(resultado, 3));
			prioridad.setFhInicio(fechaStringToDate(prioridad.getFhInicio_s()));
			prioridad.setFhFin_s(parseStringResultado(resultado, 4));
			prioridad.setFhFin(fechaStringToDate(prioridad.getFhFin_s()));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return prioridad;
	}

	private Date fechaStringToDate(String fhInicio_s) {
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date date = null;
		try {
			date = format.parse(fhInicio_s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	private int mesNumerico(String mes_palabra){
		mes_palabra = mes_palabra.toLowerCase().trim();
		if(mes_palabra.equals("enero")){
			return 1;
		}
		else if(mes_palabra.equals("febrero")){
			return 2;
		}
		else if(mes_palabra.equals("marzo")){
			return 3;
		}
		else if(mes_palabra.equals("abril")){
			return 4;
		}
		else if(mes_palabra.equals("mayo")){
			return 5;
		}
		else if(mes_palabra.equals("junio")){
			return 6;
		}
		else if(mes_palabra.equals("julio")){
			return 7;
		}
		else if(mes_palabra.equals("agosto")){
			return 8;
		}
		else if(mes_palabra.equals("septiembre")){
			return 9;
		}
		else if(mes_palabra.equals("octubre")){
			return 10;
		}
		else if(mes_palabra.equals("noviembre")){
			return 11;
		}
		else if(mes_palabra.equals("diciembre")){
			return 12;
		}
		return 0;
	}
	
	private boolean contieneYear(Date inicio, Date fin, int year){
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(inicio);
	    int year_inicio = cal.get(Calendar.YEAR);
	    cal.setTime(fin);
	    int year_fin = cal.get(Calendar.YEAR);
		if( year >=  year_inicio && year <= year_fin ){
			return true;
		}
		return false;
	}


}
