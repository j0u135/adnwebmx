package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Comentarios;

public class claseComentarios {

	public static ArrayList<Comentarios> consultacomen(String user, String mes){
		 ResultSet resultado = null;
		 ArrayList<Comentarios> arrComnets=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT fecha, observador, comentario from comentarios WHERE (destinatario='"+user+"' OR observador='"+user+"') and fecha = '"+mes+"'" ;
			   System.out.println(query);
			    resultado = st.executeQuery(query);
			    if(resultado!= null&&!resultado.equals("")){
			    	arrComnets = new ArrayList<Comentarios>();
					   try {
						   	while(resultado.next()){
						   		Comentarios coment = new Comentarios();
						   		String fecha = resultado.getString(1)!=null?resultado.getString(1):"";
						   		String mesComent = validaMes(fecha!=null?fecha:"");
						   		coment.setFecha(mesComent);
						   		coment.setObservador(resultado.getString(2));
						   		coment.setComentario(resultado.getString(3));
						   		arrComnets.add(coment);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
				   }
			   
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrComnets;
	}

		private static String validaMes(String fecha) {
			String mesComent = "";
			//System.out.println("fecha: "+fecha);
			if(fecha!=null && !fecha.equals("")){
			int mes = Integer.parseInt(fecha);
			switch (mes){
		       case 0:
		    	   mesComent="Enero";
		           break;
		       case 1:
		    	   mesComent="Febrero";
		           break;
		       case 2:
		    	   mesComent="Marzo";
		           break;
		       case 3:
		    	   mesComent="Abril";
		           break;
		       case 4:
		    	   mesComent="Mayo";
		           break;
		       case 5:
		    	   mesComent="Junio";
		           break;
		       case 6:
		    	   mesComent="Julio";
		           break;
		       case 7:
		    	   mesComent="Agosto";
		           break;
		       case 8:
		    	   mesComent="Septiembre";
		           break;
		       case 9:
		    	   mesComent="Octubre";
		           break;
		       case 10:
		    	   mesComent="Noviembre";
		           break;
		       case 11:
		    	   mesComent="Diciembre";
		           break;
			}
			}
		return mesComent;
	}

		public static boolean comentaApro(Comentarios comen){
			  boolean resultado=false;
			  try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "Insert into comentarios (fecha,observador, comentario,destinatario,idHojaRumbo) values('"+comen.getFecha()+"','"+comen.getUsuario()+"','"+comen.getComentario()+"','"+comen.getObservador()+"','"+comen.getIdHojaRumbo()+"')";
			    System.out.println(query);
			    st.executeUpdate(query);
			    
			    resultado=true;
			    st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
				  resultado=false;
			   e.printStackTrace();
			  }
			  return resultado;
			 }
}
