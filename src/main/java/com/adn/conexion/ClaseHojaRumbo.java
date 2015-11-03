package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.HojaRumbo;


public class ClaseHojaRumbo {
	
	public static boolean EliminaAprobadores2(String div1,String div2, String div3, String div4, String apro, String mesea2,String aproe1,int cont, int conn, String esta){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET "+apro+"='',aprobados='"+cont+"',numaprobadores='"+conn+"',estatus='"+esta+"',rapro1='"+div1+"',rapro2='"+div2+"',rapro3='"+div3+"',rapro4='"+div4+"' WHERE mes='"+mesea2+"' AND usuario='"+aproe1+"';";
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
	
	public static boolean apruebaUsu(String uah, String mes,String fecha,String nombre, int cont, String cc){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET "+uah+"='estatusverde', aprobados='"+cont+"',estatus='"+cc+"',liberacion='"+fecha+"' WHERE mes='"+mes+"' AND usuario='"+nombre+"';";
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
	
	public static boolean denegarUsu(String uah, String mes,String nombre, int cont,String estatus){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET "+uah+"='estatusrojo', aprobados='"+cont+"', estatus='"+estatus+"' WHERE mes='"+mes+"' AND usuario='"+nombre+"';";
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
	
	public static boolean agregaAprobadores2(String apro1, String apro2, String apro3, String apro4, int cont, int ct, String mes, String aprobado,String esta){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET apro1='"+apro1+"', apro2='"+apro2+"', apro3='"+apro3+"', apro4='"+apro4+"', numAprobadores='"+cont+"',aprobados='"+ct+"',estatus='"+esta+"' WHERE mes='"+mes+"' and usuario='"+aprobado+"'";
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
	
	public static boolean agregaAprobadores(String usuario, String mes, String apro, String nvoApro, String rapro,String estilo, int cont, String estatus){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET "+apro+"='"+nvoApro+"',"+rapro+"='"+estilo+"', numAprobadores='"+cont+"',estatus='"+estatus+"' WHERE mes='"+mes+"' and usuario='"+usuario+"'";
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
	
	public static boolean solicitudApro(String estatus,String fecha, String mes, String usuario, String rapro, String valorRapro){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET estatus='"+estatus+"',solicitud='"+fecha+"',"+rapro+"='"+valorRapro+"' WHERE mes='"+mes+"' and usuario='"+usuario+"'";
		   System.out.println(query);System.out.println(query);
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
	
	public ArrayList<HojaRumbo> consultar(String user){
		 ResultSet resultado = null;
		 ArrayList<HojaRumbo> arrHR = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT aprobados, resultado, solicitud, liberacion, estatus, mes, numAprobadores FROM hojaRumbo WHERE usuario='"+user+"'";
			    System.out.println(query);				//		1			2			3			4			5	6		7
			    resultado = st.executeQuery(query);
			    arrHR = new ArrayList<HojaRumbo>();
			    while(resultado.next()){
			    	HojaRumbo hr = new HojaRumbo();
					hr.setAprobados(resultado.getString(1));
					hr.setResultado(resultado.getString(2));
					hr.setSolicitud(resultado.getString(3));
					hr.setLiberacion(resultado.getString(4)!=null?resultado.getString(4):"");
					hr.setEstatus(resultado.getString(5));
					String mes=resultado.getString(6);
					int mesn = Integer.parseInt(mes);
					if(mesn==0)mes="Enero";
					if(mesn==1)mes="Febrero";
					if(mesn==2)mes="Marzo";
					if(mesn==3)mes="Abril";
					if(mesn==4)mes="Mayo";
					if(mesn==5)mes="Junio";
					if(mesn==6)mes="Julio";
					if(mesn==7)mes="Agosto";
					if(mesn==8)mes="Septiembre";
					if(mesn==9)mes="Octubre";
					if(mesn==10)mes="Noviembre";
					if(mesn==11)mes="Diciembre";
					hr.setMes(mes);
					hr.setAprobadores(resultado.getString(7)!=null?resultado.getString(7):"0");
					arrHR.add(hr);
			    }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrHR;
	}
	
	public ResultSet consultarHojaRumbo(){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT estatus, mes, resultado, solicitud, usuario, anio FROM hojaRumbo";
			 
			 System.out.println(query);//  String clave="";
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
	
//	public ResultSet consultarFecha(){
//		 ResultSet resultado = null;
//		 try {
//			   ConexionBase c=new ConexionBase();
//			   Connection con=c.getConexion();
//			   if(con!=null){
//			    Statement st;
//			    st = con.createStatement();
//			    String query= "SELECT aprobados, resultado, solicitud, liberacion, estatus, mes, resultado FROM hojaRumbo WHERE usuario='"+user+"'" ;
//			 //  String clave="";
//			    // 
//			    //st.executeQuery(query);
//			    resultado = st.executeQuery(query);
//			   
//			   
//			   //st.close();
//			   }
//			   //c.cerrarConexion();
//			  } catch (SQLException e) {
//			   e.printStackTrace();
//			  }
//		return resultado;
//	}
	
	public static boolean EliminaAprobador(String usu, String mes, String ap,String apValor,String ap1,String apValor1,String ap2,String apValor2,String ap3,String apValor3,int valoresEnviados, int cont){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET ";
		    
		    if(valoresEnviados > 0){
			    switch (valoresEnviados){
			    	case 1:
			    		query = query + ap + "='"+apValor+"'";
			    		break;
			    	case 2:
			    		query = query + ap + "='"+apValor+"',"+ ap1 + "='"+apValor1+"'";
			    		break;
			    	case 3:
			    		query = query + ap + "='"+apValor+"',"+ ap1 + "='"+apValor1+"',"+ap2+"='"+apValor2+"'";
			    		break;
			    	case 4:
			    		query = query + ap + "='"+apValor+"',"+ ap1 + "='"+apValor1+"',"+ap2+"='"+apValor2+"',"+ap3+"='"+apValor3+"'";
			    		break;
			    
			    }
		    }
		    query = query +", numAprobadores='"+cont+"' WHERE mes='"+mes+"' AND usuario='"+usu+"'";
		    System.out.println(query);System.out.println(query);
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
	
	
	public static boolean agregarHojaRumbo(HojaRumbo hoja, String anio, String porcentajeInd, String porcentajeProy){
		boolean agregado=false;
		  try {
			  ConexionBase c=new ConexionBase();
			  Connection con=c.getConexion();
			  if(con!=null){
				  Statement st;
				  st = con.createStatement();
				  String query= "INSERT INTO HojaRumbo (usuario,mes,solicitud,resultado,estatus, anio, porcentajeInd, porcentajeProy)VALUES ('"+hoja.getUsuario()+"','"+hoja.getMes()+"','"+hoja.getSolicitud()+"','"+hoja.getResultado()+"','Pendiente','"+anio+"','"+porcentajeInd+"','"+porcentajeProy+"')";
		 System.out.println(query);  // System.out.println(query);
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
	
	public static boolean updateHojaRumbo(HojaRumbo hoja, String anio, String porcentajeInd, String porcentajeProy){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE hojaRumbo SET resultado='"+hoja.getResultado()+"', porcentajeInd='"+porcentajeInd+"',porcentajeProy='"+porcentajeProy+"' WHERE usuario='"+hoja.getUsuario()+"' AND mes='"+hoja.getMes()+"' AND anio='"+anio+"'";
		 System.out.println(query);  // 
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
	
	public static ArrayList<HojaRumbo> consultaApro1(String usuario, String mes){
		 ResultSet rs = null;
		 String apro1="", apro2="", apro3="", apro4="", mesA1="",rapro1="", rapro2="", rapro3="", rapro4="";
		 ArrayList<HojaRumbo> arrHoja = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT (SELECT usu.nombre FROM usuarios usu WHERE usu.correo = hr.apro1), (SELECT usu.user FROM usuarios usu WHERE usu.correo = hr.apro1), hr.apro1, "
			    				   + "(SELECT usu.nombre FROM usuarios usu WHERE usu.correo = hr.apro2), (SELECT usu.user FROM usuarios usu WHERE usu.correo = hr.apro2), hr.apro2,"
			    				   + "(SELECT usu.nombre FROM usuarios usu WHERE usu.correo = hr.apro3), (SELECT usu.user FROM usuarios usu WHERE usu.correo = hr.apro3), hr.apro3,"
			    				   + "(SELECT usu.nombre FROM usuarios usu WHERE usu.correo = hr.apro4), (SELECT usu.user FROM usuarios usu WHERE usu.correo = hr.apro4), hr.apro4,"
			    				   + "hr.mes,hr.rapro1,hr.rapro2,hr.rapro3,hr.rapro4, hr.estatus, hr.numAprobadores FROM hojaRumbo hr WHERE usuario='"+usuario+"' and mes='"+mes+"'";
			    System.out.println(query);					// 13		14			15		16			17		18			19									
			    rs = st.executeQuery(query);
			    arrHoja = new ArrayList<HojaRumbo>();
			    while(rs.next()){	
			    	HojaRumbo hr = new HojaRumbo();
					if(rs.getString(3)==(null)){
						hr.setNbApro1("");
						hr.setUsuApro1("");
						apro1="";
					}else{
						//request.getAttribute("nbApro4")!=(null))?request.getAttribute("nbApro4"): ""
						hr.setNbApro1(rs.getString(1)!=null?rs.getString(1):"");
						hr.setUsuApro1(rs.getString(2)!=null?rs.getString(2):"");
						apro1=rs.getString(3);
					}
					if(rs.getString(6)==(null)){
						hr.setNbApro2("");
						hr.setUsuApro2("");
						apro2="";
					}else{
						hr.setNbApro2(rs.getString(4)!=null?rs.getString(4):"");
						hr.setUsuApro2(rs.getString(5)!=null?rs.getString(5):"");
						apro2=rs.getString(6);
					}
					if(rs.getString(9)==(null)){
						hr.setNbApro3("");
						hr.setUsuApro3("");
						apro3="";
					}else{
						hr.setNbApro3(rs.getString(7)!=null?rs.getString(7):"");
						hr.setUsuApro3(rs.getString(8)!=null?rs.getString(8):"");
						apro3=rs.getString(9);
					}
					if(rs.getString(12)==(null)){
						hr.setNbApro4("");
						hr.setUsuApro4("");
						apro4="";
					}else{
						hr.setNbApro4(rs.getString(10)!=null?rs.getString(10):"");
						hr.setUsuApro4(rs.getString(11)!=null?rs.getString(11):"");
						apro4=rs.getString(12);
					}
					
					mesA1=rs.getString(13);
					
					if(rs.getString(14)==(null)){
						rapro1="estatusblanco";
					}else{
						rapro1=rs.getString(14);
					}
					if(rs.getString(15)==(null)){
						rapro2="estatusblanco";
					}else{
						rapro2=rs.getString(15);
					}
					if(rs.getString(16)==(null)){
						rapro3="estatusblanco";
					}else{
						rapro3=rs.getString(16);
					}
					if(rs.getString(17)==(null)){
						rapro4="estatusblanco";
					}else{
						rapro4=rs.getString(17);
					}
					
					hr.setApro1(apro1);
					hr.setApro2(apro2);
					hr.setApro3(apro3);
					hr.setApro4(apro4);
					hr.setMes(mesA1);
					hr.setRapro1(rapro1);
					hr.setRapro2(rapro2);
					hr.setRapro3(rapro3);
					hr.setRapro4(rapro4);
					hr.setEstatus(rs.getString(18));
					hr.setAprobadores(rs.getString(19)!=null?rs.getString(19):"0");
					arrHoja.add(hr);
			   st.close();
			   }
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrHoja;
	}
	
	/**
	 * Consulta los porcentajes
	 * @param usuario
	 * @param mes
	 * @return
	 */
	public static ArrayList<String> consultarPorcentajes(String usuario,String mesNum,String anio){
		ArrayList<String> arrPorcentajes = new ArrayList<String>();
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT porcentajeInd, porcentajeProy from hojaRumbo WHERE usuario='"+usuario+"' and mes='"+mesNum+"' and anio='"+anio+"'";
			    resultado = st.executeQuery(query);
			     
			    while(resultado.next()){
			    	//Siempre asignara el ultimo de cada usuario en cada mes
					if(resultado.getString(1)!=null){
						arrPorcentajes.add(resultado.getString(1));	
					}else{
						arrPorcentajes.add("0");
					}
					if(resultado.getString(2)!=null){
						arrPorcentajes.add(resultado.getString(2));	
					}else{
						arrPorcentajes.add("0");
					}
				}
			   
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrPorcentajes;
	}
	
	public static ArrayList<HojaRumbo> consultaApro2(String usuario, String mes){
		 ResultSet resultado = null;
		 ArrayList<HojaRumbo> arrHR=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT apro1,apro2,apro3,apro4,mes,aprobados,usuario,rapro1,rapro2,rapro3,rapro4,numaprobadores,estatus from hojaRumbo WHERE usuario='"+usuario+"' and mes='"+mes+"'";
			    System.out.println(query);//						1		2	3		4	5	6			7		8	9		10		11		12			13
			    resultado = st.executeQuery(query);
			    arrHR = new ArrayList<HojaRumbo>();
			    while(resultado.next()){	
			    	HojaRumbo hr = new HojaRumbo();
					hr.setApro1(resultado.getString(1)!=null?resultado.getString(1):"");
					hr.setApro2(resultado.getString(2)!=null?resultado.getString(2):"");
					hr.setApro3(resultado.getString(3)!=null?resultado.getString(3):"");
					hr.setApro4(resultado.getString(4)!=null?resultado.getString(4):"");
					
					hr.setMes(resultado.getString(5));
					hr.setAprobados(resultado.getString(6));
					hr.setUsuario(resultado.getString(7));
					hr.setRapro1(resultado.getString(8)!=null?resultado.getString(8):"estatusblanco");
					hr.setRapro2(resultado.getString(9)!=null?resultado.getString(9):"estatusblanco");
					hr.setRapro3(resultado.getString(10)!=null?resultado.getString(10):"estatusblanco");
					hr.setRapro4(resultado.getString(11)!=null?resultado.getString(11):"estatusblanco");
					hr.setAprobadores(resultado.getString(12));
					hr.setEstatus(resultado.getString(13));
					arrHR.add(hr);
			   st.close();
			   }
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrHR;
	}
	
	public static String consultaIdHR(String usuario, String mes){
		 ResultSet resultado = null;
		 String idHR=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT id FROM HojaRumbo WHERE usuario='"+usuario+"' and mes='"+mes+"'";
			   System.out.println(query); //					   1		2	3		4	5	6			7		8	9		10		11		12			13
			    resultado = st.executeQuery(query);
			    while(resultado.next()){	
			    	idHR =(resultado.getString(1)!=null?resultado.getString(1):"");
			   st.close();
			   }
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return idHR;
	}
	
	
	public static boolean verificaRepetido(HojaRumbo hoja, String anio){
		 boolean correcto=false;
		 String claveReal="";
		 	try {
		 		ConexionBase c=new ConexionBase();
		 		Connection con=c.getConexion();
		 		if(con!=null){
		 			Statement st;
		 			st = con.createStatement();
		 			String query=  "SELECT mes FROM hojaRumbo WHERE usuario='"+hoja.getUsuario()+"' AND mes='"+hoja.getMes()+"' AND anio='"+anio+"'";
System.out.println(query);
		 			ResultSet rs=st.executeQuery(query);
				
		 			try{
		 				while(rs.next()){
		 					claveReal=rs.getString(1);
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
		  
		  if(claveReal.equals(hoja.getMes())){
				correcto=true;
			}
		  return correcto;
	}
	
	public static boolean verificaEstado(HojaRumbo hoja, String anio){
		 boolean correcto=false;
		 String claveReal="";
		 	try {
		 		ConexionBase c=new ConexionBase();
		 		Connection con=c.getConexion();
		 		if(con!=null){
		 			Statement st;
		 			st = con.createStatement();
		 			String query=  "SELECT mes FROM hojaRumbo WHERE usuario='"+hoja.getUsuario()+"' AND mes='"+hoja.getMes()+"' AND anio='"+anio+"' AND estatus='Aprobada'";
System.out.println(query);
		 			ResultSet rs=st.executeQuery(query);
				
		 			try{
		 				while(rs.next()){
		 					claveReal=rs.getString(1);
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
		  
		  if(claveReal.equals(hoja.getMes())){
				correcto=true;
			}
		  return correcto;
	}
	
	public ArrayList<HojaRumbo> consultar3(String user){
		 ResultSet resultado = null;
		 ArrayList<HojaRumbo> hojaRumbo = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT hr.aprobados, hr.resultado, hr.solicitud, hr.liberacion, hr.estatus,hr.mes,hr.usuario, hr.numAprobadores FROM hojaRumbo hr, usuarios u  WHERE u.user ='"+user+"' AND (hr.apro1=u.correo OR hr.apro2=u.correo OR hr.apro3=u.correo OR hr.apro4=u.correo)";
			   System.out.println(query); //							1			2			3				4				5		6		7				8
			    //System.out.println("Hojas de equipo "+query);
			    resultado = st.executeQuery(query);
			    hojaRumbo = new ArrayList<HojaRumbo>();
			    while(resultado.next()){	
			    	HojaRumbo hr = new HojaRumbo();
					hr.setAprobados(resultado.getString(1)!=null?resultado.getString(1):"0");
					hr.setResultado(resultado.getString(2)!=null?resultado.getString(2):"");
					hr.setSolicitud(resultado.getString(3)!=null?resultado.getString(3):"");
					hr.setLiberacion(resultado.getString(4)!=null?resultado.getString(4):"");
					hr.setEstatus(resultado.getString(5));
					hr.setMes(resultado.getString(6));
					hr.setUsuario(resultado.getString(7));
					hr.setAprobadores(resultado.getString(8)!=null?resultado.getString(8):"0");
					hojaRumbo.add(hr);
			   
			   }
			    st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return hojaRumbo;
	}
				   	
	public ArrayList<HojaRumbo> consultar33(String user){
		 ResultSet resultado = null;
		 ResultSet resultado2 = null;
		 String query2="";
		ArrayList<String> lista=new ArrayList<String>();
		ArrayList<HojaRumbo> hojaRumbo=new ArrayList<HojaRumbo>();
		 //ResultSet [] result = {};
		 ConexionBase c=new ConexionBase();
		 Connection con=c.getConexion();
		
		 try {
			   
			   
			   if(con!=null){
				    Statement st;
				    Statement st2;
				    st = con.createStatement();
				    st2 = con.createStatement();
				    String query= "SELECT nombre FROM usuarios WHERE apro1='"+user+"' or apro2='"+user+"' or apro3='"+user+"' or apro4='"+user+"'"  ;
				   System.out.println(query);
				    resultado = st.executeQuery(query);
				    
			    try{
				    while(resultado.next()){
				    //	v++;
			    		lista.add(resultado.getString(1));
			    		 System.out.println(lista);
				    }
				    lista.trimToSize();
				    	for(int a=0; a<lista.size(); a++){
				    		query2= "SELECT aprobados,"
				    				+ " resultado,"
				    				+ " solicitud, "
				    				+ "liberacion, "
				    				+ "estatus,"
				    				+ "mes,"
				    				+ "usuario"
				    				+ " FROM hojaRumbo WHERE aprobados='"+lista.get(a)+"'" ;
				    		resultado2 = st2.executeQuery(query2);
				    		resultado2.next();
				    		hojaRumbo.add(new HojaRumbo(resultado2.getString("aprobados"),
				    									resultado2.getString("resultado"),
				    									resultado2.getString("solicitud"),
				    									resultado2.getString("liberacion"),
				    									resultado2.getString("estatus"),
				    									resultado2.getString("mes"),
				    									resultado2.getString("usuario")));
				    		resultado2=null;
				    		
				    	}
				    	hojaRumbo.trimToSize();
				    	System.out.println(lista);
			  }
		 catch (SQLException e) {
			   e.printStackTrace();
			  }
	}
		 }catch (SQLException e) {
			   e.printStackTrace();
			  }
		 finally{
			 if(con!=null){
				 
				 try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
		 }
			return hojaRumbo;
}
	
	public static HojaRumbo consultaHR(String usuario, String mes, String anio){
		 ResultSet resultado = null;
		 HojaRumbo hojaR=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT id, estatus FROM hojaRumbo WHERE usuario='"+usuario+"' and mes='"+mes+"' and anio='"+anio+"'";
			    System.out.println(query);//					   1		2	3		4	5	6			7		8	9		10		11		12			13
			    resultado = st.executeQuery(query);
			    while(resultado.next()){	
			    	hojaR = new HojaRumbo();
			    	hojaR.setEstatus(resultado.getString(2)!=null?resultado.getString(2):"");
			   st.close();
			   }
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return hojaR;
	}
	

}
