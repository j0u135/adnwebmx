package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Departamento;
import com.adn.controlador.Diagrama;
import com.adn.controlador.Puesto;

public class ClaseDiagrama {
	
	public ResultSet consultar(){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT diagrama FROM diagrama WHERE nombre='diagramaEmpresa'";
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
	

public static int agregarDiagrama(Diagrama nuevoDiagrama){
 int idDiagrama=0;
 ResultSet resultado = null;
 try {
  ConexionBase c=new ConexionBase();
  Connection con=c.getConexion();
  if(con!=null){
   Statement st;
   st = con.createStatement();
   
   
   String query= "INSERT INTO diagrama (idDepartamento, idArea,creado_por,fh_creacion) VALUES ("+nuevoDiagrama.getIdDeparatamento()+","+nuevoDiagrama.getIdArea()+",'"+nuevoDiagrama.getCreadoPor()+"','"+nuevoDiagrama.getFhCreacion()+"')";
   st.executeUpdate(query);
   String query1= "SELECT idDiagrama FROM diagrama WHERE idArea="+nuevoDiagrama.getIdArea()+" AND idDepartamento="+nuevoDiagrama.getIdDeparatamento();
	System.out.println(query1System.out.println(query););
	resultado = st.executeQuery(query1);
	while(resultado.next()){
		String clave = resultado.getString(1);
		if(clave!=null && !clave.equals("")){
			idDiagrama = Integer.parseInt(clave);
		}
	}
   st.close();
  }
  c.cerrarConexion();
 } catch (SQLException e) {
  e.printStackTrace();
 }
 return idDiagrama;
}


public static int verificaRepetido(int idArea){
	 String claveReal="";
	 int idArbol=0;
	 	try {
	 		ConexionBase c=new ConexionBase();
	 		Connection con=c.getConexion();
	 		if(con!=null){
	 			Statement st;
	 			st = con.createStatement();
	 			String query=  "SELECT idDiagrama FROM diagrama WHERE idArea="+idArea;
System.out.println(query);
	 			ResultSet rs=st.executeQuery(query);
				while(rs.next()){
 					claveReal=rs.getString(1);
 				}
	 			st.close();
	 		}
	 		c.cerrarConexion();
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  
	  if(claveReal!=null && !claveReal.equals("")){
		  idArbol = Integer.parseInt(claveReal);
		}
	  return idArbol;
}

public static String consultaArbol(int idArea){
	String arbol="";
	if(idArea >0){
		int idArbol = verificaRepetido(idArea);
		if(idArbol>0){
			ArrayList<Puesto> arrPuestos = ClasePuestos.buscaPuestosXArbol(idArbol);
			if(arrPuestos!=null){
				for(int i=0; i<arrPuestos.size(); i++){
					Puesto puesto = arrPuestos.get(i);
					String padre="";
					int idDepto = puesto.getIdDepartamento();
					Departamento depto = ClaseDepartamento.buscaDepoXid(idDepto);
					if(i==0 && puesto.getNuNodoPadre()==0){
						padre="";
					}else{
						padre=puesto.getNuNodoPadre()+"";
					}
					if(i==0){
						arbol=puesto.getNuNodoArbol()+"|"+padre+"|"+puesto.getNbPuesto()+"|"+puesto.getDescPuesto()+"|"+puesto.getIndCtrlAsoc()+"|"+depto.getNbDepto()+"|"+puesto.getColor();
					}else{
						arbol=arbol+"|"+puesto.getNuNodoArbol()+"|"+padre+"|"+puesto.getNbPuesto()+"|"+puesto.getDescPuesto()+"|"+puesto.getIndCtrlAsoc()+"|"+depto.getNbDepto()+"|"+puesto.getColor();
					}
				}
			}
		}
	}
	System.out.println(arbol);
	return arbol;
}

public static String consultaArbolXdepto(int idArea, int idDepto){
	String arbol="";
	if(idArea >0){
		int idArbol = verificaRepetido(idArea);
		if(idArbol>0){
			ArrayList<Puesto> arrPuestos = ClasePuestos.buscaPuestos(idArea, idDepto);
			if(arrPuestos!=null){
				for(int i=0; i<arrPuestos.size(); i++){
					Puesto puesto = arrPuestos.get(i);
					String padre="";
					Departamento depto = ClaseDepartamento.buscaDepoXid(idDepto);
					if(i==0 && puesto.getNuNodoPadre()==0){
						padre="";
					}else{
						padre=puesto.getNuNodoPadre()+"";
					}
					if(i==0){
						arbol=puesto.getNuNodoArbol()+"|"+padre+"|"+puesto.getNbPuesto()+"|"+puesto.getDescPuesto()+"|"+puesto.getIndCtrlAsoc()+"|"+depto.getNbDepto()+"|"+puesto.getColor();
					}else{
						arbol=arbol+"|"+puesto.getNuNodoArbol()+"|"+padre+"|"+puesto.getNbPuesto()+"|"+puesto.getDescPuesto()+"|"+puesto.getIndCtrlAsoc()+"|"+depto.getNbDepto()+"|"+puesto.getColor();
					}
				}
			}
		}
	}
	System.out.println(arbol);
	return arbol;
}

public static String consultaArbolXarea(int idArea){
	String arbol="";
	if(idArea > 0){
		ArrayList<Departamento> arrDepto = ClaseDepartamento.buscaDepartamento(idArea);
		if(arrDepto!=null){
			arbol = consultaArbol(idArea);
		}
	}
	return arbol;
}


}
