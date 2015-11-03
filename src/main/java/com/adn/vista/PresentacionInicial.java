package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.PresentacionIniciaDAO;

/**
 * Servlet implementation class PresentacionInicial
 */
@WebServlet("/inicio")
public class PresentacionInicial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PresentacionInicial() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PresentacionIniciaDAO presentacion_dao = new PresentacionIniciaDAO();
		
		ArrayList<com.adn.controlador.PresentacionInicial> presentaciones = presentacion_dao.encontrarTodasPresentaciones();
		com.adn.controlador.PresentacionInicial presentacion_activa = presentacion_dao.encontrarPresentacionActiva();
		
		com.adn.controlador.PresentacionInicial presentacion = null;
		String presentaciones_json = "";
		for (int i = 0; i < presentaciones.size(); i++){
			presentacion = presentaciones.get(i);
			presentaciones_json = presentaciones_json + presentacion.toJson("presentaciones_iniciales");
		}
		
		request.setAttribute("presentacion_activa", presentacion_activa);
		request.setAttribute("presentaciones", presentaciones_json);
		
		request.getRequestDispatcher("Index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
