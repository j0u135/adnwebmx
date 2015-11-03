package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.controlador.Arbol;



public class ClaseArbol {
	
	
	public ResultSet consultar(){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT arbol FROM arbolInd WHERE nombre='arbolIndicadores'";
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
	
 
 public static int agregarArbol(Arbol nuevoArbol){
  int idArbol=0;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
     
    String query= "INSERT INTO ArbolInd (idArea, creado_por, fh_creacion) VALUES ("+nuevoArbol.getIdArea()+",'"+nuevoArbol.getCreadoPor()+"','"+nuevoArbol.getFhCreacion()+"')";
    System.out.println(query);
    st.executeUpdate(query);
    st.close();
    idArbol=verificaRepetido(nuevoArbol);
   }
   c.cerrarConexion();
  } catch (SQLException e) {
   e.printStackTrace();
  }
  return idArbol;
 }
 
 public static int verificaRepetido(Arbol nuevoArbol){
	 String claveReal="";
	 int idArbol=0;
	 	try {
	 		ConexionBase c=new ConexionBase();
	 		Connection con=c.getConexion();
	 		if(con!=null){
	 			Statement st;
	 			st = con.createStatement();
	 			String query=  "SELECT idArbol FROM ArbolInd WHERE idArea="+nuevoArbol.getIdArea();
	 			System.out.print(query);
	 			ResultSet rs=st.executeQuery(query);
			
	 			try{
	 				while(rs.next()){
	 					claveReal=rs.getString(1);
	 					idArbol = Integer.parseInt(claveReal);
	 				}
	 			}catch (Exception e) {
	              
	 			} 
	 			st.close();
	 		}
	 		c.cerrarConexion();
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  return idArbol;
}
 
 
}


