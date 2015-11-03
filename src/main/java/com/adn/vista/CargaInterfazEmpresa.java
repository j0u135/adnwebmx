package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseEmpresa;
import com.adn.controlador.Empresa;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/ConfEmpresa")
public class CargaInterfazEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaInterfazEmpresa() {
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
		//Consultar Empresas existentes
		ArrayList<Empresa> arrEmpresas = ClaseEmpresa.buscaEmpresas();
		
		request.setAttribute("empresas", arrEmpresas);
		request.getRequestDispatcher("Conf-5.jsp").forward(request, response);
	}

}
