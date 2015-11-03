package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Departamento;


public class ClaseDepartamento {
 
 public static boolean agregarDepto(Departamento nuevoDepto){
  boolean agregado=false;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    String query= "INSERT INTO Departamentos (nb_Departamento, id_Area,desc_Departamento, creado_por, fh_creacion) VALUES ('"+nuevoDepto.getNbDepto()+"',"+nuevoDepto.getIdArea()+",'"+nuevoDepto.getDescDepto()+"','"+nuevoDepto.getCreadoPor()+"','"+nuevoDepto.getFhCreacion()+"')";
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
 
 public static boolean actualizaDepto(Departamento depto){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE Departamentos SET nb_Departamento='"+depto.getNbDepto()+"', desc_Departamento='"+depto.getDescDepto()+"' WHERE id_Area="+depto.getIdArea()+" AND id_Departamento="+depto.getIdDepto();
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
  
 	public static Departamento buscaDeptoXpuesto(String nbPuesto, int idArea){
		Departamento depto=null;
 		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT d.id_Departamento, d.nb_Departamento, d.desc_Departamento, d.creado_por, d.fh_creacion FROM DEPARTAMENTOS d, PUESTOS p  WHERE d.id_Area="+idArea+" AND p.nb_puesto='"+nbPuesto+"' AND p.idDepartamento=d.id_Departamento";
			    	System.out.println(query);			//			1						2    			3				4			5
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{	
			    	depto=new Departamento();
			    	int idDepto = Integer.parseInt(resultado.getString(1)!=""?resultado.getString(1):"0");
			    	depto.setIdDepto(idDepto);
			    	depto.setNbDepto(resultado.getString(2)!=""?resultado.getString(2):"");
			    	depto.setIdArea(idArea);
			    	depto.setDescDepto(resultado.getString(3)!=""?resultado.getString(3):"");
			    	depto.setCreadoPor(resultado.getString(4)!=""?resultado.getString(4):"");
			    	depto.setFhCreacion(resultado.getString(5)!=""?resultado.getString(5):"");
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return depto;
	}
 	
 	public static Departamento buscaDeptoXnombre(String nbDepto, int idArea){
		Departamento depto=null;
 		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT id_Departamento, nb_Departamento, desc_Departamento, creado_por, fh_creacion FROM Departamentos WHERE id_Area ="+idArea+" And nb_Departamento='"+nbDepto+"'";
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{	
			    	depto=new Departamento();
			    	int idDepto = Integer.parseInt(resultado.getString(1)!=""?resultado.getString(1):"0");
			    	depto.setIdDepto(idDepto);
			    	depto.setNbDepto(resultado.getString(2)!=""?resultado.getString(2):"");
			    	depto.setIdArea(idArea);
			    	depto.setDescDepto(resultado.getString(3)!=""?resultado.getString(3):"");
			    	depto.setCreadoPor(resultado.getString(4)!=""?resultado.getString(4):"");
			    	depto.setFhCreacion(resultado.getString(5)!=""?resultado.getString(5):"");
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return depto;
	}
 	
 	public static ArrayList<Departamento> buscaDepartamento(int idArea){
		ResultSet resultado = null;
		ArrayList<Departamento> arrDeptos=new ArrayList<Departamento>();
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT id_Departamento, nb_Departamento FROM Departamentos WHERE id_Area ="+idArea;
			   System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{	
			    	Departamento depto= new Departamento();
			    	int idDepto = Integer.parseInt(resultado.getString(1)!=""?resultado.getString(1):"0");
			    	depto.setIdDepto(idDepto);
			    	depto.setNbDepto(resultado.getString(2)!=""?resultado.getString(2):"");
			    	arrDeptos.add(depto);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrDeptos;
	}
 	
 	public static Departamento buscaDepoXid(int idDepto){
		ResultSet resultado = null;
		Departamento depto=new Departamento();
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nb_Departamento FROM Departamentos WHERE id_Departamento ="+idDepto;
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{	
			    	depto.setNbDepto(resultado.getString(1)!=""?resultado.getString(1):"");
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return depto;
	}
}