package com.mx.diezx.adn.controller.presentacioninicial;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.PresentacionInicial;
import com.mx.diezx.adn.model.dao.IPresentacionInicialDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getPresentacionActiva")
public class GetPresentacionActiva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPresentacionActiva() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IPresentacionInicialDAO presentacion_dao = factory.getPresentacionInicialDAO();
		
		PresentacionInicial presentacion_activa = presentacion_dao.getPresentacionActiva();
		
		String presentacion_json = new Gson().toJson(presentacion_activa);
		
		response.setContentType("application/json");
		response.getWriter().write(presentacion_json);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
