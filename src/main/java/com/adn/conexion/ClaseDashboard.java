package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.controlador.Dashboard;
import com.adn.controlador.HojaRumbo;


public class ClaseDashboard {
	 
	 public static boolean agregarDashboard(Dashboard dsb, String indicador, String usuario){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "INSERT INTO DASHBOARD (Nombre,contenido,activo, usuario)VALUES ('"+dsb.getNombre()+"','"+dsb.getDefinicion()+"','"+indicador+"','"+usuario+"')";
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
	 
	 public static boolean updateDashboard(Dashboard dsb, String indicador, String usuario){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE DASHBOARD SET Nombre='"+dsb.getNombre()+"',contenido='"+dsb.getDefinicion()+"' WHERE usuario='"+usuario+"' AND activo='"+indicador+"'";
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
	 
	 public static boolean setDashboard(String dashFalse){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE DASHBOARD SET activo='"+dashFalse+"'";
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
	 
	 
	 public static boolean revisaExistente(String indicador, String usuario){
		 boolean correcto=false;
		 String claveReal="";
		 	try {
		 		ConexionBase c=new ConexionBase();
		 		Connection con=c.getConexion();
		 		if(con!=null){
		 			Statement st;
		 			st = con.createStatement();
		 			String query=  "SELECT activo FROM dashboard WHERE usuario='"+usuario+"' AND activo='"+indicador+"'";
System.out.println(query);
		 			ResultSet rs=st.executeQuery(query);
				
		 			try{
		 				while(rs.next()){
		 					claveReal=rs.getString(1);
		 				}
		 			}catch (Exception e) {
		              
		 			} 
		    
		 			st.close();
		 		}
		 		c.cerrarConexion();
		  } catch (SQLException e) {
		   correcto=true;
		   e.printStackTrace();
		  }
		  
		  if(claveReal.equals(indicador)){
				correcto=true;
				System.out.println(claveReal);
				System.out.println(indicador);
			}
		  return correcto;
	}
	 
	}