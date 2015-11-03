package com.adn.conexion;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
	Connection conexion;
	Statement consulta;
	public String ruta;
		
		public Conexion()
	    {
	        //ruta = "/Users/Badiz/Desktop/adnBase.db";
	    }
	    public void conectar(){
			try {
		            //Class.forName("org.sqlite.JDBC");
					Class.forName("org.postgresql.Driver");
		        }
		        catch (ClassNotFoundException e) {
		        	e.printStackTrace();
		           System.out.println( "fallo org.sqlite.JDBC");
		        }	 
				try {
	                 // Conexion con IOS conexion = DriverManager.getConnection("jdbc:sqlite:/Users/Badiz/Documents/workspace jee/ADN/lib/adnBase.db");
					//conexion = DriverManager.getConnection("jdbc:sqlite:\\lib\\adnBase.db");
					conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/adn10xbd", "adn10xbd", "SDd34554tt.fTr");
	              
	                  consulta = conexion.createStatement();
	                  System.out.println("No mams que ya se conecto");
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("fallo conexion y creacion de statement");
				}
		}
		
}