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

@WebServlet("/crearScoreCard")
public class CrearScoreCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CrearScoreCard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ScoreCard card = new ScoreCard();
		Gson json = new Gson();
		
		try{
			StringBuilder sb = new StringBuilder();
			String s;
			
			while((s = request.getReader().readLine()) != null){
				sb.append(s);
			}
			
			card = (ScoreCard)json.fromJson(sb.toString(), ScoreCard.class);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IScoreCardDAO card_dao = factory.getScoreCardDAO();
		
		card_dao.crearScoreCard(card);

		
	}

}
