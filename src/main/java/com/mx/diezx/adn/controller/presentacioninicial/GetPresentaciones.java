package com.mx.diezx.adn.controller.presentacioninicial;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.PresentacionInicial;
import com.mx.diezx.adn.model.dao.IPresentacionInicialDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getPresentaciones")
public class GetPresentaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPresentaciones() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFactory factory = DAOFactory.getFactory(0);
		IPresentacionInicialDAO presentacion_dao = factory.getPresentacionInicialDAO();
		
		ArrayList<PresentacionInicial> lista_presentaciones = presentacion_dao.getPresentaciones();
		
		String lista_presentaciones_json = new Gson().toJson(lista_presentaciones);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_presentaciones_json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
