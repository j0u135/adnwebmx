package com.adn.conexion;


import java.sql.*;

public class ConexionBase {
 private Connection con = null;
 public ConexionBase() {
	 try {
         //Class.forName("org.sqlite.JDBC");
         Class.forName("org.postgresql.Driver");
     }
     catch (ClassNotFoundException e) {
     	e.printStackTrace();
        System.out.println( "fallo org.sqlite.JDBC");
     }	 
		try {
			System.out.println("dasdasdasdasdasd");
			 con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ADNWeb", "adn10xbd", "zaq12wsx");
          
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("fallo conexion y creacion de statement");
		}
 }
 
 public Connection getConexion(){
  return con;
 }
 
 public void cerrarConexion(){
  try {
   con.close();
  } catch (SQLException e) {
   e.printStackTrace();
  }
 }
}