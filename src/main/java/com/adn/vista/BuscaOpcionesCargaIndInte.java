package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseIndicador;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClaseUsuario;

/**
 * Servlet implementation class buscaUsuario y buscaIndicadores 
 */
@WebServlet("/BuscaOpcionesCargaIndInte")
public class BuscaOpcionesCargaIndInte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscaOpcionesCargaIndInte() {
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
			String op = request.getParameter("linkDestino1");
					
            ArrayList<Object> usuariosArr = null;
            ArrayList<String> nbIndArr = null;
            ArrayList<Object> indInteArr = null;
            
		   //Busca los usuarios
		   usuariosArr = ClaseUsuario.consultarUsuarioNom();
		   //Busca los nombres de los indicadores para el combo
		   nbIndArr = ClaseIndicador.consultarIndDos();
		   //Busca el nombre, usuario y anio de los indicadores 
		   indInteArr = ClaseIndicadoresInteligentes.consultaNombreAnioIndInte();
		   if(usuariosArr!=null){
			   request.setAttribute("usuarios", usuariosArr);
		   }
		   if(nbIndArr != null){
			   request.setAttribute("nombresInd", nbIndArr);
		   }
		   if(indInteArr != null){
			   request.setAttribute("indInt", indInteArr);
		   }
		   if(op.equals("Mes")){
			   request.getRequestDispatcher("CargaArchivoCsvMes.jsp").forward(request, response);
		   }else if(op.equals("Indicador")){
			   request.getRequestDispatcher("CargaArchivoCsvIndicador.jsp").forward(request, response);
		   }else if(op.equals("Usuario")){
			   request.getRequestDispatcher("CargaArchivoCsvUsuario.jsp").forward(request, response);
		   }
	}

}
