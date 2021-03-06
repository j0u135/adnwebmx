package com.mx.diezx.adn.controller.indicadorinteligente;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.IndicadorInteligente;
import com.mx.diezx.adn.model.dao.IIndicadorInteligenteDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getIndicadores")
public class GetIndicadores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetIndicadores() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<IndicadorInteligente> lista_indicadores = new ArrayList<IndicadorInteligente>();
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IIndicadorInteligenteDAO indicador_dao = factory.getIndicadorInteligenteDAO();
		
		lista_indicadores = indicador_dao.getIndicadores();
		
		String lista_indicadores_json = new Gson().toJson(lista_indicadores);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_indicadores_json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
