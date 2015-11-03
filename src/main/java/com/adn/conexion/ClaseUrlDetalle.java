package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.UrlDetalle;

public class ClaseUrlDetalle {

	/**
	 * 
	 * @param url
	 * @return
	 */
	public static boolean agregarUrl(UrlDetalle url){
			  boolean agregado=false;
			  try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "INSERT INTO URL_detalle (idPrioridad, nbURL, url, estatus) VALUES ("+url.getIdPrioridad()+",'"+url.getNbURL()+"','"+url.getUrl()+"','Activo')";
			  System.out.println(query);
			    st.executeUpdate(query);
			    
			    agregado=true;
			    st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   agregado=false;
			   e.printStackTrace();
			  }
			  return agregado;
			 }	
	
	/**
	 * 
	 * @param nuevoActividad
	 * @return
	 */
	public static boolean actualizaEstatusUrlt(UrlDetalle url){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE URL_detalle SET estatus='Inactivo' WHERE idURLdetalle="+url.getIdURLdetalle();
		    System.out.println(query);
		    st.executeUpdate(query);
		    
		    agregado=true;
		    st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   agregado=false;
		   e.printStackTrace();
		  }
		  return agregado;
		 }
	
	/**
	 * 
	 * @param idPrioridad
	 * @return
	 */
	public static ArrayList<UrlDetalle> consultarURLs(int idPrioridad){
		 ResultSet resultado = null;
		 ArrayList<UrlDetalle> arrUrlDetalle = null;
			 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idURLdetalle, nbURL, url FROM URL_detalle WHERE idPrioridad="+idPrioridad+" AND estatus='Activo'";
			      System.out.println(query);              //		1			2		3		
			    resultado = st.executeQuery(query);
			    arrUrlDetalle = new ArrayList<UrlDetalle>();
			    while(resultado.next()){
			    	UrlDetalle urlDet = new UrlDetalle();
			    	int idURLdetalle = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
			    	urlDet.setIdURLdetalle(idURLdetalle); 
			    	urlDet.setNbURL(resultado.getString(2)!=null?resultado.getString(2):"");
			    	urlDet.setUrl(resultado.getString(3)!=null?resultado.getString(3):""); 
			    	arrUrlDetalle.add(urlDet);
		    		}

			    st.close();
			   }
			   	c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrUrlDetalle;
	}

	public static UrlDetalle consultarURLxIdDetalle(int idURLdetalle){
		 ResultSet resultado = null;
		 UrlDetalle urlDet = null;
			 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idURLdetalle, nbURL, url FROM URL_detalle WHERE idURLdetalle="+idURLdetalle+" AND estatus='Activo'";
			     System.out.println(query);               //		1			2		3		
			    resultado = st.executeQuery(query);
			    while(resultado.next()){
			    	urlDet = new UrlDetalle();
			    	urlDet.setIdURLdetalle(idURLdetalle); 
			    	urlDet.setNbURL(resultado.getString(2)!=null?resultado.getString(2):"");
			    	urlDet.setUrl(resultado.getString(3)!=null?resultado.getString(3):""); 
		    		}

			    st.close();
			   }
			   	c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return urlDet;
	}
	
}
