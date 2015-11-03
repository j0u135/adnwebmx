package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Prioridad;
import com.adn.controlador.PrioridadMes;

public class ClasePrioridesPorMes {
	
		public static ArrayList<Prioridad> consultarResMes(ArrayList <Prioridad> arrProyectosP, String mesP){
		 ResultSet resultado = null;
		 ArrayList <Prioridad> arrPrioridades=null;
		 if(arrProyectosP!=null){
			 arrPrioridades = new ArrayList<Prioridad>();
		 for(int i=0; i<arrProyectosP.size(); i++){
			 Prioridad prio = arrProyectosP.get(i);
			 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT mes, avance_programado, avance_real, avance_inicial FROM Prioridades_mes WHERE idPrioridades="+prio.getIdPrioridad()+" AND estatus='activo' AND mes='"+mesP.toLowerCase()+"'";
			                    //		1		2				3				4
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    
			    while(resultado.next()){
			    	String mes = resultado.getString(1)!=null?resultado.getString(1):"";
		    		String meta = resultado.getString(2)!=null?resultado.getString(2):"0";
		    		String result = resultado.getString(3)!=null?resultado.getString(3):"0";
		    		String inicial = resultado.getString(4)!=null?resultado.getString(4):"0";
		    		if(mes!=null && mes!=""){
		    			if(mes.equalsIgnoreCase("Enero")){
		    				prio.setResEne(result);
		    				prio.setMetaEne(meta);
		    				prio.setIniEne(inicial);
		    			}else if(mes.equalsIgnoreCase("Febrero")){
		    				prio.setResFeb(result);
		    				prio.setMetaFeb(meta);
		    				prio.setIniFeb(inicial);
		    			}else if(mes.equalsIgnoreCase("Marzo")){
		    				prio.setResMar(result);
		    				prio.setMetaMar(meta);
		    				prio.setIniMar(inicial);
		    			}else if(mes.equalsIgnoreCase("Abril")){
		    				prio.setResAbr(result);
		    				prio.setMetaAbr(meta);
		    				prio.setIniAbr(inicial);
		    			}else if(mes.equalsIgnoreCase("Mayo")){
		    				prio.setResMay(result);
		    				prio.setMetaMay(meta);
		    				prio.setIniMay(inicial);
		    			}else if(mes.equalsIgnoreCase("Junio")){
		    				prio.setResJun(result);
		    				prio.setMetaJun(meta);
		    				prio.setIniJun(inicial);
		    			}else if(mes.equalsIgnoreCase("Julio")){
		    				prio.setResJul(result);
		    				prio.setMetaJul(meta);
		    				prio.setIniJul(inicial);
		    			}else if(mes.equalsIgnoreCase("Agosto")){
		    				prio.setResAgo(result);
		    				prio.setMetaAgo(meta);
		    				prio.setIniAgo(inicial);
		    			}else if(mes.equalsIgnoreCase("Septiembre")){
		    				prio.setResSep(result);
		    				prio.setMetaSep(meta);
		    				prio.setIniSep(inicial);
		    			}else if(mes.equalsIgnoreCase("Octubre")){
		    				prio.setResOct(result);
		    				prio.setMetaOct(meta);
		    				prio.setIniOct(inicial);
		    			}else if(mes.equalsIgnoreCase("Noviembre")){
		    				prio.setResNov(result);
		    				prio.setMetaNov(meta);
		    				prio.setIniNov(inicial);
		    			}else if(mes.equalsIgnoreCase("Diciembre")){
		    				prio.setResDic(result);
		    				prio.setMetaDic(meta);
		    				prio.setIniDic(inicial);
		    			}
		    		}

			    	arrPrioridades.add(prio);
			    }
			    st.close();
			   }
			   	c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		 }
		 }
		return arrPrioridades;
	}
		
		/**
		 * 
		 * @param arrProyectosP
		 * @param mesP
		 * @return
		 */
		public static PrioridadMes consultarMes(Prioridad proyectosP, String mesP){
			 ResultSet resultado = null;
			 PrioridadMes prioMes = null;
			 if(proyectosP!=null){
				 try {
				   ConexionBase c=new ConexionBase();
				   Connection con=c.getConexion();
				   if(con!=null){
				    Statement st;
				    st = con.createStatement();
				    String query= "SELECT mes, avance_programado, avance_real, peso, idPrioridadesMes FROM Prioridades_mes WHERE idPrioridades="+proyectosP.getIdPrioridad()+" AND estatus='activo' AND mes='"+mesP.toLowerCase()+"'";
				       System.out.println(query);             //		1		2				3			4		5
				    resultado = st.executeQuery(query);
				    while(resultado.next()){
				    	prioMes = new PrioridadMes();
				    	prioMes.setMes(resultado.getString(1)!=null?resultado.getString(1):""); 
				    	prioMes.setAvanceProgramado(resultado.getString(2)!=null?resultado.getString(2):"0");
				    	prioMes.setAvanceReal(resultado.getString(3)!=null?resultado.getString(3):"0"); 
				    	prioMes.setPeso(resultado.getString(4)!=null?resultado.getString(4):"0"); 
				    	int idPrioridadMes = Integer.parseInt(resultado.getString(4)!=null?resultado.getString(5):"0");
				    	prioMes.setIdPrioridadMes(idPrioridadMes);
			    		}

				    st.close();
				   }
				   	c.cerrarConexion();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
			 }
			return prioMes;
		}
	/**
	 * 
	 * @param nuevAct
	 * @return
	 */
		public static boolean agregarPrioMes(PrioridadMes prioMes){
			  boolean agregado=false;
			  try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "INSERT INTO Prioridades_mes (anio,avance_programado,avance_real,estatus,idPrioridades, mes, peso) "
			    		+ "	VALUES ('"+prioMes.getAnio()+"','"+prioMes.getAvanceProgramado()+"','"+prioMes.getAvanceReal()+"','"+prioMes.getEstatus()+"',"+prioMes.getIdPrioridad()+",'"+prioMes.getMes()+"','"+prioMes.getPeso()+"')";
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
		
		/**
		 * 
		 * @param prioMes
		 * @return
		 */
		public static boolean actualizaEstatusMes(Prioridad prioMes, String estatus, String mes, String anio){
			  boolean agregado=false;
			  try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "UPDATE Prioridades_mes SET estatus='"+estatus+"' WHERE idPrioridades="+prioMes.getIdPrioridad()+" AND mes='"+mes+"' AND anio='"+anio+"'";
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
		

		public static boolean actualizaPrioMes(PrioridadMes prioMes, String mes, String anio){
			  boolean agregado=false;
			  try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "UPDATE Prioridades_mes SET peso='"+prioMes.getPeso()+"', avance_programado='"+prioMes.getAvanceProgramado()+"', avance_real='"+prioMes.getAvanceReal()+"', avance_inicial='"+prioMes.getAvanceInicial()+"' WHERE idPrioridadesMes="+prioMes.getIdPrioridadMes()+" AND mes='"+mes+"' AND anio='"+anio+"'";
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
	}