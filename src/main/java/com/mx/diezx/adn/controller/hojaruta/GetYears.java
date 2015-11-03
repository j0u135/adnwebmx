package com.mx.diezx.adn.controller.hojaruta;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.dao.IHojaRutaDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

/**
 * Servlet implementation class GetYear
 */
@WebServlet("/getYearsHojaRuta")
public class GetYears extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetYears() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IHojaRutaDAO hojaruta_dao = factory.getHojaRutaDAO();
		ArrayList<Integer> lista_years = hojaruta_dao.getYears();
		
		String lista_years_json = new Gson().toJson(lista_years);
		response.setContentType("application/json");
		response.getWriter().write(lista_years_json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
