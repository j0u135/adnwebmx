package com.adn.vista;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.PresentacionIniciaDAO;
import com.adn.controlador.PresentacionInicial;
/**
 * Servlet implementation class CrearNuevaPresentacion
 */
@WebServlet("/nuevaPresentacion")
public class CrearNuevaPresentacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearNuevaPresentacion() {
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
		String descripcion = request.getParameter("descripcionInput");
		String url = request.getParameter("urlInput");
		boolean activo;
		if(request.getParameter("activo") != null){
			activo = request.getParameter("activo").equals("on")?true:false;
		}
		else{
			activo = false;
		}
		PresentacionInicial nueva_presentacion = new PresentacionInicial();
		nueva_presentacion.setDescripcion(descripcion);
		nueva_presentacion.setUrl(url);
		nueva_presentacion.setActivo(activo);
		
		PresentacionIniciaDAO presentacionDAO = new PresentacionIniciaDAO();
		
		presentacionDAO.agregarPresentacionValidandoActivo(nueva_presentacion);
		response.sendRedirect("/ADN/inicio");
	}
}
