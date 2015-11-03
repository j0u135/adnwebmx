package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;
import com.adn.controlador.PrioridadMes;

/**
 * Servlet implementation class GuardaProyectosPrioritarios
 */
@WebServlet("/GuardaProyectosPrioritarios")
public class GuardaProyectosPrioritarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardaProyectosPrioritarios() {
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
		String nombrePrio=request.getParameter("nombre1");
		String cveInd=request.getParameter("cveInd");
		String fhIni=request.getParameter("fhIni");
		String fhFin=request.getParameter("fhFin");
		String peso=request.getParameter("peso");
		String usuarioHR=request.getParameter("usuarioHR");
		String mes=request.getParameter("mesBarra");
		String mesNum = request.getParameter("mesNumerico");
		String anio=request.getParameter("anioSel"); 
		
		//Guardar Prioridad
		Prioridad prio = new Prioridad();
		prio.setEstatus("Activo");
		prio.setFhInicio(fhIni);
		prio.setFhFin(fhFin);
		int idInd = Integer.parseInt(cveInd);
		prio.setIdIndicador(idInd);
		prio.setNombre(nombrePrio);
		prio.setUsuario(usuarioHR);
		boolean prioCreado = ClaseProyectosPrioritarios.agregarProyecto1(prio);
		if(prioCreado){
			prio = ClaseProyectosPrioritarios.consultarXnombre(usuarioHR, nombrePrio, anio);
			if(prio!=null){
			String priofhIni = prio.getFhInicio();
			String priofhFin = prio.getFhFin();
			String[] arrfhIni = priofhIni.split("\\/");
			String[] arrfhFin = priofhFin.split("\\/");
			String mesIni = arrfhIni[0];
			String mesFin = arrfhFin[0];
			int intMesIni = Integer.parseInt(mesIni);
			int intMesFin = Integer.parseInt(mesFin);
			int diferencia = intMesFin - intMesIni;
			diferencia++;
			for(int i=0; i <diferencia; i++){
				String mesGuar = obtenMes(intMesIni);
				PrioridadMes prioMes = new PrioridadMes();
				prioMes.setAnio(anio);
				prioMes.setAvanceProgramado("0");
				prioMes.setAvanceReal("0");
				prioMes.setEstatus("Activo");
				prioMes.setIdPrioridad(prio.getIdPrioridad());
				prioMes.setMes(mesGuar);
				prioMes.setPeso(peso);
				ClasePrioridesPorMes.agregarPrioMes(prioMes);
				intMesIni++;
			}
			}
		}
		
		
		//Hoja de Ruta
		ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuarioHR,mes,anio);
		arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
		ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuarioHR,mesNum,anio);
		ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuarioHR,mes,mesNum,anio);
		arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
		
		request.setAttribute("indicadores", arrIndInte);
		request.setAttribute("porcentajes", resulsetProcentaje);
		request.setAttribute("proyectosPrio", arrProyectosP);
		request.setAttribute("usuarioEnviado", usuarioHR);
		request.setAttribute("mesEnviado", mes);
		request.setAttribute("mesNumerico", mesNum);
		request.setAttribute("anio", anio);
		request.setAttribute("origen", "comboSelect");
		request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
	
	}
	
	private String obtenMes(int mes){
		String mesN="";
		switch (mes) {
			case 1:
				mesN = "Enero";
				break;
			case 2:
				mesN = "Febrero";
				break;
			case 3:
				mesN = "Marzo";
				break;
			case 4:
				mesN = "Abril";
				break;
			case 5:
				mesN = "Mayo";
				break;
			case 6:
				mesN = "Junio";
				break;
			case 7:
				mesN = "Julio";
				break;
			case 8:
				mesN = "Agosto";
				break;
			case 9:
				mesN = "Septiembre";
				break;
			case 10:
				mesN = "Octubre";
				break;
			case 11:
				mesN = "Noviembre";
				break;
			case 12:
				mesN = "Diciembre";
				break;
			}
		return mesN;
	}

}
