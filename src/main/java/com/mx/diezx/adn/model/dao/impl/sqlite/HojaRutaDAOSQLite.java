package com.mx.diezx.adn.model.dao.impl.sqlite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.adn.conexion.ConexionBase;
import com.mx.diezx.adn.model.Departamento;
import com.mx.diezx.adn.model.HojaRuta;
import com.mx.diezx.adn.model.Puesto;
import com.mx.diezx.adn.model.ReporteDepartamentosHojaRuta;
import com.mx.diezx.adn.model.ReporteUsuariosHojaRuta;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IDepartamentoDAO;
import com.mx.diezx.adn.model.dao.IHojaRutaDAO;
import com.mx.diezx.adn.model.dao.IPuestoDAO;
import com.mx.diezx.adn.model.dao.IUsuarioDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

public class HojaRutaDAOSQLite implements IHojaRutaDAO {

	protected static final String SELECT_YEARS = "SELECT DISTINCT anio FROM hojaRumbo";
	protected static final String SELECT_HOJARUTA_BY_USUARIO_YEAR = "SELECT id, mes, resultado, estatus FROM hojaRumbo WHERE ";
	
	@Override
	public ArrayList<Integer> getYears() {
		ResultSet resultado = null;
		ArrayList <Integer> lista_years = new ArrayList<Integer>();
		
		try{
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_YEARS;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							int year;
							year = parseIntResultado(resultado, 1);
							lista_years.add(year);
						}
					} catch (SQLException e) {
						e.printStackTrace();
						return null;
					}
				}
				st.close();
			}
			c.cerrarConexion();
		}
		catch (SQLException e){
			e.printStackTrace();
			return null;
		}
		
		return lista_years;
	}
	
	@Override
	public ArrayList<ReporteUsuariosHojaRuta> getHojaRumboByDepartamentoYYear(
			int id_departamento, int year, Usuario consultante) {
		
		ArrayList<ReporteUsuariosHojaRuta> lista_reportes = new ArrayList<ReporteUsuariosHojaRuta>();
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IPuestoDAO puesto_dao = factory.getPuestoDAO();
		IUsuarioDAO usuario_dao = factory.getUsuarioDAO();
		
		ArrayList<Puesto> lista_puestos = puesto_dao.getPuestosByDepartamento(id_departamento, consultante);
		for(int i = 0; i < lista_puestos.size(); i++ ){
			int id_puesto = lista_puestos.get(i).getIdPuesto();
			ArrayList<Usuario> lista_usuarios = usuario_dao.getUsuariosByPuestoYRol(id_puesto, consultante);
			for (int j = 0; j < lista_usuarios.size(); j ++){
				Usuario usuario = lista_usuarios.get(j);
				ReporteUsuariosHojaRuta reporte = new ReporteUsuariosHojaRuta();
				ArrayList<HojaRuta> lista_hojas = getHojaRumboByUsuarioYYear(usuario, year);
				reporte.setUsuario(usuario);
				reporte.calcularPromedioResultadoPorUsuarios(lista_hojas); 
				reporte.calcularPorcentajeAprobadosPorUsuarios(lista_hojas);
				lista_reportes.add(reporte);
			}
		}
		return lista_reportes;
	}
	
	@Override
	public ArrayList<ReporteDepartamentosHojaRuta> getHojaRutaByAreaYYear(int area,
			int year, Usuario consultante) {

		DAOFactory factory = DAOFactory.getFactory(0);
		IDepartamentoDAO departamento_dao = factory.getDepartamentoDAO();
		IHojaRutaDAO hoja_ruta_dao = factory.getHojaRutaDAO();
		        
		ArrayList <Departamento> lista_departamentos = departamento_dao.getDepartamentosByArea(area, consultante);
		ArrayList <ReporteDepartamentosHojaRuta> lista_reportes_area = new ArrayList <ReporteDepartamentosHojaRuta>();
		
		int size = lista_departamentos.size();
		for(int i = 0; i < size; i++){
			Departamento departamento = lista_departamentos.get(i);
			ReporteDepartamentosHojaRuta reporte = new ReporteDepartamentosHojaRuta();
			reporte.setDepartamento(departamento);
			
			ArrayList<ReporteUsuariosHojaRuta> reportes_departamento = new ArrayList<ReporteUsuariosHojaRuta>();
			reportes_departamento = hoja_ruta_dao.getHojaRumboByDepartamentoYYear(departamento.getId_Departamento(), year, consultante);
			
			reporte.calculaPromedio(reportes_departamento);
			reporte.calcularPorcentajeAprobados(reportes_departamento);
			
			lista_reportes_area.add(reporte);
		}
		return lista_reportes_area;
	}



	@Override
	public ArrayList<HojaRuta> getHojaRumboByUsuarioYYear(Usuario usuario,
			int year) {
		
		ResultSet resultado = null;
		ArrayList <HojaRuta> lista_hojaruta = new ArrayList<HojaRuta>();
		
		try {
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			if(con!=null){
				Statement st;
				st = con.createStatement();
				String query= SELECT_HOJARUTA_BY_USUARIO_YEAR + "usuario= '" + usuario.getUser() + "' AND nullif(anio,'')::int=" + year;
				System.out.println(query);
				resultado = st.executeQuery(query);
				
				if(!resultado.equals("")){
					try {
						while(resultado.next()){
							HojaRuta hoja_ruta = null;
							hoja_ruta = mapearHojaRuta(resultado);
							lista_hojaruta.add(hoja_ruta);
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
		
		return lista_hojaruta;
	}
	
	
	private HojaRuta mapearHojaRuta (ResultSet resultado){
		HojaRuta hoja_ruta = new HojaRuta();
		
		try {
			hoja_ruta.setId(parseIntResultado(resultado, 1));
			hoja_ruta.setMes(parseIntResultado(resultado, 2));
			hoja_ruta.setMes_palabra(getPalabraMes(hoja_ruta.getMes()));
			hoja_ruta.setResultado(parseIntResultado(resultado, 3));
			hoja_ruta.setEstatus(parseStringResultado(resultado, 4));

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return hoja_ruta;
	}
	
	private String getPalabraMes(int mes_numerico){
		switch(mes_numerico){
		case 0:
			return "Enero";
		case 1:
			return "Febrero";
		case 2:
			return "Marzo";
		case 3:
			return "Abril";
		case 4:
			return "Mayo";
		case 5:
			return "Junio";
		case 6:
			return "Julio";
		case 7:
			return "Agosto";
		case 8:
			return "Septiembre";
		case 9:
			return "Octubre";
		case 10:
			return "Noviembre";
		case 11:
			return "Diciembre";
		default:
			return "";
		}
	}

	private int parseIntResultado(ResultSet resultado, int posicion) throws NumberFormatException, SQLException{
		return Integer.parseInt(resultado.getString(posicion)!=null && !resultado.getString(posicion).equals("NaN") && !resultado.getString(posicion).equals("") ?resultado.getString(posicion):"0");
	}
	
	private String parseStringResultado(ResultSet resultado, int posicion) throws SQLException{
		return resultado.getString(posicion)!=null?resultado.getString(posicion):"";
	}

}
