package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.controlador.Actividades;

public class ClaseAltaActividades {
	
	
	public ResultSet consultar(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= ("select NombreActividad,fecha,peso,ep,er,fp,fr,map,mar,ap,ar,myp,myr,jnp,jnr,jlp,jlr,agp,agr,sp,sr,op,ocr,np,nr,dp,dr from AltaActividades where usuario='"+user+"'");
			 //  String clave="";
			    // 
			    //st.executeQuery(query);
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			   
			   
			   //st.close();
			   }
			   //c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return resultado;
	}
	
	public ResultSet consultarCompleto(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, unidad, meta, resultado, peso, frecuencia, sentido, entregamedible, tipo, corte, rpond, sem1, sem2, sem3, sem4, sem5, comentarios FROM INDICADORESINTELIGENTES WHERE nombre='"+user+"' AND ACTIVO='True'";
			 System.out.println(query);
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
	
	public static boolean actualizaAct(Actividades nuevoActividad){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "DELETE FROM AltaActividades WHERE idActividad='"+nuevoActividad.getId()+"'";
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
	
	
	
	public static boolean agregarProyecto(Actividades nuevoActividad){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO ProyectosPrioritarios (nombre, unidad, fecha, peso, usuario, pEne, "
		    		+ "rEne, pFeb, rFeb, pMar, rMar, pAbr, rAbr, pMay, rMay, pJun, rJun, pJul, rJul,"
		    		+ "pAgo, rAgo, pSep, rSep, pOct, rOct, pNov, rNov, pDic, rDic) VALUES ('"+nuevoActividad.getNombre1()+"','"+nuevoActividad.getUnidad()+"',"
		    		+ "'"+nuevoActividad.getFecha1()+"','"+nuevoActividad.getPeso()+"','"+nuevoActividad.getUsuario()+"','"+nuevoActividad.getLpe()+"',"
		    		+ "'"+nuevoActividad.getLre()+"','"+nuevoActividad.getLpf()+"','"+nuevoActividad.getLrf()+"','"+nuevoActividad.getLmap()+"',"
		    		+ "'"+nuevoActividad.getLmar()+"','"+nuevoActividad.getLap()+"','"+nuevoActividad.getLar()+"','"+nuevoActividad.getLmyp()+"',"
		    		+ "'"+nuevoActividad.getLmyr()+"','"+nuevoActividad.getLjnp()+"','"+nuevoActividad.getLjnr()+"','"+nuevoActividad.getLjlp()+"',"
		    		+ "'"+nuevoActividad.getLjlr()+"','"+nuevoActividad.getLagp()+"','"+nuevoActividad.getLagr()+"',"
		    		+ "'"+nuevoActividad.getLsp()+"','"+nuevoActividad.getLsr()+"','"+nuevoActividad.getLop()+"','"+nuevoActividad.getLor()+"','"+nuevoActividad.getLnp()+"','"+nuevoActividad.getLnr()+"',"
		    				+ "'"+nuevoActividad.getLdp()+"','"+nuevoActividad.getLdr()+"')";
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
	
	
	
 
	 public static boolean agregarActividad(Actividades nuevoActividad){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO AltaActividades (NombreActividad, fecha, peso, ep, er, fp, fr, map, mar, ap, ar, myp, myr, jnp, jnr, jlp, jlr, agp, agr, sp, sr, op, ocr, np,nr, dp, dr, nombreproyecto, usuario)"
		    		+ "	VALUES ('"+nuevoActividad.getNombre()+"',"+ "'"+nuevoActividad.getFecha()+"','"+nuevoActividad.getPeso()+"','"+nuevoActividad.getPe()+"',"
		    			 + "'"+nuevoActividad.getRe()+"','"+nuevoActividad.getPf()+"','"+nuevoActividad.getRf()+"',"
		    			 + "'"+nuevoActividad.getMap()+"','"+nuevoActividad.getMar()+"','"+nuevoActividad.getAp()+"',"
		    			 + "'"+nuevoActividad.getAr()+"','"+nuevoActividad.getMyp()+"','"+nuevoActividad.getMyr()+"',"
		    			 + "'"+nuevoActividad.getJnp()+"','"+nuevoActividad.getJnr()+"','"+nuevoActividad.getJlp()+"',"
		    			 + "'"+nuevoActividad.getJlr()+"','"+nuevoActividad.getAgp()+"','"+nuevoActividad.getAgr()+"',"
		    			 + "'"+nuevoActividad.getSp()+"','"+nuevoActividad.getSr()+"','"+nuevoActividad.getOp()+"',"
		    			 + "'"+nuevoActividad.getOr()+"','"+nuevoActividad.getNp()+"','"+nuevoActividad.getNr()+"',"
		    			 + "'"+nuevoActividad.getDp()+"','"+nuevoActividad.getDr()+"','"+nuevoActividad.getProyecto()+"',"
		    			 + "'"+nuevoActividad.getUsuario()+"');";
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
 
 public static boolean update(Actividades actividades){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "DELETE FROM AltaActividades WHERE usuario='"+actividades.getUsuario()+"' AND Nombreproyecto='"+actividades.getNombre()+"'";
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
 
 
 public static boolean updateEstado(String nombre, String usuario){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE IndicadoresInteligentes SET activo='false' WHERE nombre='"+nombre+"' AND usuario='"+usuario+"'";
System.out.println(query);
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
 
 
	 public static boolean verificaRepetido(Actividades verificaRepetido){
		 boolean correcto=false;
		  String claveReal="";
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query=  "SELECT nombre FROM IndicadoresInteligentes WHERE nombre='"+verificaRepetido.getNombre()+"' AND usuario='"+verificaRepetido.getUsuario()+"' ";
System.out.println(query);
		   // 
		    
		    
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