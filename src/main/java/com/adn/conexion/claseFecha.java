package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adn.controlador.CalendarioAprobacion;

public class claseFecha {
	
	public ResultSet consultaFecha2(String mes, String mes2){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT "+mes+","+mes2+" from fechasAprobaciones";
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
	
	public CalendarioAprobacion consultaFechaT(String anio){
		 ResultSet resultado = null;
		 CalendarioAprobacion calApro = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT enei,febi,mari,abri,mayi,juni,juli,agoi,sepi,octi,novi,dici,enef,febf,marf,abrf,mayf,junf,julf,agof,sepf,octf,novf,dicf from fechasAprobaciones where anio like'"+anio+"'";
			    System.out.println("busca calendario "+query);
			    resultado = st.executeQuery(query);
			    if(resultado != null){
			    	while(resultado.next()){
			    		calApro = new CalendarioAprobacion();
			    		//Fechas iniciales
			    		calApro.setEnei(resultado.getString(1));
			    		calApro.setFebi(resultado.getString(2));
			    		calApro.setMari(resultado.getString(3));
			    		calApro.setAbri(resultado.getString(4));
			    		calApro.setMayi(resultado.getString(5));
			    		calApro.setJuni(resultado.getString(6));
			    		calApro.setJuli(resultado.getString(7));
			    		calApro.setAgoi(resultado.getString(8));
			    		calApro.setSepi(resultado.getString(9));
			    		calApro.setOcti(resultado.getString(10));
			    		calApro.setNovi(resultado.getString(11));
			    		calApro.setDici(resultado.getString(12));
						//Fechas Finales
			    		calApro.setEnef(resultado.getString(13));
			    		calApro.setFebf(resultado.getString(14));
			    		calApro.setMarf(resultado.getString(15));
			    		calApro.setAbrf(resultado.getString(16));
			    		calApro.setMayf(resultado.getString(17));
			    		calApro.setJunf(resultado.getString(18));
			    		calApro.setJulf(resultado.getString(19));
			    		calApro.setAgof(resultado.getString(20));
			    		calApro.setSepf(resultado.getString(21));
			    		calApro.setOctf(resultado.getString(22));
			    		calApro.setNovf(resultado.getString(23));
			    		calApro.setDicf(resultado.getString(24));
			    	}
			    }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return calApro;
	}
	
	public String consultaFecha(String mes){
		 ResultSet resultado = null;
		 String fechaFin=null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT "+mes+" from fechasAprobaciones";
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    while(resultado.next()){
			    	fechaFin=resultado.getString(1);
			    }
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
		return fechaFin;
	}

}
