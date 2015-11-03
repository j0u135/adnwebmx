package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import com.adn.controlador.Area;

public class ConsultaArea 
{
   public static LinkedList<Area> getAreas()
   {
      LinkedList<Area> listaContactos=new LinkedList<Area>();
      try
      {
    	  ConexionBase c=new ConexionBase();
		  Connection conexion=c.getConexion();
         
         Statement st = conexion.createStatement();
         ResultSet rs = st.executeQuery("select area from Areas" );
         while (rs.next())
         {
            Area area = new Area();
           area.setArea(rs.getString("area"));
            listaContactos.add(area);
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
} 