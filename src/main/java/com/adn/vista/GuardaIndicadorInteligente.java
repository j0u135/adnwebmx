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

/**
 * Servlet implementation class GuardaIndicadorInteligente
 */
@WebServlet("/GuardaIndicadorInteligente")
public class GuardaIndicadorInteligente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardaIndicadorInteligente() {
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
		String anio=request.getParameter("anio");
		String mes=request.getParameter("mes");
		String mesNum = request.getParameter("mesNum");
		String usuario1=request.getParameter("usuariohiden");
		String peso = request.getParameter("pesoRecibido");
		String claveInd = request.getParameter("indicadorRecibido");
	
		int idIndInte = Integer.parseInt(claveInd);
		String estatus ="Activo";
		ClaseIndicadoresInteligentes.updateEstadoIndInte(idIndInte, usuario1, mes, anio, estatus);
		IndicadorInteligente indInte = new IndicadorInteligente();
		indInte.setIdIndInte(idIndInte);
		indInte.setAnio(anio);
		indInte.setMes(mes);
		indInte.setPeso(peso);
		ClaseIndicadoresInteligentes.update(indInte, usuario1,mes);
		
		//Hoja de Ruta
		ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario1,mes,anio);
		arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
		ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuario1,mesNum,anio);
		ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario1,mes,mesNum,anio);
		arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
		int mesNumInt = Integer.parseInt(mesNum)-1;
		
		request.setAttribute("indicadores", arrIndInte);
		request.setAttribute("porcentajes", resulsetProcentaje);
		request.setAttribute("proyectosPrio", arrProyectosP);
		request.setAttribute("usuarioEnviado", usuario1);
		request.setAttribute("mesEnviado", mes);
		request.setAttribute("mesNumerico", mesNumInt+"");
		request.setAttribute("anio", anio);
		request.setAttribute("origen", "Otro");
		request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
	}
}
