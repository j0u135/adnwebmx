package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.AutorizaCambioFiltro;


public class ClaseAutorizaCambioFiltro {

	public static boolean agregarAutoriza(AutorizaCambioFiltro cambioFiltro){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO Autoriza_cambio_filtros (idFiltroIndicador,nbCampo,st_cambio,usr_solicita,valor_anterior,valor_nuevo,fh_creacion, campoBD) VALUES	("+cambioFiltro.getIdFiltroIndicador()+",'"+cambioFiltro.getNbCampo()+"','"+cambioFiltro.getStCambio()+"','"+cambioFiltro.getUsrSolicita()+"','"+cambioFiltro.getValorAnterior()+"','"+cambioFiltro.getValorNuevo()+"','"+cambioFiltro.getFhCreacion()+"','"+cambioFiltro.getCampoBD()+"')";
		    System.out.println(query);
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
	
	public static boolean update(AutorizaCambioFiltro cambioFiltro){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE Autoriza_cambio_filtros SET st_cambio='"+cambioFiltro.getStCambio()+"',usr_autorizador='"+cambioFiltro.getUsrAutorizador()+"' WHERE idAutoCambioFiltros="+cambioFiltro.getIdAutoCambioFiltro();
		    System.out.println(query);
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
	
	public static boolean ejecutaCambio(AutorizaCambioFiltro cambioFiltro){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE FiltroIndicadores SET "+cambioFiltro.getCampoBD()+"='"+cambioFiltro.getValorNuevo()+"' WHERE idFiltroIndicadores="+cambioFiltro.getIdFiltroIndicador();
		    System.out.println(query);
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
	
	public static ArrayList<AutorizaCambioFiltro> consultarXautorizar(){
		ArrayList<AutorizaCambioFiltro> arrCambioFiltro = new ArrayList<AutorizaCambioFiltro>();
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idFiltroIndicador,nbCampo,usr_solicita,valor_anterior,valor_nuevo,fh_creacion FROM Autoriza_cambio_filtros WHERE st_cambio='Pendiente'";
			    System.out.println(query);				//		1				2			3			4				5			6
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	AutorizaCambioFiltro cambioFiltro = new AutorizaCambioFiltro();
			    	int idFilInd = Integer.parseInt((resultado.getString(1)!=""?resultado.getString(1):""));
			    	cambioFiltro.setIdFiltroIndicador(idFilInd);
			    	cambioFiltro.setNbCampo((resultado.getString(2)!=""?resultado.getString(2):""));
			    	cambioFiltro.setUsrSolicita((resultado.getString(3)!=""?resultado.getString(3):""));
			    	cambioFiltro.setValorAnterior((resultado.getString(4)!=""?resultado.getString(4):""));
			    	cambioFiltro.setValorNuevo((resultado.getString(5)!=""?resultado.getString(5):""));
			    	cambioFiltro.setFhCreacion((resultado.getString(6)!=""?resultado.getString(6):""));
			    	arrCambioFiltro.add(cambioFiltro);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrCambioFiltro;
	}

	public static ArrayList<AutorizaCambioFiltro> consultaXnbAutorizador(String autorizador){
		ArrayList<AutorizaCambioFiltro> arrCambioFiltro = new ArrayList<AutorizaCambioFiltro>();
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT (SELECT nb_indicador FROM Indicadores WHERE idIndicador=fil.idIndicador),au.nbCampo,au.usr_solicita,au.valor_anterior,au.valor_nuevo,au.fh_creacion, au.idAutoCambioFiltros, au.idFiltroIndicador  FROM Autoriza_cambio_filtros au, FiltroIndicadores fil WHERE st_cambio='Pendiente' AND fil.idFiltroIndicadores=au.idFiltroIndicador ";
			    				//										1											2			3				4				5				6				7                          8
			    System.out.print(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	AutorizaCambioFiltro cambioFiltro = new AutorizaCambioFiltro();
			    	
			    	cambioFiltro.setNbIndicador((resultado.getString(1)!=""?resultado.getString(1):""));
			    	cambioFiltro.setNbCampo((resultado.getString(2)!=""?resultado.getString(2):""));
			    	cambioFiltro.setUsrSolicita((resultado.getString(3)!=""?resultado.getString(3):""));
			    	cambioFiltro.setValorAnterior((resultado.getString(4)!=""?resultado.getString(4):""));
			    	cambioFiltro.setValorNuevo((resultado.getString(5)!=""?resultado.getString(5):""));
			    	cambioFiltro.setFhCreacion((resultado.getString(6)!=""?resultado.getString(6):""));
			    	int idAutoCambioFiltros = Integer.parseInt((resultado.getString(7)!=""?resultado.getString(7):"0"));
			    	int idFilInd = Integer.parseInt((resultado.getString(8)!=""?resultado.getString(8):"0"));
			    	cambioFiltro.setIdFiltroIndicador(idFilInd);
			    	cambioFiltro.setIdAutoCambioFiltro(idAutoCambioFiltros);
			    	arrCambioFiltro.add(cambioFiltro);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrCambioFiltro;
	}
	
	public static AutorizaCambioFiltro consultaXidCambio(int idCambio){
		AutorizaCambioFiltro cambioFiltro = null;
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idFiltroIndicador,nbCampo,usr_solicita,valor_anterior,valor_nuevo,fh_creacion, idAutoCambioFiltros, campoBD FROM Autoriza_cambio_filtros WHERE st_cambio='Pendiente' AND idAutoCambioFiltros="+idCambio;
			    				//		1				2			3			4				5			6			7
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	cambioFiltro = new AutorizaCambioFiltro();
			    	int idFilInd = Integer.parseInt((resultado.getString(1)!=""?resultado.getString(1):""));
			    	cambioFiltro.setIdFiltroIndicador(idFilInd);
			    	cambioFiltro.setNbCampo((resultado.getString(2)!=""?resultado.getString(2):""));
			    	cambioFiltro.setUsrSolicita((resultado.getString(3)!=""?resultado.getString(3):""));
			    	cambioFiltro.setValorAnterior((resultado.getString(4)!=""?resultado.getString(4):""));
			    	cambioFiltro.setValorNuevo((resultado.getString(5)!=""?resultado.getString(5):""));
			    	cambioFiltro.setFhCreacion((resultado.getString(6)!=""?resultado.getString(6):""));
			    	int idAutoCambioFiltros = Integer.parseInt((resultado.getString(7)!=""?resultado.getString(7):""));
			    	cambioFiltro.setIdAutoCambioFiltro(idAutoCambioFiltros);
			    	cambioFiltro.setCampoBD((resultado.getString(8)!=""?resultado.getString(8):""));
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return cambioFiltro;
	}
	
}
