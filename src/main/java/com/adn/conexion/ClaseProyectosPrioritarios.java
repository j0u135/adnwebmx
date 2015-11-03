package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Prioridad;

public class ClaseProyectosPrioritarios {
	
	public static boolean agregarProyecto1(Prioridad nuevAct){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO Prioridades (estatus,fhFin,fhInicio,idIndicador,nombre, unidad, usuario) "
		    		+ "	VALUES ('"+nuevAct.getEstatus()+"','"+nuevAct.getFhFin()+"','"+nuevAct.getFhInicio()+"',"+nuevAct.getIdIndicador()+",'"+nuevAct.getNombre()+"','"+nuevAct.getUnidad()+"','"+nuevAct.getUsuario()+"')";
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

	public static boolean actualizaProyecto(Prioridad proyecto) {
		boolean agregado = false;
		try {
			ConexionBase c = new ConexionBase();
			Connection con = c.getConexion();
			if (con != null) {
				Statement st;
				st = con.createStatement();
				String query = "UPDATE Prioridades set nombre='" + proyecto.getNombre() + "',unidad='" + proyecto.getUnidad() + "',fhFin='" + proyecto.getFhFin()+"', fhInicio='"+proyecto.getFhInicio()+"' WHERE idPrioridades=" + proyecto.getIdPrioridad();
				System.out.println(query);
				st.executeUpdate(query);

				agregado = true;
				st.close();
			}
			c.cerrarConexion();
		} catch (SQLException e) {
			agregado = false;
			e.printStackTrace();
		}
		return agregado;
	}

	
	
	/**
	 * Consulta los proyectos prioritarios
	 * @param user
	 * @return
	 */
	public static ArrayList <Prioridad> consultar(String user, String mes, String mesNum, String anio){
		ArrayList <Prioridad> arrProyectosP = new ArrayList<Prioridad>();
		ResultSet resultado = null;
		try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
			   Statement st;
			   st = con.createStatement();
			   String query= "SELECT p.nombre, p.unidad, pm.peso, p.fhInicio, p.fhFin, p.idIndicador, p.idPrioridades FROM Prioridades p , Prioridades_mes pm WHERE p.usuario='"+user+"' AND p.idPrioridades=pm.idPrioridades AND pm.estatus='activo' And pm.mes='"+mes.toLowerCase()+"' And pm.anio='"+anio+"'";
			   //                      1       2    	     3	     4		    5	        6		     7
			   System.out.println(query);
			   resultado = st.executeQuery(query);
			   while(resultado.next()){
				   boolean enMes = false;
				   String fechaFin = resultado.getString(5)!=(null)?resultado.getString(5):"";
				   String fechaInicio = resultado.getString(4)!=(null)?resultado.getString(4):"";
				   if(mesNum!=null && anio!=null && mesNum!="" && !anio.equals("") && !fechaFin.equals("") && !fechaInicio.equals("")){
					   String[] arrFechaFin = fechaFin.split("/");
					   String[] arrFechaIni = fechaInicio.split("/");
					   int anioFinal = Integer.parseInt(arrFechaFin[2]);
					   int mesFinal = Integer.parseInt(arrFechaFin[0]);
					   int anioInicial = Integer.parseInt(arrFechaIni[2]);
					   int mesInicial = Integer.parseInt(arrFechaIni[0]);
					   int anioActual = Integer.parseInt(anio);
					   int mesActual = Integer.parseInt(mesNum);
					   //System.out.println(mesActual);
					   if(anioActual == anioFinal && anioActual == anioInicial){
						   if(mesActual >= mesInicial && mesActual <= mesFinal){
							   enMes = true;
						   }
					   }else if(anioActual < anioFinal && anioActual==anioInicial){
						   if(mesActual >= mesInicial){
							   enMes = true;
						   }
					   }else if(anioActual > anioInicial && anioActual == anioFinal){
						   if(mesActual <= mesFinal){
							   enMes = true;
						   }
					   }
					   
				   }
				   if(enMes){
					   Prioridad proyPrio = new Prioridad();
					   proyPrio.setNombre(resultado.getString(1));
					   proyPrio.setUnidad(resultado.getString(2));
					   proyPrio.setPeso(resultado.getString(3));
					   proyPrio.setFhInicio(resultado.getString(4));
					   proyPrio.setFhFin(resultado.getString(5));
					   int idIndicador = Integer.parseInt(resultado.getString(6));
					   proyPrio.setIdIndicador(idIndicador);
					   int idPrioridad = Integer.parseInt(resultado.getString(7));
					   proyPrio.setIdPrioridad(idPrioridad);
					   arrProyectosP.add(proyPrio);
				   }
			   }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrProyectosP;
	}
	
	/**
	 * 
	 * @param user
	 * @param mesNum
	 * @param anio
	 * @return
	 */
	public static Prioridad consultarXnombre(String user, String nbPrioridad, String anio){
		Prioridad proyPrio = new Prioridad();
		ResultSet resultado = null;
		try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
			   Statement st;
			   st = con.createStatement();
			   String query= "SELECT p.nombre, p.unidad, p.fhInicio, p.fhFin, p.idIndicador, p.idPrioridades FROM Prioridades p WHERE p.usuario='"+user+"' And p.Nombre='"+nbPrioridad+"'";
			   System.out.println(query);//                      1          2 	   	3			  4		   5	 			  6	
			   resultado = st.executeQuery(query);
			   while(resultado.next()){
				   proyPrio.setNombre(resultado.getString(1));
				   proyPrio.setUnidad(resultado.getString(2));
				   proyPrio.setFhInicio(resultado.getString(3));
				   proyPrio.setFhFin(resultado.getString(4));
				   int idIndicador = Integer.parseInt(resultado.getString(5));
				   proyPrio.setIdIndicador(idIndicador);
				   int idPrioridad = Integer.parseInt(resultado.getString(6));
				   proyPrio.setIdPrioridad(idPrioridad);
			   }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return proyPrio;
	}
	
	/**
	 * 
	 * @param user
	 * @param cvePrioridad
	 * @param anio
	 * @return
	 */
	public static Prioridad consultarXclave(String user, int cvePrioridad, String anio){
		Prioridad proyPrio = new Prioridad();
		ResultSet resultado = null;
		try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
			   Statement st;
			   st = con.createStatement();
			   String query= "SELECT p.nombre, p.unidad, p.fhInicio, p.fhFin, p.idIndicador, p.idPrioridades FROM Prioridades p WHERE p.usuario='"+user+"' And p.idPrioridades="+cvePrioridad;
			   System.out.println(query);System.out.println(query);//                      1       		2    	3	  		4		   5	   			6
			   resultado = st.executeQuery(query);
			   while(resultado.next()){
				   proyPrio.setNombre(resultado.getString(1));
				   proyPrio.setUnidad(resultado.getString(2));
				   proyPrio.setFhInicio(resultado.getString(3));
				   proyPrio.setFhFin(resultado.getString(4));
				   int idIndicador = Integer.parseInt(resultado.getString(5));
				   proyPrio.setIdIndicador(idIndicador);
				   int idPrioridad = Integer.parseInt(resultado.getString(6));
				   proyPrio.setIdPrioridad(idPrioridad);
			   }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return proyPrio;
	}
	
	public static Prioridad consultarPP(String valor, String usuario){
		 ResultSet resultado = null;
		 Prioridad prio=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, unidad, fhInicio, fhFin, idPrioridades FROM Prioridades WHERE usuario='"+usuario+"' AND estatus='Activo'  AND nombre='"+valor+"'";
			    System.out.println(query);                //		1		2		3		4		5					
			    resultado = st.executeQuery(query);
			    while(resultado.next()){
			    	   prio = new Prioridad();
			    	   prio.setNombre(resultado.getString(1)!=null?resultado.getString(1):"");
			    	   prio.setUnidad(resultado.getString(2));
			    	   prio.setFhInicio(resultado.getString(3));
			    	   prio.setFhFin(resultado.getString(4));
					   int idPrioridad = Integer.parseInt(resultado.getString(5));
					   prio.setIdPrioridad(idPrioridad);
				   }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return prio;
	}
/**
	public static boolean agregarProyecto(Prioridad nuevoProyecto){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO ProyectosPrioritarios (nombre, unidad, fecha, inicial, programado, real, peso,usuario) VALUES ('"+nuevoProyecto.getNombre()+"','"+nuevoProyecto.getUnidad()+"','"+nuevoProyecto.getFecha()+"',"
		    			 + "'"+nuevoProyecto.getInicial()+"','"+nuevoProyecto.getProgramado()+"','"+nuevoProyecto.getReal()+"','"+nuevoProyecto.getPeso()+"','"+nuevoProyecto.getUsuario()+"'); "
		    			 		+ "INSERT INTO ProyUsua (nombreproyecto, nombreusuario) VALUES ('"+nuevoProyecto.getNombre()+"','"+nuevoProyecto.getUsuario()+"')";
		   // 
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
**/
/**	
	 public static boolean update(Prioridad proyectos, String nom,String unidad,String fecha,String inicial,
			 						String programado, String real,String peso){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE ProyectosPrioritarios SET nombre='"+nom+"',unidad='"+unidad+"',fecha='"+fecha+"',inicial='"+inicial+"',"
		    				+ "programado='"+programado+"',real='"+real+"',peso='"+peso+"' WHERE nombre='"+proyectos.getNombre()+"',unidad='"+proyectos.getUnidad()+"',"
		    				+ "fecha='"+proyectos.getFecha()+"',inical='"+proyectos.getInicial()+"',programado='"+proyectos.getProgramado()+"',"
		    				+ "real='"+proyectos.getReal()+"',peso='"+proyectos.getPeso()+"'";
		   // 
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
**/	 
	 public static boolean updateEstado(String nombre, String usuario){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE PROYECTOSPRIORITARIOS SET activo='false' WHERE nombre='"+nombre+"' AND usuario='"+usuario+"'";
		   System.out.println(query);// 
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
	 
		public ResultSet consultarPPHJ(){
			 ResultSet resultado = null;
			 try {
				   ConexionBase c=new ConexionBase();
				   Connection con=c.getConexion();
				   if(con!=null){
				    Statement st;
				    st = con.createStatement();
				    String query= "SELECT nombre, usuario, unidad, fecha, peso, pEne, rEne, pFeb, rFeb, pMar, rMar, pAbr, rAbr, pMay, rMay, pJun, rJun, pJul, rJul, pAgo, rAgo, pSep, rSep, pOct, rOct, pNov, rNov, pDic, rDic FROM PROYECTOSPRIORITARIOS WHERE ACTIVO='True'";
				 System.out.println(query);System.out.println(query);
				 //  String clave="";
				    // 
				    //st.executeQuery(query);
				    resultado = st.executeQuery(query);
				   
				   
				   //st.close();
				   }
				   //c.cerrarConexion();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
			return resultado;
		}
	 
	 public static boolean verificaRepetido(Prioridad verificaRepetido){
		 boolean correcto=false;
		  String claveReal="";
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query=  "SELECT nombre FROM ProyectosPrioritarios WHERE nombre='"+verificaRepetido.getNombre()+"'AND usuario='"+verificaRepetido.getUsuario()+"'";
		   // 
		    System.out.println(query);
		    
			ResultSet rs=st.executeQuery(query);
				
			   try{
				   while(rs.next()){
					claveReal=rs.getString(1);
					//System.out.println(claveReal);
					}
				  }catch (Exception e) {
		              
		          } 
		    
		    st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   correcto=true;
		   e.printStackTrace();
		  }
		  
		  if(claveReal.equals(verificaRepetido.getNombre())){
				correcto=true;
			}
		  return correcto;
	}
	 
	 
	}