package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Area;


public class ClaseArea {
 
 public static boolean agregarArea(Area nuevaArea){
  boolean agregado=false;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    String query= "INSERT INTO Areas (area,descripcion) VALUES ('"+nuevaArea.getArea()+"','"+nuevaArea.getDescripcion()+"')";
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
 
 public static boolean update(Area area, String nom){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE Areas SET area='"+nom+"' WHERE area='"+area.getArea()+"'";
	    System.out.println(query);
 // 
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
  * Consulta las areas
  * @param user
  * @param mes
  * @param anio
  * @return
  */
 public static ArrayList<Area> consultar(){
		ArrayList<Area> arrAreas = new ArrayList<Area>();
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idArea, area FROM Areas";
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	Area area = new Area();
			    	
			    	area.setIdArea((resultado.getString(1)!=""?resultado.getString(1):""));
			    	area.setArea((resultado.getString(2)!=""?resultado.getString(2):""));
			    	arrAreas.add(area);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrAreas;
	}
 
 	public static int consultarIdArea(String nbArea){
		int idArea=0;
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idArea FROM Areas WHERE area ='"+nbArea+"'";
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{	
			    	String res = (resultado.getString(1)!=""?resultado.getString(1):"");
			    	idArea = Integer.parseInt(res);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return idArea;
	}
 	
 	public static String consultarIdArea(int idArea){
		String area="";
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT area FROM Areas WHERE idArea ="+idArea;
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{	
			    	area = (resultado.getString(1)!=""?resultado.getString(1):"");
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return area;
	}
}