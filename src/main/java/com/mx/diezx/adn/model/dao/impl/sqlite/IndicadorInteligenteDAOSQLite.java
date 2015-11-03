package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.IndicadorInteligente;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IIndicadorInteligenteDAO;

public class IndicadorInteligenteDAOSQLite implements IIndicadorInteligenteDAO {

	private final static String SELECT_INDICADORES_BY_USER_YEAR = "SELECT ii.idIndInte, (SELECT ind.nb_indicador FROM indicadores ind WHERE ii.idIndicador = ind.idIndicador), ii.mes, ii.resultado, ii.estatus FROM indinte ii WHERE ";
	private final static String SELECT_INDICADORES_UNICOS = "SELECT DISTINCT ii.idIndicador, (SELECT ind.nb_indicador FROM indicadores ind WHERE ii.idIndicador = ind.idIndicador), (SELECT filInd.unidad_medida FROM FiltroIndicadores filInd, indicadores ind WHERE filInd.idIndicador = ind.idIndicador AND ind.idIndicador = ii.idIndicador) FROM indinte ii WHERE ";
	private static final String SELECT_MESES_DE_INDICADOR = "SELECT mes, resultado, idIndInte FROM indinte WHERE ";
	private final static String SELECT_INDICADORES = "SELECT idIndicador, nb_indicador FROM Indicadores";
	private static final String SELECT_RESULTADOS_INDICADOR = "SELECT mes, resultado, idIndInte FROM indinte WHERE ";
	
	
	@Override
	public ArrayList<IndicadorInteligente> getIndicadores() {
		ResultSet resultado = null;
		ArrayList <IndicadorInteligente> lista_indicadores = new ArrayList<IndicadorInteligente>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_INDICADORES;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							IndicadorInteligente indicador_inteligente = null;
							indicador_inteligente = mapearIndicadorInteligente(resultado, 3);
							lista_indicadores.add(indicador_inteligente);
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
		return lista_indicadores;
	}
	
	@Override
	public ArrayList<IndicadorInteligente> getIndicadoresByUsuarioYYear(
			Usuario usuario, int year) {
		ResultSet resultado = null;
		ArrayList <IndicadorInteligente> lista_indicadores = new ArrayList<IndicadorInteligente>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_INDICADORES_BY_USER_YEAR + "usuario= '" + usuario.getUser() + "' AND anio=" + year;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							IndicadorInteligente indicador_inteligente = null;
							indicador_inteligente = mapearIndicadorInteligente(resultado, 1);
							lista_indicadores.add(indicador_inteligente);
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
		return lista_indicadores;
	}
	

	@Override
	public ArrayList<IndicadorInteligente> getIndicadoresMesesByUsuarioYYear(
			Usuario usuario, int year) {
		
		ResultSet resultado = null;
		ArrayList <IndicadorInteligente> lista_indicadores = new ArrayList<IndicadorInteligente>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_INDICADORES_UNICOS + "usuario= '" + usuario.getUser() + "' AND nullif(anio,'')::int=" + year;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							IndicadorInteligente indicador_inteligente = null;
							indicador_inteligente = mapearIndicadorInteligente(resultado, 2);
							lista_indicadores.add(indicador_inteligente);
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
		
		for(int i = 0; i < lista_indicadores.size(); i++){
			IndicadorInteligente ind_int = lista_indicadores.get(i);
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= SELECT_MESES_DE_INDICADOR + "usuario= '" + usuario.getUser() + "' AND nullif(anio, '')::int=" + year + " AND idIndicador=" + ind_int.getIdIndicador();
					System.out.println(query);
					resultado = st.executeQuery(query);
					
					if(!resultado.equals("")){
						try {
							while(resultado.next()){
								try {
									int mes = mesNumerico(parseStringResultado(resultado, 1));
									float resultado_mes = parseFloatResultado(resultado, 2);
									int idindint = parseIntResultado(resultado, 3);
									if (mes != 0){
										ind_int.setMesenMeses(mes,resultado_mes, idindint);
									}
								} catch (SQLException e) {
									e.printStackTrace();
									return null;
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
		}
		
		return lista_indicadores;
		
	}
	
	@Override
	public IndicadorInteligente getIndicadorResultados(int idIndicador, int year) {
		
		ResultSet resultado = null;
		IndicadorInteligente indicador = new IndicadorInteligente();
		indicador.setIdIndicador(idIndicador);
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_RESULTADOS_INDICADOR + "anio=" + year + " AND idIndicador = " + idIndicador;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							try {
								int mes = mesNumerico(parseStringResultado(resultado, 1));
								float resultado_mes = parseFloatResultado(resultado, 2);
								int idindint = parseIntResultado(resultado, 3);
								if (mes != 0){
									indicador.setMesenMeses(mes,resultado_mes, idindint);
								}
							} catch (SQLException e) {
								e.printStackTrace();
								return null;
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
		
		return indicador;
	}
	
	private IndicadorInteligente mapearIndicadorInteligente (ResultSet resultado, int tipo){
		
		IndicadorInteligente indicador_inteligente;
		indicador_inteligente = new IndicadorInteligente();
		
		switch(tipo){
		case 1:
			try {
				indicador_inteligente.setNb_indicador(parseStringResultado(resultado, 2));
				indicador_inteligente.setMes(parseStringResultado(resultado, 3));
				indicador_inteligente.setResultado(parseFloatResultado(resultado, 4));
				indicador_inteligente.setEstatus(parseStringResultado(resultado, 5));
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			return indicador_inteligente;
		case 2:
			try {
				indicador_inteligente.setIdIndicador(parseIntResultado(resultado, 1));
				indicador_inteligente.setNb_indicador(parseStringResultado(resultado, 2));
				indicador_inteligente.setUnidad_medida(parseStringResultado(resultado, 3));
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			return indicador_inteligente;
		case 3:
			try {
				indicador_inteligente.setIdIndicador(parseIntResultado(resultado, 1));
				indicador_inteligente.setNb_indicador(parseStringResultado(resultado, 2));
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			return indicador_inteligente;

		default: return null;
		}
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
	
	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private float parseFloatResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Float.parseFloat(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}

}
