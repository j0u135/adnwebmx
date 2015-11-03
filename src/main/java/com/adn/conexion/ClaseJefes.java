package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Actividad;
import com.adn.controlador.Jefes;

public class ClaseJefes {
	
	
	public static ArrayList<Jefes> consultarJefes(String userSubor){
		 ArrayList<Jefes> arrJefes = new ArrayList<Jefes>();
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT u.Nombre, u.user FROM usuarios u WHERE u.idUsuario =(SELECT j.claveUsrJefe FROM jefes j WHERE j.usrSubor = '"+userSubor+"')";
			 System.out.println(query);
			 //  String clave="";
			    // 
			    //st.executeQuery(query);
			    resultado = st.executeQuery(query);
			   
			   
			   //st.close();
			   }
			   //c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrJefes;
	}
	
	public ResultSet consultarCompleto(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, unidad, meta, resultado, peso, frecuencia, sentido, entregamedible, tipo, corte, rpond, sem1, sem2, sem3, sem4, sem5, comentarios FROM INDICADORESINTELIGENTES WHERE nombre='"+user+"' AND ACTIVO='True'";
			 System.out.println(query);
			 //  String clave="";
			    // 
			    //st.executeQuery(query);
			    resultado = st.executeQuery(query);
			   
			   
			   //st.close();
			   }
			   //c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return resultado;
	}
 
	 public static boolean agregarActividad(Actividad nuevoActividad){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO Actividades (nbActividad, peso, idPrioridad, status)"
		    		+ "	VALUES ('"+nuevoActividad.getNbActividad()+"',"+ "'"+nuevoActividad.getPeso()+"','"+nuevoActividad.getIdPrioridad()+"','"+nuevoActividad.getStatus()+"');";
		  
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
 
/** public static boolean update(Actividad actividades){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "DELETE FROM AltaActividades WHERE usuario='"+actividades.getUsuario()+"' AND Nombreproyecto='"+actividades.getNombre()+"'";
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
 **/
 
 public static boolean updateEstado(String nombre, String usuario){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    
	    String query= "UPDATE IndicadoresInteligentes SET activo='false' WHERE nombre='"+nombre+"' AND usuario='"+usuario+"'";
	   System.out.println(query);// 
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

}