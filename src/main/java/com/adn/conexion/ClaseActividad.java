package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Actividad;
import com.adn.controlador.AvanceActividades;

public class ClaseActividad {
	
	
	public static ResultSet consultar(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= ("select NombreActividad,fecha,peso,ep,er,fp,fr,map,mar,ap,ar,myp,myr,jnp,jnr,jlp,jlr,agp,agr,sp,sr,op,ocr,np,nr,dp,dr from AltaActividades where usuario='"+user+"'");
			 //  String clave="";
			    // 
			    //st.executeQuery(query);
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			   
			   
			   //st.close();
			   }
			   //c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return resultado;
	}
	
	public static ResultSet consultarCompleto(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, unidad, meta, resultado, peso, frecuencia, sentido, entregamedible, tipo, corte, rpond, sem1, sem2, sem3, sem4, sem5, comentarios FROM INDICADORESINTELIGENTES WHERE nombre='"+user+"' AND ACTIVO='True'";
			 //  String clave="";
			    // 
			    //st.executeQuery(query);
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			   
			   
			   //st.close();
			   }
			   //c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return resultado;
	}
	/**
	 * 
	 * @param nuevoActividad
	 * @return
	 */
	public static boolean actualizaAct(Actividad nvoAct){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE Actividades SET fhfin='"+nvoAct.getFhFin()+"', NbActividad='"+nvoAct.getNbActividad()+"', Peso='"+nvoAct.getPeso()+"' WHERE idActividad="+nvoAct.getIdActividad()+" AND idPrioridad="+nvoAct.getIdPrioridad();
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
	public static boolean eliminaAct(Actividad nuevoActividad){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE Actividades SET Status='Inactivo' WHERE idActividad="+nuevoActividad.getIdActividad()+" AND idPrioridad="+nuevoActividad.getIdPrioridad();
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
	public static boolean agregarActividad(Actividad nuevoActividad){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO Actividades (idPrioridad, NbActividad, Peso, Status, fhfin) VALUES ("+nuevoActividad.getIdPrioridad()+",'"+nuevoActividad.getNbActividad()+"','"+nuevoActividad.getPeso()+"','"+nuevoActividad.getStatus()+"','"+nuevoActividad.getFhFin()+"')";
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
	public static ArrayList<Actividad> consultarActividades(int idPrioridad){
		 ResultSet resultado = null;
		 ArrayList<Actividad> arrActividades = null;
			 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idActividad, NbActividad, Peso, fhfin FROM Actividades WHERE idPrioridad="+idPrioridad+" AND Status='Activo'";
			                    //		1				2		3		4
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    arrActividades = new ArrayList<Actividad>();
			    while(resultado.next()){
			    	Actividad act = new Actividad();
			    	int idActividad = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
			    	act.setIdActividad(idActividad); 
			    	act.setNbActividad(resultado.getString(2)!=null?resultado.getString(2):"0");
			    	act.setPeso(resultado.getString(3)!=null?resultado.getString(3):"0"); 
			    	act.setFhFin(resultado.getString(4)!=null?resultado.getString(4):""); 
			    	act.setIdPrioridad(idPrioridad);
			    	arrActividades.add(act);
		    		}

			    st.close();
			   }
			   	c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrActividades;
	}
	
	/**
	 * 
	 * @param idActividad
	 * @return
	 */
	public static ArrayList<AvanceActividades> consultarAvanceAct(int idActividad){
		 ResultSet resultado = null;
		 ArrayList<AvanceActividades> arrAvanceAct = null;
			 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idAvanceActividad, mes, programado, real FROM AvanceActividades WHERE idActividad="+idActividad;
			                    //		1				2		3			4	
			   System.out.println(query);
			    resultado = st.executeQuery(query);
			    arrAvanceAct = new ArrayList<AvanceActividades>();
			    while(resultado.next()){
			    	AvanceActividades avAct = new AvanceActividades();
			    	int idAvAct = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
			    	avAct.setIdAvanceActividad(idAvAct); 
			    	avAct.setMes(resultado.getString(2)!=null?resultado.getString(2):"0");
			    	avAct.setProgramado(resultado.getString(3)!=null?resultado.getString(3):"0");
			    	avAct.setReal(resultado.getString(4)!=null?resultado.getString(4):"0");
			    	avAct.setIdActividad(idActividad);
			    	arrAvanceAct.add(avAct);
		    		}
			    st.close();
			   }
			   	c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrAvanceAct;
	}
	
	/**
	 * 
	 * @param nbActividad
	 * @param idPrioridad
	 * @return
	 */
	public static Actividad consultaActividad(String nbActividad, int idPrioridad){
		 ResultSet resultado = null;
		 Actividad act = null;
			 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idActividad, NbActividad, Peso, fhfin FROM Actividades WHERE NbActividad='"+nbActividad+"' AND idPrioridad="+idPrioridad+" AND Status='Activo'";
			                    //		1				2		3		4
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next()){
			    	act = new Actividad();
			    	int idActividad = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
			    	act.setIdActividad(idActividad); 
			    	act.setNbActividad(resultado.getString(2)!=null?resultado.getString(2):"0");
			    	act.setPeso(resultado.getString(3)!=null?resultado.getString(3):"0"); 
			    	act.setFhFin(resultado.getString(4)!=null?resultado.getString(4):""); 
		    		}

			    st.close();
			   }
			   	c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return act;
	}
	
	public static boolean agregarAvanceActividad(AvanceActividades avance){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String avProg = avance.getProgramado()!=null?avance.getProgramado():"0";
		    String avReal = avance.getReal()!=null?avance.getReal():"0";
		    String query= "INSERT INTO AvanceActividades (idActividad, mes, programado, real) VALUES ("+avance.getIdActividad()+",'"+avance.getMes()+"','"+avProg+"','"+avReal+"')";
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
	 * @param avance
	 * @return
	 */
	public static boolean actualizaAvAct(AvanceActividades avance){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE AvanceActividades SET programado='"+avance.getProgramado()+"', real='"+avance.getReal()+"' WHERE idActividad="+avance.getIdActividad()+" AND mes='"+avance.getMes()+"'";
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
	 * @param avance
	 * @return
	 */
	public static boolean eliminaAvAct(AvanceActividades avance){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "DELETE FROM AvanceActividades WHERE mes='"+avance.getMes()+"' AND idActividad="+avance.getIdActividad();
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
}