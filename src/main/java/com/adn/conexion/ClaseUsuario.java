package com.adn.conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.controlador.Usuario;


public class ClaseUsuario {
	
	public ResultSet consultar(String user){
		 ResultSet resultado = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT CLAVE FROM USUARIOS WHERE usuarios.USER='"+user+"'";
			   // 
			    //st.executeQuery(query);
			    System.out.println(query);
			    resultado = st.executeQuery(query);
			    
			   st.close();
			   }
			   c.cerrarConexion();
			  } catch (SQLException e) {
			   e.printStackTrace();
			  }
			  return resultado;
	}
	
	public static Usuario buscaUsuario(String user){
		 ResultSet resultado = null;
		 Usuario usr = null;
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "SELECT u.clave,u.nombre,u.correo,(Select nb_Puesto FROM Puestos WHERE idPuesto=u.puesto::int),u.area,u.jefedirecto,tp.nombre, u.personalCargo, u.visitas, u.autorizador FROM USUARIOS u, ROLES tp WHERE u.USER='"+user+"' AND tp.idrol = u.tipousuario::int AND u.activo = 'true'";			    System.out.println(query);//						1		2	  		3		4	   5		6			7			8				9			10
			    resultado = st.executeQuery(query);
			    if(!resultado.equals("")){
					   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
					   try {
							while(resultado.next()){
								usr = new Usuario();
								usr.setUsername(user);
								usr.setPassword(resultado.getString(1)!=null?resultado.getString(1):"");
								usr.setNombre(resultado.getString(2)!=null?resultado.getString(2):"");
								usr.setCorreo(resultado.getString(3)!=null?resultado.getString(3):"");
								usr.setPuesto(resultado.getString(4)!=null?resultado.getString(4):"");
								usr.setArea(resultado.getString(5)!=null?resultado.getString(5):"");
								usr.setTipoUsuario(resultado.getString(7)!=null?resultado.getString(7):"");
								usr.setJefeDirecto(resultado.getString(6)!=null?resultado.getString(6):"");
								usr.setPersonalCargo(resultado.getString(8)!=null?resultado.getString(8):"");
								usr.setVisitas(resultado.getString(9)!=null?resultado.getString(9):"");
								usr.setAutorizador(resultado.getString(10)!=null?resultado.getString(10):"");
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
		return usr;
	}
	
	public static boolean verifica(Usuario verificaUser){
		  boolean correcto=false;
		  String claveReal="";
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query=  "SELECT CLAVE FROM USUARIOS WHERE usuarios.USER='"+verificaUser.getUsername()+"'";
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
		   correcto=false;
		   e.printStackTrace();
		  }
		  
		  if(claveReal.equals(verificaUser.getPassword())){
				correcto=true;
			}
		  return correcto;
	}
	
	public static boolean agregarUsuario(Usuario nuevoUsuario){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "INSERT INTO USUARIOS (area,clave, correo, dashboard, jefeDirecto, nombre, personalcargo, puesto, tipousuario, user, autorizador)VALUES ('"+nuevoUsuario.getArea()+"','"+nuevoUsuario.getPassword()+"','"+nuevoUsuario.getCorreo()+"','"+nuevoUsuario.getDashboard()+"','"+nuevoUsuario.getJefeDirecto()+"','"+nuevoUsuario.getNombre()+"','"+nuevoUsuario.getPersonalCargo()+"','"+nuevoUsuario.getPuesto()+"','"+nuevoUsuario.getTipoUsuario()+"','"+nuevoUsuario.getUsername()+"','"+nuevoUsuario.getAutorizador()+"')";
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
	 * @param nuevoUsuario
	 * @return
	 */
	public static boolean actualizarUsuario(Usuario usuarioModif){
		  boolean agregado=false;
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "UPDATE USUARIOS SET nombre ='"+usuarioModif.getNombre()+"', correo='"+usuarioModif.getCorreo()+"', personalCargo='"+ usuarioModif.getPersonalCargo()+"', autorizador='"+ usuarioModif.getAutorizador()+"', puesto='"+ usuarioModif.getPuesto()+"', area='"+ usuarioModif.getArea()+"',tipoUsuario='"+usuarioModif.getTipoUsuario()+"',jefeDirecto='"+usuarioModif.getJefeDirecto() +"'  WHERE usuarios.user = '"+usuarioModif.getUsername()+"'";
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
	
	public static boolean verificaRepetido(Usuario verificaRepetido){
		 boolean correcto=false;
		  String claveReal="";
		  try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query=  "SELECT correo FROM USUARIOS WHERE usuarios.USER='"+verificaRepetido.getUsername()+"'";
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
		  
		  if(claveReal.equals(verificaRepetido.getCorreo())){
				correcto=true;
			}
		  return correcto;
	}

/**
 * Consulta usuario y nombre
 * @return
 */
public static ArrayList<Object> consultarUsuarioNom(){
	 ArrayList<Object> usuariosArr = new ArrayList<Object>();
	 String usuario = "";
	 ResultSet resultado = null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nombre, usuarios.user FROM USUARIOS";
		    					// 1       2
		  System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   try {
					   	while(resultado.next()){
					   		//Nombre|user
							usuario =resultado.getString(1) + "|" + resultado.getString(2);
							usuariosArr.add(usuario);
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
		  return usuariosArr;
}

/**
 * Cambia el estado del usuario a false
 * @param usr
 * @return
 */
public static boolean eliminaUsuario(String usr){
	boolean actualizado = false;
	 if(usr!= null){
		 try {
			   ConexionBase c=new ConexionBase();
			   Connection con=c.getConexion();
			   if(con!=null){
			    Statement st;
			    st = con.createStatement();
			    String query= "UPDATE USUARIOS SET activo ='False' WHERE usuarios.user = '"+usr+"'";
			    System.out.println(query);
			    st.executeUpdate(query);
			    
			    actualizado = true;
			    st.close();
			   }
			   con.close();
			  } catch (SQLException e) {
				actualizado = false;
			   e.printStackTrace();
			  }
	 }
	return actualizado;
}

/**
 * Actualiza la clave del usuario
 * @return
 */
public static boolean actualizaPss(Usuario usr){
	 boolean actualizado = false;
	 String usuario = "";
	 String pssw ="";
	 if(usr!= null){
		 usuario = usr.getUsername();
		 pssw = usr.getPassword();
		 if(usuario!=null && usuario!="" && pssw!= null && pssw!=""){
			 try {
				   ConexionBase c=new ConexionBase();
				   Connection con=c.getConexion();
				   if(con!=null){
				    Statement st;
				    st = con.createStatement();
				    String query= "UPDATE USUARIOS SET clave ='"+pssw+"' WHERE usuarios.user = '"+usuario+"'";
				    System.out.println(query);
				    st.executeUpdate(query);
				    
				    actualizado = true;
				    st.close();
				   }
				   con.close();
				  } catch (SQLException e) {
					actualizado = false;
				   e.printStackTrace();
				  }
		 	}
	 }
	 return actualizado;
}

/**
 * 
 * @param usr
 * @return
 */
public static boolean incrementaVisita(Usuario usr){
	 boolean actualizado = false;
	 String usuario = "";
	 String visitas = "";
	 if(usr!= null){
		 usuario = usr.getUsername();
		 visitas = usr.getVisitas();
		 if(usuario!=null && usuario!=""){
			 if(visitas==null || visitas.equals("")){
				 visitas = "1";
			 }else{
				 int vis = Integer.parseInt(visitas) + 1;
				 visitas = vis+"";
				 System.out.println("Num visitas: "+visitas);
			 } 
			 try {
				   ConexionBase c=new ConexionBase();
				   Connection con=c.getConexion();
				   if(con!=null){
				    Statement st;
				    st = con.createStatement();
				    String query= "UPDATE USUARIOS SET visitas ='"+visitas+"' WHERE usuarios.user = '"+usuario+"'";
				    System.out.println(query);
				    st.executeUpdate(query);
				    
				    actualizado = true;
				    st.close();
				   }
				   con.close();
				  } catch (SQLException e) {
					actualizado = false;
				   e.printStackTrace();
				  }
		 	}
	 }
	 return actualizado;
}

/**
 * Consulta usuario y nombre
 * @return
 */
public static String consultaJefeDirecto(String usuario){
	 String correo = "";
	 ResultSet resultado = null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT correo FROM usuarios WHERE idUsuario = (SELECT JefeDirecto FROM usuarios WHERE usuarios.user = '"+usuario+"')";
		  System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
				   try {
					   	while(resultado.next()){
					   		//Nombre|user
					   		correo =resultado.getString(1);
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
		  return correo;
}

/**
 * Consulta usuario y nombre
 * @return
 */
public static ArrayList<Usuario> consultaJefes(){
	 ResultSet resultado = null;
	 ArrayList<Usuario> arrUsu = null;
	 try {
		   ConexionBase c=new ConexionBase();
		   Connection con=c.getConexion();
		   if(con!=null){
		    Statement st;
		    st = con.createStatement();
		    String query= "SELECT nombre, correo, idUsuario FROM usuarios WHERE PersonalCargo = 'SI'";
		    System.out.println(query);
		    resultado = st.executeQuery(query);
		    if(!resultado.equals("")){
		    	arrUsu = new ArrayList<Usuario>();
				   try {
					   	while(resultado.next()){
					   		Usuario usu = new Usuario();
					   		usu.setNombre(resultado.getString(1));
					   		usu.setCorreo(resultado.getString(2));
					   		String idUs = resultado.getString(3);
					   		if(idUs!=null && !idUs.equals("")){
					   			int idUsuario = Integer.parseInt(idUs);
					   			usu.setIdUsuario(idUsuario);
					   		}
					   		arrUsu.add(usu);
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
		  return arrUsu;
}

}

