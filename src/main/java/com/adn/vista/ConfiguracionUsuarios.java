package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClasePuestos;
import com.adn.conexion.ClaseRoles;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Area;
import com.adn.controlador.Puesto;
import com.adn.controlador.Rol;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class buscaUsuario y buscaIndicadores 
 */
@WebServlet("/ConfUsuarios")
public class ConfiguracionUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfiguracionUsuarios() {
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
            ArrayList<Rol> roles = null;
            ArrayList<Usuario> jefes = null;
            
            
		   //Busca areas
            areas = ClaseArea.consultar();
            jefes = ClaseUsuario.consultaJefes();
            roles = ClaseRoles.consultar();
		   if(areas!=null || jefes!=null || roles!=null){
			   request.setAttribute("areas", areas);
			   request.setAttribute("jefes", jefes);
			   request.setAttribute("roles", roles);
		   }else{
			   request.setAttribute("areas", "");
			   request.setAttribute("puestos", "");
			   request.setAttribute("roles", "");
		   }
	   
		request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
	}

}
