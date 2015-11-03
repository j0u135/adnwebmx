package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Puesto;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IPuestoDAO;

public class PuestoDAOSQLite implements IPuestoDAO {
	
	protected static final String SELECT = "SELECT idPuesto, nb_Puesto, desc_puesto FROM Puestos WHERE";
	protected static final String SELECT_PUESTOS_BY_DEPARTAMENTO = SELECT + " idDepartamento =";
	protected static final String SELECT_PUESTO_USUARIO = SELECT + " idPuesto = ";

	private static final int ADMINISTRADOR_ADN = 1;
	private static final int ADMINISTRADOR = 2;


	@Override
	public ArrayList<Puesto> getPuestosByDepartamento(int id_departamento, Usuario consultante) {
		ResultSet resultado = null;
		ArrayList <Puesto> lista_puestos = new ArrayList<Puesto>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query = "";
				if(consultante.getTipo() == ADMINISTRADOR_ADN || consultante.getTipo() == ADMINISTRADOR || consultante.getPersonal() > 0 ){
					query = SELECT_PUESTOS_BY_DEPARTAMENTO + id_departamento;
				}else{
					query = SELECT_PUESTO_USUARIO + consultante.getPuesto();
				}
				System.out.println(query);
				
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							Puesto puesto = null;
							puesto = mapearPuesto(resultado);
							lista_puestos.add(puesto);
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
		return lista_puestos;
	}
	
	private Puesto mapearPuesto (ResultSet resultado){
		
		Puesto puesto;
		puesto = new Puesto();
		
		try {
			puesto.setIdPuesto(parseIntResultado(resultado, 1));
			puesto.setNb_Puesto(parseStringResultado(resultado, 2));
			puesto.setDesc_puesto(parseStringResultado(resultado, 3));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return puesto;
	}
	
	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
		
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}

}
