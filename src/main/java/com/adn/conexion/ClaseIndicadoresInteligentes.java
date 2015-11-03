package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.IndicadorInteligente;


public class ClaseIndicadoresInteligentes {
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	public static ArrayList <IndicadorInteligente> consultar(String user, String mes, String anio){
		ArrayList <IndicadorInteligente> arrIndInte = new ArrayList<IndicadorInteligente>();
		ResultSet resultado = null;
		if(user != "" && mes != "" && anio != ""){
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT ii.idIndInte, (SELECT ind.nb_indicador FROM indicadores ind WHERE ii.idIndicador = ind.idIndicador),ii.idIndicador, ii.frecuencia, ii.estatus, ii.meta, ii.peso, ii.tipo, ii.res_ponderado, ii.prog_quin1, ii.prog_quin2, ii.prog_sem1, ii.prog_sem2, ii.prog_sem3, ii.prog_sem4, ii.prog_sem5, ii.usuario, ii.resul_quin1, ii.resul_quin2, ii.resul_sem1, ii.resul_sem2, ii.resul_sem3, ii.resul_sem4, ii.resul_sem5, resultado, (SELECT filInd.unidad_medida FROM FiltroIndicadores filInd, indicadores ind WHERE filInd.idIndicador = ind.idIndicador AND ind.idIndicador = ii.idIndicador), (SELECT filInd.sentido FROM FiltroIndicadores filInd, indicadores ind WHERE filInd.idIndicador = ind.idIndicador AND ind.idIndicador = ii.idIndicador) FROM indinte ii WHERE usuario='"+user+"' AND anio='"+anio+"' AND mes='"+mes.toLowerCase()+"'";
			    //					  1				2																						3				4				5	  	6		7		8	 			9	  		10			11			12	 	13	   		14			15		 16		   17		18			19			20				21			22			23			24
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	IndicadorInteligente indInt = new IndicadorInteligente();
			    	int idIndInte = Integer.parseInt(resultado.getString(1));
			    	int idIndicador = Integer.parseInt(resultado.getString(3));
			    	indInt.setIdIndInte(idIndInte);
			    	indInt.setNombre((resultado.getString(2)!=""?resultado.getString(2):""));
			    	indInt.setIdIndicador(idIndicador);
				    indInt.setFrecuencia((resultado.getString(4)!=""?resultado.getString(4):""));
				    indInt.setEstatus((resultado.getString(5)!=null?resultado.getString(5):""));
				    indInt.setMeta((resultado.getString(6)!=null?resultado.getString(6):"0"));
				    indInt.setPeso((resultado.getString(7)!=null?resultado.getString(7):"0"));
				    indInt.setTipo((resultado.getString(8)!=null?resultado.getString(8):""));
				    indInt.setRpond((resultado.getString(9)!=null?resultado.getString(9):"0"));
				    indInt.setProgQuin1((resultado.getString(10)!=null?resultado.getString(10):""));
				    indInt.setProgQuin2((resultado.getString(11)!=null?resultado.getString(11):""));
				    indInt.setProgSem1((resultado.getString(12)!=null?resultado.getString(12):""));
				    indInt.setProgSem2((resultado.getString(13)!=null?resultado.getString(13):""));
				    indInt.setProgSem3((resultado.getString(14)!=null?resultado.getString(14):""));
				    indInt.setProgSem4((resultado.getString(15)!=null?resultado.getString(15):""));
				    indInt.setProgSem5((resultado.getString(16)!=null?resultado.getString(16):""));
				   // indInt.setSentido((resultado.getString(17)!=""?resultado.getString(17):""));
				    indInt.setUsuario((resultado.getString(17)!=null?resultado.getString(17):""));
				    indInt.setResulQuin1((resultado.getString(18)!=null?resultado.getString(18):""));
				    indInt.setResulQuin2((resultado.getString(19)!=null?resultado.getString(19):""));
				    indInt.setResulSem1((resultado.getString(20)!=null?resultado.getString(20):""));
				    indInt.setResulSem2((resultado.getString(21)!=null?resultado.getString(21):""));
				    indInt.setResulSem3((resultado.getString(22)!=null?resultado.getString(22):""));
				    indInt.setResulSem4((resultado.getString(23)!=null?resultado.getString(23):""));
				    indInt.setResulSem5((resultado.getString(24)!=null?resultado.getString(24):""));
				    indInt.setResultado((resultado.getString(25)!=null?resultado.getString(25):"0"));
				    indInt.setUnidad((resultado.getString(26)!=null?resultado.getString(26):""));
				    indInt.setSentido((resultado.getString(27)!=null?resultado.getString(27):""));
				    indInt.setAnio(anio);
				    arrIndInte.add(indInt);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		}
		return arrIndInte;
	}
	
	public ResultSet consultarII(){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, usuario, unidad, anio, ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic FROM indinte";
			System.out.println(query); //  String clave="";
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
	
	public ResultSet consultarIndInte(String user, int anio){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, frecuencia, tipo FROM indinte WHERE usuario='"+user+"' AND anio='"+anio+"'";
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
	
	public static IndicadorInteligente consultarCompletoIndInte(int idIndInte, String usuario, String mes, String anio){
		 ResultSet resultado = null;
		 IndicadorInteligente indinte=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT ii.frecuencia, ind.nb_indicador, ii.meta, ii.mes, ii.peso, ii.prog_quin1, ii.prog_quin2, ii.prog_sem1, ii.prog_sem2, ii.prog_sem3, ii.prog_sem4, ii.prog_sem5, ii.res_ponderado, ii.resul_quin1, ii.resul_quin2, ii.resul_sem1, ii.resul_sem2, ii.resul_sem3, ii.resul_sem4, ii.resul_sem5, ii.resultado, ii.tipo, ii.idIndicador  FROM IndInte ii, Indicadores ind WHERE ii.idIndicador = ind.idIndicador AND ii.estatus='activo' AND ii.mes='"+mes.toLowerCase()+"' AND ii.anio='"+anio+"' AND ii.usuario='"+usuario+"' AND ii.idIndInte="+idIndInte;
			    System.out.println(query);		//  				1				2				3		4		5		6				7				8				9			10			11				12			13					14					15			16				17			18				19				20				21			22      23
			    resultado = st.executeQuery(query);
			    if(resultado!=null && !resultado.equals("")){
					   	while(resultado.next()){
					   		indinte = new IndicadorInteligente();
					   		indinte.setIdIndInte(idIndInte);
					   		indinte.setFrecuencia(resultado.getString(1)!=null?resultado.getString(1):"");
					   		indinte.setNombre(resultado.getString(2)!=null?resultado.getString(2):"");
					   		indinte.setMeta(resultado.getString(3)!=null?resultado.getString(3):"0");
					   		indinte.setMes(mes);
					   		indinte.setPeso(resultado.getString(5)!=null?resultado.getString(5):"0");
					   		indinte.setProgQuin1(resultado.getString(6)!=null?resultado.getString(6):"0");
					   		indinte.setProgQuin2(resultado.getString(7)!=null?resultado.getString(7):"0");
					   		indinte.setProgSem1(resultado.getString(8)!=null?resultado.getString(8):"0");
					   		indinte.setProgSem2(resultado.getString(9)!=null?resultado.getString(9):"0");
					   		indinte.setProgSem3(resultado.getString(10)!=null?resultado.getString(10):"0");
					   		indinte.setProgSem4(resultado.getString(11)!=null?resultado.getString(11):"0");
					   		indinte.setProgSem5(resultado.getString(12)!=null?resultado.getString(12):"0");
					   		indinte.setRpond(resultado.getString(13)!=null?resultado.getString(13):"0");
					   		indinte.setResulQuin1(resultado.getString(14)!=null?resultado.getString(14):"0");
					   		indinte.setResulQuin2(resultado.getString(15)!=null?resultado.getString(15):"0");
					   		indinte.setResulSem1(resultado.getString(16)!=null?resultado.getString(16):"0");
					   		indinte.setResulSem2(resultado.getString(17)!=null?resultado.getString(17):"0");
					   		indinte.setResulSem3(resultado.getString(18)!=null?resultado.getString(18):"0");
					   		indinte.setResulSem4(resultado.getString(19)!=null?resultado.getString(19):"0");
					   		indinte.setResulSem5(resultado.getString(20)!=null?resultado.getString(20):"0");
					   		indinte.setResultado(resultado.getString(21)!=null?resultado.getString(21):"0");
					   		indinte.setTipo(resultado.getString(22)!=null?resultado.getString(22):"");
					   		int idIndicador = Integer.parseInt(resultado.getString(23)!=null?resultado.getString(23):"0");
					   		indinte.setIdIndicador(idIndicador);
					   	}
			    }
			    st.close();  
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return indinte;
	}
	
	public ResultSet consultarCompleto(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nombre, unidad, meta, resultado, peso, frecuencia, sentido, entregamedible, tipo, corte, rpond, sem1, sem2, sem3, sem4, sem5, comentarios FROM INDICADORESINTELIGENTES WHERE nombre='"+user+"' AND ACTIVO='true'";
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
 
	 public static boolean agregarIndicador(IndicadorInteligente nuevoIndicador){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO IndInte (anio, estatus, idIndicador, mes, peso, usuario, meta, resultado, res_ponderado) VALUES ('"+nuevoIndicador.getAnio()+"','"+nuevoIndicador.getEstatus()+"','"+nuevoIndicador.getIdIndicador()+"','"+nuevoIndicador.getMes()+"','"+nuevoIndicador.getPeso()+"','"+nuevoIndicador.getUsuario()+"','"+nuevoIndicador.getMeta()+"','"+nuevoIndicador.getResultado()+"','"+nuevoIndicador.getRpond()+"')";
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
 
 public static boolean update(IndicadorInteligente indicador, String user, String mes){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE IndInte SET peso='"+indicador.getPeso()+"',meta='"+indicador.getMeta()+"',resultado='"+indicador.getResultado()+"',frecuencia='"+indicador.getFrecuencia()+"',tipo='"+indicador.getTipo()+"',res_ponderado='"+indicador.getRpond()+"',prog_quin1='"+indicador.getProgQuin1()+"',prog_quin2='"+indicador.getProgQuin2()+"'"
	    		+", prog_sem1='"+indicador.getProgSem1()+"',prog_sem2='"+indicador.getProgSem2()+"',prog_sem3='"+indicador.getProgSem3()+"',prog_sem4='"+indicador.getProgSem4()+"',prog_sem5='"+indicador.getProgSem5()+"'"
	    		+", resul_quin1='"+indicador.getResulQuin1()+"',resul_quin2='"+indicador.getResulQuin2()+"',resul_sem1='"+indicador.getResulSem1()+"',resul_sem2='"+indicador.getResulSem2()+"',resul_sem3='"+indicador.getResulSem3()+"'"
	    		+", resul_sem4='"+indicador.getResulSem4()+"',resul_sem5='"+indicador.getResulSem5()+"'"
	    		+" WHERE idIndInte='"+indicador.getIdIndInte()+"' AND usuario='"+user+"' AND mes='"+mes+"'";
	    System.out.println(query);
	    st.executeUpdate(query);
	    //System.out.println(query);
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
 
 
 public static boolean updateEstadoIndInte(int idIndInte, String usuario, String mes, String anio, String estatus){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE IndInte SET estatus='"+estatus+"', peso='0' WHERE idIndInte='"+idIndInte+"' AND anio='"+anio+"'AND usuario='"+usuario+"' AND mes='"+mes+"'";
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
 
 
	 public static boolean verificaRepetido(IndicadorInteligente verificaRepetido){
		 boolean correcto=false;
		  String claveReal="";
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query=  "SELECT idIndicador FROM IndInte WHERE idIndicador="+verificaRepetido.getIdIndicador()+" AND usuario='"+verificaRepetido.getUsuario()+"'AND anio='"+verificaRepetido.getAnio()+"' AND mes='"+verificaRepetido.getMes()+"'";
		   System.out.println(query);// 
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
		
		 /**
		  * Consulta nombre, a�o y usuario
		  * @return
		  */
		 public static ArrayList<Object> consultaNombreAnioIndInte(){
			 ArrayList<Object> indInteArr = new ArrayList<Object>();
			 String indInte = "";
			 ResultSet resultado = null;
			 Connection con = null;
			 Statement st = null;
			 try {
				   ConexionBase c=new ConexionBase();
				   con=c.getConexion();
				   if(con!=null){
				    st = con.createStatement();
				    String query= "SELECT ind.nb_indicador, indinte.anio, indinte.usuario FROM IndInte indinte, Indicadores ind WHERE indinte.idIndicador = ind.idIndicador";
				    System.out.println("Consulta: "+ query);
				    resultado = st.executeQuery(query);
				    if(!resultado.equals("")){
						   try {
								while(resultado.next()){
									indInte = resultado.getString(1) + "|" + resultado.getString(2) + "|" + resultado.getString(3);
									indInteArr.add(indInte);
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					   }
				    st.close();
				   }
				   con.close();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
				  return indInteArr;
		 }
		 /**
		  * Consulta los datos del mes a actualizar
		  * @param nombre
		  * @param mes
		  * @param anio
		  * @return Regresa el contenido del mes
		  */
		 public static String[] consultaMesxInd(String nombre, String mes, String anio){
			 String[] nuevoArr = new String[20];
			 ResultSet resultado = null;
			 Connection con = null;
			 Statement st = null;
			 try {
				   ConexionBase c=new ConexionBase();
				   con=c.getConexion();
				   if(con!=null){
				    st = con.createStatement();
				    String query= "SELECT "+mes+" FROM IndInte WHERE nombre='"+nombre+"' AND anio='"+anio+"'";
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(!resultado.equals("")){
				    	try {
						   	while(resultado.next()){
						   		if(resultado.getString(1) != null && !resultado.getString(1).equals("")){
							   		String[] mesArr =resultado.getString(1).split("-");
							   		//System.out.println(resultado.getString(1));
							   		for(int z=0; z<mesArr.length;z++){
							   			if(z==0){
							   				nuevoArr[z] = (mesArr[z]!=""?mesArr[z]:"activo");//Estatus
							   			}else{
							   				nuevoArr[z] = (mesArr[z]!=""?mesArr[z]:"vacio");//Estatus
							   			}
					   				}
							   		
						   		}else{
						   			for(int z=0; z<20;z++){
							   			if(z==0){
							   				nuevoArr[z] = "activo";//Estatus
							   			}else{
							   				nuevoArr[z] = "vacio";//Estatus
							   			}
							   				
					   				}
						   		}
						   	}
				    	} catch (SQLException e) {
							e.printStackTrace();
						}
				    }
				    st.close();  
				   }
				   con.close();
				  //c.cerrarConexion();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
				  return nuevoArr;
		 }
		 
		 /**
		  * 
		  * @param idIndicador
		  * @param mes
		  * @param anio
		  * @param usuario
		  * @return
		  */
		 public static IndicadorInteligente consultaMesxIndyUsu(int idIndicador, String mes, String anio,String usuario){
			 IndicadorInteligente indInte = null;
			 ResultSet resultado = null;
			 Connection con = null;
			 Statement st = null;
			 try {
				   ConexionBase c=new ConexionBase();
				   con=c.getConexion();
				   if(con!=null){
				    st = con.createStatement();
				    String query= "SELECT idIndInte, meta, resultado, resul_quin1, resul_quin2, resul_sem1, resul_sem2, resul_sem3, resul_sem4, resul_sem5  FROM IndInte WHERE idIndicador="+idIndicador+" AND anio='"+anio+"' AND usuario='"+usuario+"' AND mes='"+mes.toLowerCase()+"' AND estatus='activo'";
				    System.out.println(query);		//				1			2		3		4			5				6			7			8			9			10
				    resultado = st.executeQuery(query);
				    //System.out.println(query);
				    if(resultado!=null && !resultado.equals("")){
						   	while(resultado.next()){
						   		indInte = new IndicadorInteligente();
						   		int idIndInte = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
						   		indInte.setIdIndInte(idIndInte);
						   		indInte.setMes(resultado.getString(2)!=null?resultado.getString(2):"");
						   		indInte.setResultado(resultado.getString(3)!=null?resultado.getString(3):"");
						   		indInte.setResulQuin1(resultado.getString(4)!=null?resultado.getString(4):"");
						   		indInte.setResulQuin2(resultado.getString(5)!=null?resultado.getString(5):"");
						   		indInte.setResulSem1(resultado.getString(6)!=null?resultado.getString(6):"");
						   		indInte.setResulSem2(resultado.getString(7)!=null?resultado.getString(7):"");
						   		indInte.setResulSem3(resultado.getString(8)!=null?resultado.getString(8):"");
						   		indInte.setResulSem4(resultado.getString(9)!=null?resultado.getString(9):"");
						   		indInte.setResulSem5(resultado.getString(10)!=null?resultado.getString(10):"");
						   	}
				    }else{
				    	indInte =null;
				    }
				    st.close();  
				   }
				   con.close();
				  //c.cerrarConexion();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
				  return indInte;
		 }
		 /**
		  * 
		  * @param nombre
		  * @param mes
		  * @param anio
		  * @param usuario
		  * @return
		  */
		 public static ArrayList<IndicadorInteligente> consultaIndInactivo(String mes, String anio,String usuario){
			 ResultSet resultado = null;
			 Connection con = null;
			 Statement st = null;
			 ArrayList<IndicadorInteligente> arrIndInte=null;
			 try {
				   ConexionBase c=new ConexionBase();
				   con=c.getConexion();
				   if(con!=null){
				    st = con.createStatement();
				    String query= "SELECT ii.idIndInte, ind.nb_indicador FROM IndInte ii, Indicadores ind WHERE ii.idIndicador = ind.idIndicador AND ii.estatus='Inactivo' AND ii.mes='"+mes.toLowerCase()+"' AND ii.anio='"+anio+"' AND ii.usuario='"+usuario+"'";
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(resultado!=null && !resultado.equals("")){
				    	try {
				    		arrIndInte=new ArrayList<IndicadorInteligente>();
						   	while(resultado.next()){
						   		IndicadorInteligente indInte = new IndicadorInteligente();
						   		int idInd = Integer.parseInt(resultado.getString(1));
						   		indInte.setIdIndicador(idInd);
						   		indInte.setNombre(resultado.getString(2)!=null?resultado.getString(2):"");
						   		arrIndInte.add(indInte);
						   	}
				    	} catch (SQLException e) {
							e.printStackTrace();
						}
				    }
				    st.close();  
				   }
				   con.close();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
				  return arrIndInte;
		 }
		 
		 /**
		  * 
		  * @param arrIndInte
		  * @return
		  */
		public static ArrayList<IndicadorInteligente> consultaResultados(
				ArrayList<IndicadorInteligente> arrIndInte) {
			ResultSet resultado = null;
			 Connection con = null;
			 Statement st = null;
			for(int i=0; i<arrIndInte.size(); i++){
				IndicadorInteligente indInte = arrIndInte.get(i);
				try {
					   ConexionBase c=new ConexionBase();
					   con=c.getConexion();
					   if(con!=null){
					    st = con.createStatement();
					    String query= "SELECT mes, resultado, meta FROM IndInte WHERE idIndicador="+indInte.getIdIndicador()+" AND anio='"+indInte.getAnio()+"' AND usuario='"+indInte.getUsuario()+"'";
					    System.out.println(query);
					    resultado = st.executeQuery(query);
						    if(resultado!=null && !resultado.equals("")){
						    	while(resultado.next()){
						    		String mes = resultado.getString(1)!=null?resultado.getString(1):"";
						    		String result = resultado.getString(2)!=null?resultado.getString(2):"0";
						    		String meta = resultado.getString(3)!=null?resultado.getString(3):"0";
						    		System.out.println("mes: "+mes+" resultado: "+ result+" meta: "+meta);
						    		if(mes!=null && mes!=""){
						    			if(mes.equalsIgnoreCase("Enero")){
						    				indInte.setResEne(result);
						    				indInte.setMetaEne(meta);
						    			}else if(mes.equalsIgnoreCase("Febrero")){
						    				indInte.setResFeb(result);
						    				indInte.setMetaFeb(meta);
						    			}else if(mes.equalsIgnoreCase("Marzo")){
						    				indInte.setResMar(result);
						    				indInte.setMetaMar(meta);
						    			}else if(mes.equalsIgnoreCase("Abril")){
						    				indInte.setResAbr(result);
						    				indInte.setMetaAbr(meta);
						    			}else if(mes.equalsIgnoreCase("Mayo")){
						    				indInte.setResMay(result);
						    				indInte.setMetaMay(meta);
						    			}else if(mes.equalsIgnoreCase("Junio")){
						    				indInte.setResJun(result);
						    				indInte.setMetaJun(meta);
						    			}else if(mes.equalsIgnoreCase("Julio")){
						    				indInte.setResJul(result);
						    				indInte.setMetaJul(meta);
						    			}else if(mes.equalsIgnoreCase("Agosto")){
						    				indInte.setResAgo(result);
						    				indInte.setMetaAgo(meta);
						    			}else if(mes.equalsIgnoreCase("Septiembre")){
						    				indInte.setResSep(result);
						    				indInte.setMetaSep(meta);
						    			}else if(mes.equalsIgnoreCase("Octubre")){
						    				indInte.setResOct(result);
						    				indInte.setMetaOct(meta);
						    			}else if(mes.equalsIgnoreCase("Noviembre")){
						    				indInte.setResNov(result);
						    				indInte.setMetaNov(meta);
						    			}else if(mes.equalsIgnoreCase("Diciembre")){
						    				indInte.setResDic(result);
						    				indInte.setMetaDic(meta);
						    			}
						    		}
						    	}
						    }
					   }
		    	} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return arrIndInte;
		}
		
		 /**
		  * Actualiza los datos de un mes
		  * @param nombre
		  * @param mes
		  * @param anio
		  * @param data
		  * @return boolean
		  */
/**		 public static boolean updateMes(IndicadorInteligente ii){
			 boolean agregado=false;
			  try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query="";
			    if(ii.getUsuario().equals("")){
			    	query= "UPDATE IndInte SET "+ii.getMes()+"='"+ii.getVariableMes()+"' WHERE nombre='"+ii.getNombre()+"' AND anio='"+ii.getAnio()+"'";
			    }else if(!ii.getUsuario().equals("")){
			    	query= "UPDATE IndInte SET "+ii.getMes()+"='"+ii.getVariableMes()+"' WHERE nombre='"+ii.getNombre()+"' AND anio='"+ii.getAnio()+"' AND usuario='"+ii.getUsuario()+"'";
			    }
			   // System.out.println(query);
			    st.executeUpdate(query);
			    //con.commit();
			    //System.out.println("update: "+ query);
			    agregado=true;
			    st.close();
			   }
			   con.close();
			  } catch (SQLException e) {
			   agregado=false;
			   e.printStackTrace();
			  }
			  return agregado;
		}**/
	}