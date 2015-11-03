package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Indicador;


public class ClaseIndicador {
 
 public static boolean agregarIndicador(Indicador indicador){
  boolean agregado=false;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    String query= "INSERT INTO INDICADORES (color, desc_indicador, idArbol, idDepartamento, nb_indicador, nodos_Asociados, nu_nodo_Arbol, nu_nodo_Padre)VALUES ('"+indicador.getColor()+"','"+indicador.getDescIndicador()+"',"+indicador.getIdArbol()+","+indicador.getIdDepartamento()+",'"+indicador.getNbIndicador()+"','"+indicador.getNodosAsociados()+"',"+indicador.getNuNodoArbol()+","+indicador.getNuNodoPadre()+")";
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

 public static boolean eliminarIndicador(Indicador indicador){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    // DELETE FROM table_name WHERE some_column=some_value;
	    String query= "DELETE FROM INDICADORES WHERE idIndicador="+indicador.getIdIndicador();
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
 
 public static boolean update(Indicador ind){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE INDICADORES SET nb_indicador='"+ind.getNbIndicador()+"',color='"+ind.getColor()+"',desc_indicador='"+ind.getDescIndicador()+"',idDepartamento="+ind.getIdDepartamento()+",nodos_Asociados='"+ind.getNodosAsociados()+"',nu_nodo_Padre="+ind.getNuNodoPadre()+" WHERE idIndicador="+ind.getIdIndicador();
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
 
 public static ArrayList<String> consultarIndDos(){
	 ResultSet resultado = null;
	 ArrayList<String> arrInd=null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nb_indicador FROM indicadores";
		System.out.println(query);
		    resultado = st.executeQuery(query);
		    arrInd= new ArrayList<String>();
		    while(resultado.next()){
		    	
		    	String nombre = resultado.getString(1)!=null?resultado.getString(1):"";
		    	arrInd.add(nombre);
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return arrInd;
}
 
 public static ArrayList<Indicador> consultarIndicadores(int idArbol){
	 ResultSet resultado = null;
	 ArrayList<Indicador> arrInd=null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nu_nodo_Arbol, nu_nodo_Padre, nb_indicador, desc_indicador, nodos_Asociados, color, idDepartamento, idIndicador FROM indicadores WHERE idArbol="+idArbol+" ORDER by nu_nodo_Arbol";
		   System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
		    	arrInd= new ArrayList<Indicador>();
				while(resultado.next()){
					Indicador ind = new Indicador();
					int nodoArbol = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"");
					ind.setNuNodoArbol(nodoArbol);
					int nodoPadre = Integer.parseInt(resultado.getString(2)!=null?resultado.getString(2):"");
					ind.setNuNodoPadre(nodoPadre);
					ind.setNbIndicador(resultado.getString(3)!=null?resultado.getString(3):"");
					ind.setDescIndicador(resultado.getString(4)!=null?resultado.getString(4):"");
					ind.setNodosAsociados(resultado.getString(5)!=null?resultado.getString(5):"");
					ind.setColor(resultado.getString(6)!=null?resultado.getString(6):"");
					int idDepto = Integer.parseInt(resultado.getString(7)!=null?resultado.getString(7):"");
					ind.setIdDepartamento(idDepto);
					int idInd = Integer.parseInt(resultado.getString(8)!=null?resultado.getString(8):"");
					ind.setIdIndicador(idInd);
					arrInd.add(ind);
				}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	 return arrInd;
 }
 
 public static ArrayList<Indicador> consultarIndicadorXid(int idIndicador){
	 ResultSet resultado = null;
	 ArrayList<Indicador> arrInd=null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nu_nodo_Arbol, nu_nodo_Padre, nb_indicador, desc_indicador, nodos_Asociados, color, idDepartamento, idIndicador FROM indicadores WHERE idIndicador="+idIndicador;
		   System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
		    	arrInd= new ArrayList<Indicador>();
				while(resultado.next()){
					Indicador ind = new Indicador();
					int nodoArbol = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"");
					ind.setNuNodoArbol(nodoArbol);
					int nodoPadre = Integer.parseInt(resultado.getString(2)!=null?resultado.getString(2):"");
					ind.setNuNodoPadre(nodoPadre);
					ind.setNbIndicador(resultado.getString(3)!=null?resultado.getString(3):"");
					ind.setDescIndicador(resultado.getString(4)!=null?resultado.getString(4):"");
					ind.setNodosAsociados(resultado.getString(5)!=null?resultado.getString(5):"");
					ind.setColor(resultado.getString(6)!=null?resultado.getString(6):"");
					int idDepto = Integer.parseInt(resultado.getString(7)!=null?resultado.getString(7):"");
					ind.setIdDepartamento(idDepto);
					int idInd = Integer.parseInt(resultado.getString(8)!=null?resultado.getString(8):"");
					ind.setIdIndicador(idInd);
					arrInd.add(ind);
				}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	 return arrInd;
 }
 
 public static ArrayList<Indicador> consultarIndxDepto(int idArbol, int cvDepto){
	 ResultSet resultado = null;
	 ArrayList<Indicador> arrInd=null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nu_nodo_Arbol, nu_nodo_Padre, nb_indicador, desc_indicador, nodos_Asociados, color, idDepartamento, idIndicador FROM indicadores WHERE idArbol="+idArbol+" AND idDepartamento="+cvDepto+"  ORDER by nu_nodo_Arbol";
		   System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
		    	arrInd= new ArrayList<Indicador>();
				while(resultado.next()){
					Indicador ind = new Indicador();
					int nodoArbol = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"");
					ind.setNuNodoArbol(nodoArbol);
					int nodoPadre = Integer.parseInt(resultado.getString(2)!=null?resultado.getString(2):"");
					ind.setNuNodoPadre(nodoPadre);
					ind.setNbIndicador(resultado.getString(3)!=null?resultado.getString(3):"");
					ind.setDescIndicador(resultado.getString(4)!=null?resultado.getString(4):"");
					ind.setNodosAsociados(resultado.getString(5)!=null?resultado.getString(5):"");
					ind.setColor(resultado.getString(6)!=null?resultado.getString(6):"");
					int idDepto = Integer.parseInt(resultado.getString(7)!=null?resultado.getString(7):"");
					ind.setIdDepartamento(idDepto);
					int idInd = Integer.parseInt(resultado.getString(8)!=null?resultado.getString(8):"");
					ind.setIdIndicador(idInd);
					arrInd.add(ind);
				}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	 return arrInd;
 }
 
 public static String consultarArbol(int idArbol){
	 ResultSet resultado = null;
	 String arbol="";
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    /**id: id_arr,
			parent: parent_arr,
			title: title_arr,
			description: description_arr,
			asociados: asociados_arr,
			itemTitleColor: color_arr,**/
		    String query= "SELECT nu_nodo_Arbol, nu_nodo_Padre, nb_indicador, desc_indicador, nodos_Asociados, color, (Select nb_Departamento from departamentos where id_Departamento = idDepartamento) FROM indicadores WHERE idArbol="+idArbol+" ORDER by nu_nodo_Arbol";
		    System.out.println(query);//							1				2			3				4				5			6			7
		    int primero=0;
		    //System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				while(resultado.next()){
					String nuNodoArbol=resultado.getString(1)!=null?resultado.getString(1):"";
					String nuNodoPadre=resultado.getString(2)!=null?resultado.getString(2):"";
					String nbIndicador=resultado.getString(3)!=null?resultado.getString(3):"";
					String descIndicad=resultado.getString(4)!=null?resultado.getString(4):"";
					String nodosAsocia=resultado.getString(5)!=null?resultado.getString(5):"";
					String color=resultado.getString(6)!=null?resultado.getString(6):"";
					String idDepartame=resultado.getString(7)!=null?resultado.getString(7):"";
					if(primero==0){
						if(nuNodoPadre.equals("0")){
							nuNodoPadre="";
						}
						arbol = nuNodoArbol+"|"+nuNodoPadre+"|"+nbIndicador+"|"+descIndicad+"|"+nodosAsocia+"|"+idDepartame+"|"+color;
						primero=primero+1;
					}else{
						arbol=arbol+"|"+nuNodoArbol+"|"+nuNodoPadre+"|"+nbIndicador+"|"+descIndicad+"|"+nodosAsocia+"|"+idDepartame+"|"+color;
						primero=primero+1;
					}
				}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return arbol;
}
 
 public static String consultarArbolXDepto(int idArbol, int idDepto){
	 ResultSet resultado = null;
	 String arbol="";
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    
		    String query= "SELECT nu_nodo_Arbol, nu_nodo_Padre, nb_indicador, desc_indicador, nodos_Asociados, color, (Select nb_Departamento from departamentos where id_Departamento = idDepartamento) FROM indicadores WHERE idArbol="+idArbol+" AND idDepartamento="+idDepto+" ORDER by nu_nodo_Arbol";
		   System.out.println(query); //							1				2			3				4				5			6			7
		    int primero=0;
		    //System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				while(resultado.next()){
					String nuNodoArbol=resultado.getString(1)!=null?resultado.getString(1):"";
					String nuNodoPadre=resultado.getString(2)!=null?resultado.getString(2):"";
					String nbIndicador=resultado.getString(3)!=null?resultado.getString(3):"";
					String descIndicad=resultado.getString(4)!=null?resultado.getString(4):"";
					String nodosAsocia=resultado.getString(5)!=null?resultado.getString(5):"";
					String color=resultado.getString(6)!=null?resultado.getString(6):"";
					String idDepartame=resultado.getString(7)!=null?resultado.getString(7):"";
					if(primero==0){
						if(nuNodoPadre.equals("0")){
							nuNodoPadre="";
						}
						arbol = nuNodoArbol+"|"+nuNodoPadre+"|"+nbIndicador+"|"+descIndicad+"|"+nodosAsocia+"|"+idDepartame+"|"+color;
						primero=primero+1;
					}else{
						arbol=arbol+"|"+nuNodoArbol+"|"+nuNodoPadre+"|"+nbIndicador+"|"+descIndicad+"|"+nodosAsocia+"|"+idDepartame+"|"+color;
						primero=primero+1;
					}
				}
		    }
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	 return arbol;
 }

 public static ArrayList<Indicador> consultarIndxPuesto(int idPuesto, int idArbol){
	 ResultSet resultado = null;
	 ArrayList<Indicador> arrInd=null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT ind_Crtl_asoc, ind_Estrat_asoc FROM puestos WHERE idPuesto = "+idPuesto;
		   System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				while(resultado.next()){
					String indCtrlAso = resultado.getString(1)!=null?resultado.getString(1):"";
					String indEstrAso = resultado.getString(2)!=null?resultado.getString(2):"";
					arrInd = new ArrayList<Indicador>();
					if(indCtrlAso!=null && !indCtrlAso.equals("")){
						String[] arrIndCtrl = indCtrlAso.split("\\,");
						int tamArrIndCtrl = arrIndCtrl.length;
						if(tamArrIndCtrl>0){
							for(int i=0; i<tamArrIndCtrl; i++){
								Indicador ind = consultaIndxID(arrIndCtrl[i], idArbol);
								arrInd.add(ind);
							}
						}
					}
					if(indEstrAso!= null && indEstrAso!=""){
						// Por el momento nada
					}
				}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	 return arrInd;
 }

private static Indicador consultaIndxID(String idInd , int idArbol) {
	Indicador ind = null;
	ResultSet resultado = null;
	if(idInd!=null && !idInd.equals("")){
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT idIndicador, nb_indicador, desc_indicador FROM Indicadores WHERE nu_nodo_Arbol = "+idInd+" AND idArbol="+idArbol;
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(resultado.next()){
				    	ind = new Indicador();
				    	String cvInd = resultado.getString(1)!=null?resultado.getString(1):"";
						String nbInd = resultado.getString(2)!=null?resultado.getString(2):"";
						String descInd = resultado.getString(3)!=null?resultado.getString(3):"";
						int idIndicador = Integer.parseInt(cvInd);
						ind.setIdIndicador(idIndicador);
						ind.setNbIndicador(nbInd);
						ind.setDescIndicador(descInd);
				    }
				    st.close();
			   }
			   c.cerrarConexion();
		}catch (SQLException e) {
		   e.printStackTrace();
		}
	}
	return ind;
}

public static String cuentaIndxArbol(int idArbol){
	String cuantos="";
	ResultSet resultado = null;
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT COUNT(idIndicador) FROM Indicadores WHERE idArbol="+idArbol;
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(resultado.next()){
				    	cuantos = resultado.getString(1)!=null?resultado.getString(1):"";
				    }
				    st.close();
			   }
			   c.cerrarConexion();
		}catch (SQLException e) {
		   e.printStackTrace();
		}
	return cuantos;
}
 
public static String cuentaIndxArbol(int idArbol, int idDepto){
	String cuantos="";
	ResultSet resultado = null;
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT COUNT(idIndicador) FROM Indicadores WHERE idArbol="+idArbol+" AND idDepartamento="+idDepto;
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(resultado.next()){
				    	cuantos = resultado.getString(1)!=null?resultado.getString(1):"";
				    }
				    st.close();
			   }
			   c.cerrarConexion();
		}catch (SQLException e) {
		   e.printStackTrace();
		}
	return cuantos;
}

public static int consultaIndXnomb(String nbInd){
	int idIndicador=0;
	ResultSet resultado = null;
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT idIndicador FROM Indicadores WHERE nb_indicador='"+nbInd+"'";
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(resultado.next()){
				    	idIndicador = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
				    }
				    st.close();
			   }
			   c.cerrarConexion();
		}catch (SQLException e) {
		   e.printStackTrace();
		}
	return idIndicador;
}

}