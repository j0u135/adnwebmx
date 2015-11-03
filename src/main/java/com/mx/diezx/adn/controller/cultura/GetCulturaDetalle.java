package com.mx.diezx.adn.controller.cultura;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.Cultura;
import com.mx.diezx.adn.model.dao.ICulturaDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getCulturaDetalle")
public class GetCulturaDetalle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetCulturaDetalle() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		ICulturaDAO cultura_dao = factory.getCulturaDAO();
		
		Cultura cultura = cultura_dao.getCulturaDetalle();
		
		String cultura_json = new Gson().toJson(cultura);
		
		response.setContentType("application/json");
		response.getWriter().write(cultura_json);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
