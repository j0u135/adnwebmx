package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.ComentarioIndInte;

public class ClaseComentIndInte {

	public static ArrayList<ComentarioIndInte> buscaComent(int idIndInte){
		 ResultSet resultado = null;
		 ArrayList<ComentarioIndInte> arrComent = new ArrayList<ComentarioIndInte>();
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idComentIndInte, idIndInte, fhComentario, usuario, txComentario FROM ComentarioIndInte WHERE idIndInte="+idIndInte;
			   System.out.println(query); //						  1				2	  			3			4	  	 5				
			    resultado = st.executeQuery(query);
			    if(!resultado.equals("")){
					   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
					while(resultado.next()){
						ComentarioIndInte coment = new ComentarioIndInte();
						int idComentindInte = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
						int idIndiInte = Integer.parseInt(resultado.getString(2)!=null?resultado.getString(2):"0");
						coment.setIdComentIndInte(idComentindInte);
						coment.setIdIndInte(idIndiInte);
						coment.setFhComentario(resultado.getString(3)!=null?resultado.getString(3):"");
						coment.setUsuario(resultado.getString(4)!=null?resultado.getString(4):"");
						coment.setTxComentario(resultado.getString(5)!=null?resultado.getString(5):"");
						arrComent.add(coment);	
					}
			    }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrComent;
	}

	public static boolean agregarComent(ComentarioIndInte coment){
		 boolean ins=false;
		 try {
		  ConexionBase c=new ConexionBase();
		  Connection con=c.getConexion();
		  if(con!=null){
		   Statement st;
		   st = con.createStatement();
		   String query= "INSERT INTO ComentarioIndInte (fhComentario, idIndInte,txComentario,usuario) VALUES ('"+coment.getFhComentario()+"',"+coment.getIdIndInte()+",'"+coment.getTxComentario()+"','"+coment.getUsuario()+"')";
		   System.out.println(query);
		   st.executeUpdate(query);
		   ins= true;
			
		   st.close();
		  }
		  c.cerrarConexion();
		 } catch (SQLException e) {
		  e.printStackTrace();
		 }
		 return ins;
		}
}
