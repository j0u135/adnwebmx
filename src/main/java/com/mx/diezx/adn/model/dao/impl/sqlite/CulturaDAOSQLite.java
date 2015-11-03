package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Cultura;
import com.mx.diezx.adn.model.ItemCultura;
import com.mx.diezx.adn.model.dao.ICulturaDAO;

public class CulturaDAOSQLite implements ICulturaDAO {
	
	protected static final String SELECT_CULTURA = "SELECT id, tipo, detalle FROM Cultura";
	protected static final String UPDATE_ITEMCULTURA_SQL = "UPDATE Cultura SET";
	protected static final String INSERT_ITEMCULTURA_SQL = "INSERT INTO Cultura (tipo, detalle) VALUES ";
	protected static final String DELETE_ITEMCULTURA = "DELETE FROM Cultura WHERE id = ";

	@Override
	public Cultura getCulturaDetalle() {
		
		ResultSet resultado = null;
		Cultura cultura = new Cultura();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_CULTURA;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							this.mapearDetalle(resultado, cultura);
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
		return cultura;
	}
	
	@Override
	public void guardarItemCultura(ItemCultura item) {
		int id = item.getId();
		String detalle = item.getDetalle();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= UPDATE_ITEMCULTURA_SQL + " detalle ='" + detalle + "' WHERE id=" + id;
				System.out.println(query);
				st.executeUpdate(query);
				
				st.close();
			}
			c.cerrarConexion();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	@Override
	public void nuevoItemCultura(ItemCultura item) {
		if (item != null) {
			
			int tipo = item.getTipo();
			String detalle = item.getDetalle();
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= INSERT_ITEMCULTURA_SQL + "('" + tipo + "', '" + detalle + "'" + ")";
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



	private void mapearDetalle(ResultSet resultado, Cultura cultura) {
		
		try {
			int id = parseIntResultado(resultado, 1);
			int tipo = parseIntResultado(resultado, 2);
			String detalle = parseStringResultado(resultado, 3);
			
			switch (tipo) {
			case 1:
				cultura.setValorEnValores(id, tipo, detalle);
				break;
			case 2:
				cultura.setPrincipioEnPrincipios(id, tipo, detalle);
				break;
			case 3:
				cultura.setMisionEnMisiones(id, tipo, detalle);
				break;
			default:
				break;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void eliminarItemCultura(ItemCultura item) {
		if (item != null) {
			int id = item.getId();
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= DELETE_ITEMCULTURA + id;
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
	
	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
		
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}

}
