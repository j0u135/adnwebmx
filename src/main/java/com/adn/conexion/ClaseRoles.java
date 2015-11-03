package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Rol;


public class ClaseRoles {
 
 public static boolean agregarRol(Rol nuevoRol){
  boolean agregado=false;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    String query= "INSERT INTO ROLES (Nombre,Descripcion)VALUES ('"+nuevoRol.getNombre()+"','"+nuevoRol.getDescripcion()+"')";
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
 
 public static boolean update(Rol rol, String nom){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE ROLES SET Nombre='"+nom+"',Descripcion='"+rol.getDescripcion()+"' WHERE nombre='"+nom+"'";
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
 /**
  * 
  * @return
  */
 public static ArrayList<Rol> consultar(){
		ArrayList<Rol> arrRoles = new ArrayList<Rol>();
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idRol, nombre FROM Roles";
			   System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	Rol rol = new Rol();
			    	
			    	rol.setIdRol((resultado.getString(1)!=""?resultado.getString(1):""));
			    	rol.setNombre((resultado.getString(2)!=""?resultado.getString(2):""));
			    	arrRoles.add(rol);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrRoles;
	}
}