package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClaseDepartamento;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Departamento;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Usuario;


/**
 * Servlet implementation class servletRedireccion
 */
@WebServlet("/altaPriori")
public class AltaPrioridades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaPrioridades() {
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
		 String usuarioHR=request.getParameter("usuarioHR");
		 String mesBarra=request.getParameter("mesBarra");
		 String mesNum = request.getParameter("mesNumerico");
		 String anio=request.getParameter("anioSel");
		 Departamento depto = null;
		 ArrayList<IndicadorInteligente> arrIndInt=null;
		 Usuario usu = ClaseUsuario.buscaUsuario(usuarioHR);
		 if(usu!=null){
			 int idArea = ClaseArea.consultarIdArea(usu.getArea());
			 depto = ClaseDepartamento.buscaDeptoXpuesto(usu.getPuesto(), idArea);
			 arrIndInt = ClaseIndicadoresInteligentes.consultar(usuarioHR, mesBarra, anio);
		 }
		   //Nuevos campos para llevar la barra
		   request.setAttribute("mesNumerico", mesNum);
		   request.setAttribute("usuario", usuarioHR);
		   request.setAttribute("puesto", usu.getPuesto());
		   request.setAttribute("mes", mesBarra);
		   request.setAttribute("departamento", depto.getNbDepto());
		   request.setAttribute("area", usu.getArea());
		   request.setAttribute("arrNis", arrIndInt);
		   request.setAttribute("anio", anio);
		   request.getRequestDispatcher("AltaProyectos.jsp").forward(request, response);
	}
}
