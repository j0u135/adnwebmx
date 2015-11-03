package com.mx.diezx.adn.model.dao;

import com.mx.diezx.adn.model.ScoreCard;

public interface IScoreCardDAO {
	
	public ScoreCard getSocreCard();
	
	public void editarScoreCard(ScoreCard card);
	
	public void crearScoreCard(ScoreCard card);
	
	public void eliminarScoreCard(ScoreCard card);

}
