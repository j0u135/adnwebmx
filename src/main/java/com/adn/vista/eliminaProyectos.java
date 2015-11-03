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
 * Servlet implementation class eliminaProyectos
 */
@WebServlet("/eliminaProyectos")
public class eliminaProyectos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public eliminaProyectos() {
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
		String usuario=request.getParameter("usuarioHR");
		String cvePrio=request.getParameter("cvePrio");
		String mes=request.getParameter("mesEnviado");
		String mesNum=request.getParameter("mesNumerico");
		String anio=request.getParameter("anioSel"); 
		String origen=request.getParameter("origen");
		
		
		 if(!cvePrio.equalsIgnoreCase("")){  
			int idPrio = Integer.parseInt(cvePrio);
			Prioridad prio = ClaseProyectosPrioritarios.consultarXclave(usuario,idPrio,anio);
			
			boolean in=ClasePrioridesPorMes.actualizaEstatusMes(prio,"Inactivo",mes,anio);
			request.setAttribute("variableEnviada", new String("El proyecto se elimino correctamente"));
		 }else{
			 request.setAttribute("variableEnviada", new String("No se pudo eliminar")); 
		 }
			ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mes,anio);
			arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
			ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuario,mesNum,anio);
			ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario,mes, mesNum,anio);
			arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
			
			request.setAttribute("indicadores", arrIndInte);
			request.setAttribute("porcentajes", resulsetProcentaje);
			request.setAttribute("proyectosPrio", arrProyectosP);
			request.setAttribute("usuarioEnviado", usuario);
			request.setAttribute("mesEnviado", mes);
			request.setAttribute("mesNumerico", mesNum);
			request.setAttribute("anio", anio);
			request.setAttribute("origen", origen);
			
			//request.getRequestDispatcher("Mensaje.jsp").forward(request, response);
			request.setAttribute("indicadores", arrIndInte);
			request.setAttribute("porcentajes", resulsetProcentaje);
			request.setAttribute("proyectosPrio", arrProyectosP);
			request.setAttribute("usuarioEnviado", usuario);
			request.setAttribute("mesEnviado", mes);
			request.setAttribute("mesNumerico", mesNum);
			request.setAttribute("anio", anio);
			request.setAttribute("origen", new String("Inicio"));
			request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
		}
}


