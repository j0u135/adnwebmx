package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Empresa;


public class ClaseEmpresa {
	
	public static ArrayList<Empresa> buscaEmpresa(int idEmpresa){
		 ResultSet resultado = null;
		 ArrayList<Empresa> arrEmpresa = new ArrayList<Empresa>();
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT nb_Empresa,desc_Empresa,num_Licencias_Adquiridas, num_Licencias_enUso, fh_vigencia_inicio, fh_vigencia_fin, dias_vigencia, version_ADN, calendario_aprobaciones,sistema_alertas,sistema_penalizacion FROM EMPRESAS WHERE id_Empresa="+idEmpresa;
			    System.out.println(query);System.out.println(query);//						  1			2	  			3						4	  				 5						6				7			8				9						10				11
			    resultado = st.executeQuery(query);
			    if(!resultado.equals("")){
					   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
					   try {
							while(resultado.next()){
								Empresa usr = new Empresa();
								usr.setIdEmpresa(idEmpresa);
								usr.setNbEmpresa(resultado.getString(1)!=null?resultado.getString(1):"");
								usr.setDescEmpresa(resultado.getString(2)!=null?resultado.getString(2):"");
								int numLicAd = Integer.parseInt(resultado.getString(3)!=null?resultado.getString(3):"0");
								usr.setNumLicAdq(numLicAd);
								int numLicUso = Integer.parseInt(resultado.getString(4)!=null?resultado.getString(4):"0");
								usr.setNumLicEnUso(numLicUso);
								usr.setFhVigInicio(resultado.getString(5)!=null?resultado.getString(5):"");
								usr.setFhVigFin(resultado.getString(6)!=null?resultado.getString(6):"");
								usr.setDiasVigencia(resultado.getString(7)!=null?resultado.getString(7):"");
								usr.setVersionADN(resultado.getString(8)!=null?resultado.getString(8):"");
								usr.setCalendAproba(resultado.getString(9)!=null?resultado.getString(9):"");
								usr.setSistAlertas(resultado.getString(10)!=null?resultado.getString(10):"");
								usr.setSistPenalizacion(resultado.getString(11)!=null?resultado.getString(11):"");
								arrEmpresa.add(usr);	
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
		return arrEmpresa;
	}

	public static ArrayList<Empresa> buscaEmpresas(){
		 ResultSet resultado = null;
		 ArrayList<Empresa> arrEmpresa = new ArrayList<Empresa>();
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT id_Empresa, nb_Empresa FROM EMPRESAS";
			    System.out.println(query);//						  1			2	  			
			    resultado = st.executeQuery(query);
			    if(!resultado.equals("")){
					   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
					   try {
							while(resultado.next()){
								Empresa usr = new Empresa();
								int idEmpresa = Integer.parseInt(resultado.getString(1)!=null?resultado.getString(1):"0");
								usr.setIdEmpresa(idEmpresa);
								usr.setNbEmpresa(resultado.getString(1)!=null?resultado.getString(1):"");
								arrEmpresa.add(usr);	
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
		return arrEmpresa;
	}
}

