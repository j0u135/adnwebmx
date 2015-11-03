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
 * Servlet implementation class editarTareas
 */
@WebServlet("/editarTareas")
public class editarTareas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editarTareas() {
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

		String usuarioeT=request.getParameter("usuarioeT");
		String nombreeT=request.getParameter("nombreeT");
		String tipoeT=request.getParameter("tipoeT");
		String origeneT=request.getParameter("origeneT");
		String prioridadeT=request.getParameter("prioridadeT");
		String periodoieT=request.getParameter("periodoieT");
		String periodofeT=request.getParameter("periodofeT");
		String asignaeT=request.getParameter("asignaeT");
		String notaseT=request.getParameter("notaseT");
		String ideT=request.getParameter("ideT");
		
		Tareas etareas = new Tareas(nombreeT,tipoeT,origeneT,prioridadeT,periodoieT,periodofeT,asignaeT,notaseT,ideT,usuarioeT);
		ClaseTareas.editarTareas(etareas);
		request.getRequestDispatcher("Tareas2.jsp").forward(request, response);
	}

}
