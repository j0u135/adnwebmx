package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.controlador.Area;

/**
 * Servlet implementation class buscaUsuario y buscaIndicadores 
 */
@WebServlet("/ConfigPuestos")
public class ConfiguracionPuestos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfiguracionPuestos() {
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
					
            ArrayList<Area> areas = null;
              
		   //Busca areas
            areas = ClaseArea.consultar();
		   if(areas!=null){
			   request.setAttribute("areas", areas);
		   }else{
			   request.setAttribute("areas", "");
		   }
	   
		request.getRequestDispatcher("Conf-4.jsp").forward(request, response);
	}

}
