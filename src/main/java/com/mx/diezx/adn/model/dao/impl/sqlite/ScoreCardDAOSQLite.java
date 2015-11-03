package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.ScoreCard;
import com.mx.diezx.adn.model.dao.IScoreCardDAO;

public class ScoreCardDAOSQLite implements IScoreCardDAO {

	protected static final String SELECT_SCORECARD = "SELECT id, source FROM ScoreCard";
	protected static final String UPDATE_SCORECARD = "UPDATE ScoreCard SET";
	protected static final String INSERT_SCORECARD = "INSERT INTO ScoreCard (source) VALUES ";
	protected static final String DELETE_SCORECARD= "DELETE FROM ScoreCard WHERE id = ";

	
	@Override
	public ScoreCard getSocreCard() {
		
		ResultSet resultado;
		ScoreCard card = new ScoreCard();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query = SELECT_SCORECARD;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							card = mapearScoreCard(resultado);
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
		return card;
		
	}

	@Override
	public void editarScoreCard(ScoreCard card) {
		if (card != null) {
			
			Integer id = card.getId();
			String source = card.getSource();
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= UPDATE_SCORECARD + " source ='" + source + "'  WHERE id=" + id;
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

	@Override
	public void crearScoreCard(ScoreCard card) {
		if (card != null) {
			
			String source = card.getSource();
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= INSERT_SCORECARD + "('" + source + "')";
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

	@Override
	public void eliminarScoreCard(ScoreCard card) {
		if (card != null) {
			
			Integer id = card.getId();
			
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= DELETE_SCORECARD + id;
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
	
	private ScoreCard mapearScoreCard(ResultSet resultado){
		
		ScoreCard  card;
		card = new ScoreCard ();
		
		try {
			
			card.setId(parseIntResultado(resultado, 1));
			card.setSource(parseStringResultado(resultado, 2));
	
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return card;
	}

	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}
	
}
