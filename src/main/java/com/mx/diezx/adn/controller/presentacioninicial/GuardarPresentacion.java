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

@WebServlet("/guardarPresentacion")
public class GuardarPresentacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GuardarPresentacion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IPresentacionInicialDAO presentacion_dao = factory.getPresentacionInicialDAO();
		
		Gson gson = new Gson();
		PresentacionInicial presentacion = new PresentacionInicial();
		
		StringBuilder sb = new StringBuilder();
		String s;
		
		while((s = request.getReader().readLine()) != null){
			sb.append(s);
		}
		presentacion = (PresentacionInicial)gson.fromJson(sb.toString(), PresentacionInicial.class);
		
		presentacion_dao.guardarPresentacion(presentacion);
		
	}

}
