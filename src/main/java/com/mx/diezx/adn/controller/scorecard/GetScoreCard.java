package com.mx.diezx.adn.controller.scorecard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.ScoreCard;
import com.mx.diezx.adn.model.dao.IScoreCardDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;


@WebServlet("/getScoreCard")
public class GetScoreCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetScoreCard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IScoreCardDAO card_dao = factory.getScoreCardDAO();
		ScoreCard card = new ScoreCard();
		
		card = card_dao.getSocreCard();
		String card_json = new Gson().toJson(card);
		
		response.setContentType("application/json");
		response.getWriter().write(card_json);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
