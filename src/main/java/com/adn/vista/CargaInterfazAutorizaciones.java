package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseAutorizaCambioFiltro;
import com.adn.controlador.AutorizaCambioFiltro;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/cargaInterfazAutorizaciones")
public class CargaInterfazAutorizaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaInterfazAutorizaciones() {
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
		String usuarioAutorizador=request.getParameter("usuarioSes");
		ArrayList<AutorizaCambioFiltro> arrCambios = null;
		if(usuarioAutorizador!=null && !usuarioAutorizador.equals("")){
			arrCambios = ClaseAutorizaCambioFiltro.consultaXnbAutorizador(usuarioAutorizador);
		}
		
		request.setAttribute("arrCambios", arrCambios);
		request.setAttribute("usuarioSes", usuarioAutorizador);
		request.getRequestDispatcher("Autorizaciones.jsp").forward(request, response);
	}
	
}
