package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.controlador.FiltroIndicadores;


public class ClaseFiltroInd {
 
 public static boolean agregarFiltro(FiltroIndicadores filtroInd){
  boolean agregado=false;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    String query= "INSERT INTO FiltroIndicadores (distribucion, fh_corte, formula, frecuencia_emision, fuente_datos, idIndicador, objetivo, respNombre, sentido, tipo_carga, unidad_medida)VALUES ('"+filtroInd.getDistribucion().trim()+"','"+filtroInd.getFhCorte().trim()+"','"+filtroInd.getFormula().trim()+"','"+filtroInd.getFrecEmision().trim()+"','"+filtroInd.getFuenteDatos().trim()+"',"+filtroInd.getIdIndicador()+",'"+filtroInd.getObjetivo().trim()+"','"+filtroInd.getRespNombre().trim()+"','"+filtroInd.getSentido().trim()+"','"+filtroInd.getTpCarga().trim()+"','"+filtroInd.getUnidadMedida().trim()+"')";
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

 
 public static boolean updateFiltro(FiltroIndicadores filtroInd){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE FiltroIndicadores SET objetivo='"+filtroInd.getObjetivo()+"',distribucion='"+filtroInd.getDistribucion()+"',fh_corte='"+filtroInd.getFhCorte()+"',formula='"+filtroInd.getFormula()+"',frecuencia_emision='"+filtroInd.getFrecEmision()+"',fuente_datos='"+filtroInd.getFuenteDatos()+"', respNombre='"+filtroInd.getRespNombre()+"', respPuesto='"+filtroInd.getRespPuesto()+"', sentido='"+filtroInd.getSentido()+"', tipo_carga='"+filtroInd.getTpCarga()+"', unidad_medida='"+filtroInd.getUnidadMedida()+"' WHERE idFiltroIndicadores="+filtroInd.getIdFiltroInd();
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
 
 public static FiltroIndicadores consultarFiltroInd(int idIndicador){
	 ResultSet resultado = null;
	 FiltroIndicadores ind=null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT formula, fuente_datos, respNombre, frecuencia_emision, unidad_medida, distribucion, fh_corte, idFiltroIndicadores, objetivo, respPuesto, sentido, tipo_carga  FROM FiltroIndicadores WHERE idIndicador="+idIndicador+" ORDER by idFiltroIndicadores";
		    					//	1			2			3			4					5				6			7			8					9			10		11			12
		    System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				while(resultado.next()){
					ind = new FiltroIndicadores();
					ind.setIdIndicador(idIndicador);
					ind.setFormula(resultado.getString(1)!=null?resultado.getString(1):"");
					ind.setFuenteDatos(resultado.getString(2)!=null?resultado.getString(2):"");
					ind.setRespNombre(resultado.getString(3)!=null?resultado.getString(3):"");
					ind.setFrecEmision(resultado.getString(4)!=null?resultado.getString(4):"");
					ind.setUnidadMedida(resultado.getString(5)!=null?resultado.getString(5):"");
					ind.setDistribucion(resultado.getString(6)!=null?resultado.getString(6):"");
					ind.setFhCorte(resultado.getString(7)!=null?resultado.getString(7):"");
					int idFiltro = Integer.parseInt(resultado.getString(8)!=null?resultado.getString(8):"0");
					ind.setIdFiltroInd(idFiltro);
					ind.setObjetivo(resultado.getString(9)!=null?resultado.getString(9):"");
					ind.setRespPuesto(resultado.getString(10)!=null?resultado.getString(10):"");
					ind.setSentido(resultado.getString(11)!=null?resultado.getString(11):"");
					ind.setTpCarga(resultado.getString(12)!=null?resultado.getString(12):"");
				}
		    }
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	 
	 return ind;
 }
  
}