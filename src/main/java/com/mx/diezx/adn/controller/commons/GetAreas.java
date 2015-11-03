package com.mx.diezx.adn.controller.commons;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mx.diezx.adn.model.Area;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IAreaDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;
import com.google.gson.Gson;

/**
 * Servlet implementation class InicioDHSR
 */
@WebServlet("/getAreas")
public class GetAreas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAreas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IAreaDAO area_dao = factory.getAreaDAO();
		Usuario consultante = null;
		
		HttpSession sesionOk = request.getSession();
		if (sesionOk.getAttribute("usuario") == null) {
			 return;
		} else {
			consultante = ((Usuario)sesionOk.getAttribute("usuario_sesion"));
		}
		
		ArrayList <Area> lista_areas = area_dao.getTodasAreas(consultante);
		
		String lista_areas_json = new Gson().toJson(lista_areas);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_areas_json);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
