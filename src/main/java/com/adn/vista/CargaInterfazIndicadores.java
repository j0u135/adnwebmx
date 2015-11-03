package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArbol;
import com.adn.conexion.ClaseFiltroInd;
import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicador;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.conexion.ClasePuestos;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Arbol;
import com.adn.controlador.FiltroIndicadores;
import com.adn.controlador.Indicador;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;
import com.adn.controlador.Puesto;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/CargaInterfazIndicadores")
public class CargaInterfazIndicadores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaInterfazIndicadores() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mes=request.getParameter("mesEnviado");
		String mesNum=request.getParameter("mesNumerico");
		String anio=request.getParameter("anioSel"); 
		String origen=request.getParameter("origen");
		String usuario=request.getParameter("usuarioRedireccion");
		String origenHD=request.getParameter("origenHD");
		String avProg=request.getParameter("avProg");//Avance Programado
		String avReal=request.getParameter("avReal");//Avance Real
		if(origenHD!=null && origenHD.equals("Cabecera")){
			mes=request.getParameter("mesEnviadoHD");
			mesNum=request.getParameter("mesNumericoHD");
			anio=request.getParameter("anioSelHD"); 
			origen=request.getParameter("origenHD");
			usuario=request.getParameter("usuarioRedireccionHD");	
		}
		
		Calendar fecha = Calendar.getInstance();

		
		Integer mesInt = fecha.get(Calendar.MONTH);
		Integer ano = fecha.get(Calendar.YEAR);
		if(anio==""){
			anio = ano.toString();
		}
		if(mes.trim().equals("") || mes.length()<3){
			mesNum = mesInt.toString();
		}
		if(mes.equals("")){
			mes = this.regresaNombreMes(mesNum);
		}
		
		if(origen.equals("Inicio")){
			origen="Select";
		}
		//Busca los datos del usuario
		Usuario usu = ClaseUsuario.buscaUsuario(usuario);
		ArrayList<Indicador> indAsocXpuesto = this.validaNIsXpuesto(usu);
		ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mes,anio);
		if(arrIndInte==null && indAsocXpuesto!=null){ //Si no hay NIs los da de alta
			System.out.println("inserta en el if");
			for(int x=0; x<indAsocXpuesto.size(); x++){
				Indicador indicador = indAsocXpuesto.get(x);
				IndicadorInteligente indinte = new IndicadorInteligente();
				indinte.setAnio(anio);
				indinte.setIdIndicador(indicador.getIdIndicador());
				indinte.setMes(mes);
				indinte.setPeso("0");
				indinte.setEstatus("Activo");
				indinte.setUsuario(usuario);
				indinte.setMeta("0");
				indinte.setResultado("0");
				indinte.setRpond("0");
				ClaseIndicadoresInteligentes.agregarIndicador(indinte);
			}
		}else{ //Si tiene NIs se valida que coincidan con los asociados
			for(int x=0; x<indAsocXpuesto.size(); x++){
				//System.out.println("inserta en el else");
				Indicador indicador = indAsocXpuesto.get(x);
				boolean existe = validaSiExiste(arrIndInte, indicador);
				if(!existe){
					IndicadorInteligente indinte = new IndicadorInteligente();
					indinte.setAnio(anio);
					indinte.setIdIndicador(indicador.getIdIndicador());
					indinte.setMes(mes);
					indinte.setPeso("0");
					indinte.setEstatus("Activo");
					indinte.setUsuario(usuario);
					indinte.setMeta("0");
					indinte.setResultado("0");
					indinte.setRpond("0");
					ClaseIndicadoresInteligentes.agregarIndicador(indinte);
				}
			}
		}
		arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mes,anio);
		arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
		ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuario,mesNum,anio);
		int mesNumReal=Integer.parseInt(mesNum)+1;
		ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario,mes, mesNumReal+"",anio);
		arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
		//System.out.println("Proyectos "+arrProyectosP.size());
		request.setAttribute("avProg", avProg);
		request.setAttribute("avReal", avReal);
		request.setAttribute("indicadores", arrIndInte);
		request.setAttribute("porcentajes", resulsetProcentaje);
		request.setAttribute("proyectosPrio", arrProyectosP);
		request.setAttribute("usuarioEnviado", usuario);
		request.setAttribute("mesEnviado", mes);
		request.setAttribute("mesNumerico", mesNum);
		request.setAttribute("anio", anio);
		request.setAttribute("origen", origen);
		request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
	}
	
	private boolean validaSiExiste(ArrayList<IndicadorInteligente> arrIndInte,Indicador indicador) {
		boolean existe = false;
		for(int i=0; i<arrIndInte.size();i++){
			IndicadorInteligente indInt = arrIndInte.get(i);
			if(indInt.getIdIndicador()==indicador.getIdIndicador()){
				existe=true;
			}
		}
		return existe;
	}

	private ArrayList<Indicador> validaNIsXpuesto(Usuario usu){
		ArrayList<Indicador> indAsocXpuesto = null;
		if(usu!=null){
			String idPuesto = usu.getPuesto();
			Puesto puestoUsuario = ClasePuestos.buscaPuestoXid(idPuesto);
			String indicadores= puestoUsuario.getIndCtrlAsoc();
			if(indicadores!=null && !indicadores.equals("")){
				Arbol nuevoArbol = new Arbol();
				nuevoArbol.setIdArea(puestoUsuario.getIdArea());
				int idArbol = ClaseArbol.verificaRepetido(nuevoArbol);
				ArrayList<Indicador> arrIndicadores = ClaseIndicador.consultarIndicadores(idArbol);
				if(arrIndicadores!=null && arrIndicadores.size()>0){
					indAsocXpuesto = new ArrayList<Indicador>();
					for(int i=0; i<arrIndicadores.size(); i++){
						Indicador ind = arrIndicadores.get(i);
						int nuNodoArbol = ind.getNuNodoArbol();
						String[] arrInd = indicadores.split("\\,");
						for(int j =0; j<arrInd.length; j++){
							
							int nuNodoAsociado =  Integer.parseInt(arrInd[j]);
							if(nuNodoArbol==nuNodoAsociado){
								FiltroIndicadores filind = ClaseFiltroInd.consultarFiltroInd(ind.getIdIndicador());
								if(filind!=null && filind.getIdFiltroInd()>0){
									indAsocXpuesto.add(ind);//Indicadores de control asociados al puesto
								}
							}
						}
					}
				}
			}
		}
		return indAsocXpuesto;
	}
	
	private String regresaNombreMes(String mesNum){
		String mesN="";
		int mesNu = Integer.parseInt(mesNum);
		switch (mesNu) {
		case 0:
			mesN = "Enero";
			break;
		case 1:
			mesN = "Febrero";
			break;
		case 2:
			mesN = "Marzo";
			break;
		case 3:
			mesN = "Abril";
			break;
		case 4:
			mesN = "Mayo";
			break;
		case 5:
			mesN = "Junio";
			break;
		case 6:
			mesN = "Julio";
			break;
		case 7:
			mesN = "Agosto";
			break;
		case 8:
			mesN = "Septiembre";
			break;
		case 9:
			mesN = "Octubre";
			break;
		case 10:
			mesN = "Noviembre";
			break;
		case 11:
			mesN = "Diciembre";
			break;
		}
		return mesN;
	}

}
