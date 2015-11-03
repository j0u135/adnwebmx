package com.adn.conexion;


import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;

public class ConexionBase {
 private Connection con = null;
 public ConexionBase() throws URISyntaxException {
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
			 
			 URI dbUri = new URI(System.getenv("DATABASE_URL"));

			    String username = dbUri.getUserInfo().split(":")[0];
			    String password = dbUri.getUserInfo().split(":")[1];
			    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

			 con= DriverManager.getConnection(dbUrl, username, password);
			 
          
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