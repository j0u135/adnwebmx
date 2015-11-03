package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import com.adn.controlador.Puesto;

public class ConsultaPuestos
{
   public static LinkedList<Puesto> getPuestos()
   {
      LinkedList<Puesto> listaContactos=new LinkedList<Puesto>();
      try
      {
    	  ConexionBase c=new ConexionBase();
		  Connection conexion=c.getConexion();
         
         Statement st = conexion.createStatement();
        
         ResultSet rs = st.executeQuery("select puesto from Puestos" );
         while (rs.next())
         {
            Puesto area = new Puesto();
           area.setNbPuesto(rs.getString("puesto"));
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