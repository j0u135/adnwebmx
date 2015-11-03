package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Departamento;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IDepartamentoDAO;

public class DepartamentoDAOSQLite implements IDepartamentoDAO {

	protected static final String SELECT = "SELECT id_Departamento, nb_Departamento, desc_Departamento FROM Departamentos";
	protected static final String SELECT_DEPARTAMENTOS = SELECT;
	protected static final String SELECT_DEPARTAMENTOS_BY_AREA = SELECT + " WHERE id_Area =";
	protected static final String SELECT_DEPARTAMENTO_DE_PUESTO = SELECT + " WHERE id_Departamento = (SELECT idDepartamento FROM Puestos WHERE idPuesto = ";
	
	private static final int ADMINISTRADOR_ADN = 1;
	private static final int ADMINISTRADOR = 2;
	
	@Override
	public ArrayList<Departamento> getDepartamentosByArea(int id_area, Usuario consultante) {
		
		ResultSet resultado = null;
		ArrayList <Departamento> lista_departamentos = new ArrayList<Departamento>();
		String query = "";
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				
				if(consultante.getTipo() == ADMINISTRADOR_ADN || consultante.getTipo() == ADMINISTRADOR || consultante.getPersonal() > 0 ){
					query= SELECT_DEPARTAMENTOS_BY_AREA + id_area;
				}else{
					query= SELECT_DEPARTAMENTO_DE_PUESTO + consultante.getPuesto() + ")";
				}
				System.out.println(query);
				resultado = st.executeQuery(query);
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							Departamento departamento = null;
							departamento = mapearDepartamento(resultado);
							lista_departamentos.add(departamento);
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
		return lista_departamentos;
	}
	
	private Departamento mapearDepartamento (ResultSet resultado){
		
		Departamento departamento;
		departamento = new Departamento();
		
		try {
			departamento.setId_Departamento(parseIntResultado(resultado, 1));
			departamento.setNb_Departamento(parseStringResultado(resultado, 2));
			departamento.setDesc_Departamento(parseStringResultado(resultado, 3));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return departamento;
	}

	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
		
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}

}
