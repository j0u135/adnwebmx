package com.mx.diezx.adn.model.dao;

import java.util.ArrayList;

import com.mx.diezx.adn.model.PresentacionInicial;

public interface IPresentacionInicialDAO {

	ArrayList<PresentacionInicial> getPresentaciones();

	PresentacionInicial getPresentacionActiva();

	void guardarPresentacion(PresentacionInicial presentacion);

	void newPresentacionInicial(PresentacionInicial presentacion);

	void deletePresentacion(PresentacionInicial presentacion);

}
