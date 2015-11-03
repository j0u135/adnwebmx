package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.controlador.Actividad;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.Tareas;

public class ClaseTareas {

	public ResultSet consultarTareas(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombredetarea FROM tareas WHERE usuario='"+user+"'";
			 System.out.println(query);//  String clave="";
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
	
	public ResultSet consultaTareas(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT prioridad,tipo,idorigen,asignado,comentarios,fechainicio,fechafin,nombredetarea,id FROM tareas WHERE usuario='"+user+"' and estatus='enprogreso' AND activo='true'";
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
	
	public ResultSet consultaTareasC(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT prioridad,tipo,idorigen,asignado,comentarios,fechainicio,fechafin,nombredetarea,id FROM tareas WHERE usuario='"+user+"' and estatus='completas' AND activo='true'";
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
	
	public ResultSet consultaTareasN(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT prioridad,tipo,idorigen,asignado,comentarios,fechainicio,fechafin,nombredetarea,id FROM tareas WHERE usuario='"+user+"' and estatus='nocompletadas' AND activo='true'";
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
	
public static boolean agregarTarea(Tareas tarea){
	boolean agregado=false;
	 try {
		  ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO Tareas (nombredetarea,tipo,idorigen,prioridad,fechainicio,fechafin,usuario,asignado,comentarios) "
		    		+ "VALUES ('"+tarea.getNombre()+"','"+tarea.getTipo()+"','"+tarea.getOrigen()+"','"+tarea.getPrioridad()+"','"+tarea.getPeriodoi()+"','"+tarea.getPeriodof()+"','"+tarea.getUsuario()+"','"+tarea.getAsignar()+"','"+tarea.getNotas()+"')";
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

public static boolean editarTareas(Tareas tareas){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE tareas SET nombredetarea='"+tareas.getNombre()+"',tipo='"+tareas.getTipo()+"',"
	    		+ "idorigen='"+tareas.getOrigen()+"',prioridad='"+tareas.getPrioridad()+"',fechainicio='"+tareas.getPeriodoi()+"',"
	    		+ "fechafin='"+tareas.getPeriodof()+"',asignado='"+tareas.getAsignar()+"',comentarios='"+tareas.getNotas()+"'"
	    		+ " WHERE id='"+tareas.getId()+"' AND activo='true'";
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

public static boolean updateTareas(Tareas tareas){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE Tareas SET activo='false' WHERE id='"+tareas.getId()+"'";
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
