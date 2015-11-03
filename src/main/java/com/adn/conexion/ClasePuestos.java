package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Puesto;


public class ClasePuestos {
 
 public static boolean agregarPuesto(Puesto nuevoPuesto){
  boolean agregado=false;
  try {
   ConexionBase c=new ConexionBase();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    String query= "INSERT INTO Puestos (color, creado_por, desc_puesto, fh_creacion, idArea,idDepartamento,idDiagrama, ind_Crtl_asoc, ind_Estrat_asoc, nb_Puesto, nu_nodo_arbol, nu_nodo_padre) VALUES ('"+nuevoPuesto.getColor()+"','"+nuevoPuesto.getCreadoPor()+"','"+nuevoPuesto.getDescPuesto()+"','"+nuevoPuesto.getFhCreacion()+"',"+nuevoPuesto.getIdArea()+","+nuevoPuesto.getIdDepartamento()+","+nuevoPuesto.getIdDiagrama()+",'"+nuevoPuesto.getIndCtrlAsoc()+"','"+nuevoPuesto.getIndEstratAsoc()+"','"+nuevoPuesto.getNbPuesto()+"','"+nuevoPuesto.getNuNodoArbol()+"','"+nuevoPuesto.getNuNodoPadre()+"')";
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
 
 public static boolean update(Puesto puesto){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    String query= "UPDATE Puestos SET nb_Puesto='"+puesto.getNbPuesto()+"', color='"+puesto.getColor()+"', desc_puesto='"+puesto.getDescPuesto()+"', ind_Crtl_asoc='"+puesto.getIndCtrlAsoc()+"', idDepartamento='"+puesto.getIdDepartamento()+"', nu_nodo_padre="+puesto.getNuNodoPadre()+" WHERE idPuesto="+puesto.getIdPuesto();
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
 
 /**
  * 
  * @return
  */
 public static ArrayList<Puesto> consultar(){
	 ArrayList<Puesto> arrPuestos = new ArrayList<Puesto>();
		ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idArea, nb_Puesto FROM Puestos";
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next())
				{
			    	Puesto puesto = new Puesto();
			    	String areaStr = (resultado.getString(1)!=""?resultado.getString(1):"0");
			    	puesto.setIdArea(Integer.parseInt(areaStr));
			    	puesto.setNbPuesto((resultado.getString(2)!=""?resultado.getString(2):""));
			    	arrPuestos.add(puesto);
				}
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrPuestos;
 }
 
 public static ArrayList<Puesto> buscaPuestos(int idArea, int idDepto){
		 ResultSet resultado = null;
		 ArrayList<Puesto> arrPuesto = new ArrayList<Puesto>();
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT idPuesto, nb_Puesto, color, nu_nodo_arbol, nu_nodo_padre, desc_puesto, ind_Crtl_asoc FROM Puestos WHERE idArea="+idArea+" AND idDepartamento="+idDepto;
			   System.out.println(query); //						  1			2		3			4				5			6			7
			    resultado = st.executeQuery(query);
			    if(!resultado.equals("")){
					   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
					   while(resultado.next()){
								Puesto usr = new Puesto();
								int idPuesto = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
								usr.setIdPuesto(idPuesto);
								usr.setNbPuesto(resultado.getString(2)!=null?resultado.getString(2):"");	
								usr.setColor(resultado.getString(3)!=null?resultado.getString(3):"");
								int nuNodoArbol = Integer.parseInt(resultado.getString(4)!=null?resultado.getString(4):"");
								usr.setNuNodoArbol(nuNodoArbol);
								int nuNodoPadre = Integer.parseInt(resultado.getString(5)!=null?resultado.getString(5):"");
								usr.setNuNodoArbol(nuNodoPadre);
								usr.setDescPuesto(resultado.getString(6)!=null?resultado.getString(6):"");
								usr.setIndCtrlAsoc(resultado.getString(7)!=null?resultado.getString(7):"");
								arrPuesto.add(usr);	
						}
			    }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return arrPuesto;
	}
 
 public static ArrayList<Puesto> buscaPuestosXarea(int idArea){
	 ResultSet resultado = null;
	 ArrayList<Puesto> arrPuesto = new ArrayList<Puesto>();
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT idPuesto, nb_Puesto FROM Puestos WHERE idArea="+idArea;
		    System.out.println(query);//						  1			2	
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				   try {
						while(resultado.next()){
							Puesto usr = new Puesto();
							int idPuesto = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
							usr.setIdPuesto(idPuesto);
							usr.setNbPuesto(resultado.getString(2)!=null?resultado.getString(2):"");						
							arrPuesto.add(usr);	
						   }
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return arrPuesto;
}
 
 public static boolean eliminarPuesto(Puesto puesto){
	  boolean agregado=false;
	  try {
	   ConexionBase c=new ConexionBase();
	   Connection con=c.getConexion();
	   if(con!=null){
	    Statement st;
	    st = con.createStatement();
	    // DELETE FROM table_name WHERE some_column=some_value;
	    String query= "DELETE FROM PUESTOS WHERE idPuesto="+puesto.getIdPuesto();
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
 
 public static String buscaNbPuesto(int idPuesto){
	 ResultSet resultado = null;
	 String puesto = "";
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nb_Puesto FROM Puestos WHERE idPuesto="+idPuesto;
		    System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				   try {
						while(resultado.next()){
							puesto = resultado.getString(1)!=null?resultado.getString(1):"";
						}
					}catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return puesto;
}

public static String buscaIdPuesto(String nbPuesto){
	 ResultSet resultado = null;
	 String idPuesto = "";
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT idPuesto FROM Puestos WHERE nb_Puesto='"+nbPuesto+"'";
		    System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				   try {
						while(resultado.next()){
							idPuesto = resultado.getString(1)!=null?resultado.getString(1):"";
						}
					}catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return idPuesto;
}
 
public static ArrayList<Puesto> buscaPuestosXArbol(int idArbol){
	 ResultSet resultado = null;
	 ArrayList<Puesto> arrPuesto = null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT color, desc_puesto, ind_Crtl_asoc, ind_Estrat_asoc, nu_nodo_arbol, nu_nodo_padre, nb_Puesto, idPuesto, idDepartamento FROM Puestos WHERE idDiagrama="+idArbol+" ORDER by nu_nodo_Arbol";
		    System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				   try {
					   arrPuesto = new ArrayList<Puesto>();
						while(resultado.next()){
							Puesto puesto = new Puesto();
							puesto.setColor(resultado.getString(1)!=null?resultado.getString(1):"");
							puesto.setDescPuesto(resultado.getString(2)!=null?resultado.getString(2):"");
							puesto.setIndCtrlAsoc(resultado.getString(3)!=null?resultado.getString(3):"");
							puesto.setIndEstratAsoc(resultado.getString(4)!=null?resultado.getString(4):"");
							int nuNodoArbol = Integer.parseInt(resultado.getString(5)!=null?resultado.getString(5):"");
							puesto.setNuNodoArbol(nuNodoArbol);
							int nuNodoPadre = Integer.parseInt(resultado.getString(6)!=null?resultado.getString(6):"");
							puesto.setNuNodoPadre(nuNodoPadre);
							puesto.setNbPuesto(resultado.getString(7)!=null?resultado.getString(7):"");
							int idPuesto = Integer.parseInt(resultado.getString(8)!=null?resultado.getString(8):"");
							puesto.setIdPuesto(idPuesto);
							int idDepartamento = Integer.parseInt(resultado.getString(9)!=null?resultado.getString(9):"");
							puesto.setIdDepartamento(idDepartamento);
							arrPuesto.add(puesto);
						}
					}catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return arrPuesto;
}

public static String cuentaPuestxArea(int idArea){
	String cuantos="";
	ResultSet resultado = null;
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT COUNT(idPuesto) FROM Puestos WHERE idArea="+idArea;
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

public static String cuentaPuestxArea(int idArea, int idDepto){
	String cuantos="";
	ResultSet resultado = null;
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT COUNT(idPuesto) FROM Puestos WHERE idArea="+idArea+" AND idDepartamento="+idDepto;
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

public static String cuentaIndxPuesto(int idPuesto){
	String cuantos="";
	String niCtrl="";
	String niEstr="";
	ResultSet resultado = null;
		try {
			ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
				   Statement st;
				    st = con.createStatement();
				    String query= "SELECT ind_Crtl_asoc, ind_Estrat_asoc FROM Puestos WHERE idPuesto="+idPuesto;
				    System.out.println(query);
				    resultado = st.executeQuery(query);
				    if(resultado.next()){
				    	niCtrl = resultado.getString(1)!=null?resultado.getString(1):"";
				    	niEstr = resultado.getString(2)!=null?resultado.getString(2):"";
				    	String[] arrNICtrl = niCtrl.split("\\,");
				    	String[] arrNIEstr = niEstr.split("\\,");
				    	int tam = arrNICtrl.length + arrNIEstr.length;
				    	cuantos = tam +"";
				    }
				    st.close();
			   }
			   c.cerrarConexion();
		}catch (SQLException e) {
		   e.printStackTrace();
		}
	return cuantos;
}

public static Puesto buscaPuestoXid(String cvePuesto){
	 ResultSet resultado = null;
	 Puesto puesto = null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT color, desc_puesto, ind_Crtl_asoc, ind_Estrat_asoc, nu_nodo_arbol, nu_nodo_padre, nb_Puesto, idPuesto, idArea, idDepartamento FROM Puestos WHERE nb_Puesto='"+cvePuesto+"'";
		    System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
				   try {
						while(resultado.next()){
							puesto = new Puesto();
							puesto.setColor(resultado.getString(1)!=null?resultado.getString(1):"");
							puesto.setDescPuesto(resultado.getString(2)!=null?resultado.getString(2):"");
							puesto.setIndCtrlAsoc(resultado.getString(3)!=null?resultado.getString(3):"");
							puesto.setIndEstratAsoc(resultado.getString(4)!=null?resultado.getString(4):"");
							int nuNodoArbol = Integer.parseInt(resultado.getString(5)!=null?resultado.getString(5):"-1");
							puesto.setNuNodoArbol(nuNodoArbol);
							int nuNodoPadre = Integer.parseInt(resultado.getString(6)!=null?resultado.getString(6):"-1");
							puesto.setNuNodoPadre(nuNodoPadre);
							puesto.setNbPuesto(resultado.getString(7)!=null?resultado.getString(7):"");
							int idPuesto = Integer.parseInt(resultado.getString(8)!=null?resultado.getString(8):"");
							int idArea = Integer.parseInt(resultado.getString(9)!=null?resultado.getString(9):"-1");
							int idDepartamento = Integer.parseInt(resultado.getString(10)!=null?resultado.getString(10):"-1");
							puesto.setIdPuesto(idPuesto);
							puesto.setIdArea(idArea);
							puesto.setIdDepartamento(idDepartamento);
						}
					}catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
		   
		   st.close();
		   }
		   c.cerrarConexion();
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }
	return puesto;
}

}