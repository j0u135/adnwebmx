package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IUsuarioDAO;

public class UserDAOSQLite implements IUsuarioDAO {

	private static final int ADMINISTRADOR_ADN = 1;
	private static final int ADMINISTRADOR = 2;
	
	private static final String SELECTION = "SELECT idUsuario, Nombre, u.User, (SELECT nb_Puesto FROM Puestos WHERE nullif(u.Puesto, '')::int = idPuesto), Puesto, TipoUsuario, (SELECT r.Nombre FROM Roles r WHERE TipoUsuario::int = r.IdRol), Area FROM usuarios u ";													
	protected static final String SELECT_USUARIOS_BY_PUESTO = SELECTION + "WHERE (nullif(u.Puesto, '')::int =";
	protected static final String SELECT_USUARIO_BY_USERNAME = SELECTION + "WHERE u.User ='";
	protected static final String SELECT_EMPLEADOS = SELECTION + "WHERE ";
	@Override
	public ArrayList<Usuario> getUsuariosByPuesto(int Puesto) {
		
		ResultSet resultado = null;
		ArrayList<Usuario> lista_usuarios = new ArrayList<Usuario>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_USUARIOS_BY_PUESTO + Puesto;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							Usuario usuario = null;
							usuario = mapearUsuario(resultado);
							lista_usuarios.add(usuario);
						}
					} catch (SQLException e) {
						e.printStackTrace();
						return null;
					}
				}
				st.close();
			}
			c.cerrarConexion();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return lista_usuarios;
	}
	
	public ArrayList<Usuario> getUsuariosByPuestoYRol(int Puesto, Usuario consultante) {
		
		ResultSet resultado = null;
		ArrayList<Usuario> lista_usuarios = new ArrayList<Usuario>();
		
		if(consultante.getTipo() == ADMINISTRADOR_ADN || consultante.getTipo() == ADMINISTRADOR){
			lista_usuarios = this.getUsuariosByPuesto(Puesto);	
		}else{
			try {
				ConexionBase c=new ConexionBase();
				Connection con=c.getConexion();
				if(con!=null){
					Statement st;
					st = con.createStatement();
					String query= SELECT_USUARIOS_BY_PUESTO + Puesto + " AND nullif(JefeDirecto, '')::int =" + consultante.getIdUsuario() + " OR idUsuario=" + consultante.getIdUsuario() + ")";
					System.out.println(query);
					resultado = st.executeQuery(query);
					
					if(!resultado.equals("")){
						try {
							while(resultado.next()){
								Usuario usuario = null;
								usuario = mapearUsuario(resultado);
								lista_usuarios.add(usuario);
							}
						} catch (SQLException e) {
							e.printStackTrace();
							return null;
						}
					}
					st.close();
				}
				c.cerrarConexion();
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		return lista_usuarios;
	}

	
	public ArrayList<Usuario> getEmpleadosDeUsuario(Usuario consultante) {
		
		ResultSet resultado = null;
		ArrayList<Usuario> lista_usuarios = new ArrayList<Usuario>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_EMPLEADOS + "(nullif(JefeDirecto, '')::int =" + consultante.getIdUsuario() + ")";
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							Usuario usuario = null;
							usuario = mapearUsuario(resultado);
							lista_usuarios.add(usuario);
						}
					} catch (SQLException e) {
						e.printStackTrace();
						return null;
					}
				}
				st.close();
			}
			c.cerrarConexion();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return lista_usuarios;
	}

	
	@Override
	public Usuario getUsuarioByUserName(String user_name) {
		// TODO Auto-generated method stub
		ResultSet resultado = null;
		Usuario usuario = null;
		ArrayList<Usuario> lista_empleados = new ArrayList<Usuario>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_USUARIO_BY_USERNAME + user_name + "'";
				System.out.println(query);

				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							usuario = new Usuario();
							usuario = mapearUsuario(resultado);
							lista_empleados = getEmpleadosDeUsuario(usuario);
							usuario.setPersonal(lista_empleados.size());
						}
					} catch (SQLException e) {
						e.printStackTrace();
						return null;
					}
				}
				st.close();
			}
			c.cerrarConexion();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return usuario;
	}

	
	private Usuario mapearUsuario (ResultSet resultado){
		
		Usuario usuario;
		usuario = new Usuario();
		
		try {
			usuario.setIdUsuario(parseIntResultado(resultado, 1));
			usuario.setNombre(parseStringResultado(resultado, 2));
			usuario.setUser(parseStringResultado(resultado, 3));
			usuario.setNb_Puesto(parseStringResultado(resultado, 4));
			usuario.setPuesto(parseIntResultado(resultado, 5));
			usuario.setTipo(parseIntResultado(resultado, 6));
			usuario.setTipo_desc(parseStringResultado(resultado, 7));
			usuario.setArea(parseStringResultado(resultado, 8));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return usuario;
	}

	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}

}
