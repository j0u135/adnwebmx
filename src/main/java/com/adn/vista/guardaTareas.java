package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseTareas;
import com.adn.controlador.Tareas;

/**
 * Servlet implementation class guardaTareas
 */
@WebServlet("/guardaTareas")
public class guardaTareas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guardaTareas() {
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
		
		String usuarioT=request.getParameter("usuarioT");
		String nombreT=request.getParameter("nombreT");
		String tipoT=request.getParameter("tipoT");
		String origenT=request.getParameter("origenT");
		String prioridadT=request.getParameter("prioridadT");
		String periodoiT=request.getParameter("periodoiT");
		String periodofT=request.getParameter("periodofT");
		String asignaT=request.getParameter("asignaT");
		String notasT=request.getParameter("notasT");
		
		Tareas tareas = new Tareas(nombreT,tipoT,origenT,prioridadT,periodoiT,periodofT,usuarioT,asignaT,notasT);
		ClaseTareas.agregarTarea(tareas);
		request.getRequestDispatcher("Tareas2.jsp").forward(request, response);
		
	}

}
