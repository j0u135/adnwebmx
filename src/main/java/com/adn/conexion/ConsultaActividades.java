package com.adn.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Actividad;

public class ConsultaActividades
{
	/**
	 * 
	 * @param usuario
	 * @param proyecto
	 * @return
	 */
   public static ArrayList<Actividad> getActividades(int idPrioridad)
   {
      ArrayList<Actividad> listaContactos=new ArrayList<Actividad>();
      try
      {
         ConexionBase c=new ConexionBase();
		 Connection conexion=c.getConexion();
         Statement st = conexion.createStatement();
         
         System.out.println("select idActividad,NbActividad,Peso,Status from Actividades where idPrioridad="+idPrioridad);
         ResultSet rs = st.executeQuery("select idActividad,NbActividad,Peso,Status from Actividades where idPrioridad="+idPrioridad);
         while (rs.next())
         {
           Actividad actividades = new Actividad();
           int idActividad = Integer.parseInt(rs.getString(1));
           actividades.setIdActividad(idActividad);
           actividades.setIdPrioridad(idPrioridad);
           actividades.setNbActividad((rs.getString(2)!=""?rs.getString(2):""));
           actividades.setPeso((rs.getString(3)!=""?rs.getString(3):""));
           actividades.setPeso((rs.getString(4)!=""?rs.getString(4):""));
           listaContactos.add(actividades);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaContactos;
   }
   
   public static void elimina(int idPrioridad, int idActividad){
      try
      {
         Class.forName("org.sqlite.JDBC");
         Connection conexion = DriverManager.getConnection(
        		 "jdbc:sqlite:\\C:\\workspaceJEE\\ADN\\lib\\adnBase.db");
         Statement st = conexion.createStatement();
         System.out.println(" UPDATE Actividades SET Status='invisible' WHERE idActividad="+idActividad+" AND idPrioridad="+idPrioridad);
         ResultSet rs = st.executeQuery(" UPDATE Actividades SET Status='invisible' WHERE idActividad="+idActividad+" AND idPrioridad="+idPrioridad);
        
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
   }
} 