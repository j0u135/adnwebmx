package com.adn.controlador;

public class Indicador {
 
 private int idIndicador;
 private int idArbol;
 private int idDepartamento;
 private String descIndicador;
 private String color;
 private String nbIndicador;
 private String nodosAsociados;
 private int nuNodoArbol;
 private int nuNodoPadre;

 public Indicador() {
	super();
	// TODO Auto-generated constructor stub
}

public Indicador(int idIndicador, int idArbol, int idDepartamento,
		String descIndicador, String color, String nbIndicador,
		String nodosAsociados, int nuNodoArbol, int nuNodoPadre) {
	super();
	this.idIndicador = idIndicador;
	this.idArbol = idArbol;
	this.idDepartamento = idDepartamento;
	this.descIndicador = descIndicador;
	this.color = color;
	this.nbIndicador = nbIndicador;
	this.nodosAsociados = nodosAsociados;
	this.nuNodoArbol = nuNodoArbol;
	this.nuNodoPadre = nuNodoPadre;
}


public int getIdIndicador() {
	return idIndicador;
}
public void setIdIndicador(int idIndicador) {
	this.idIndicador = idIndicador;
}
public int getIdArbol() {
	return idArbol;
}
public void setIdArbol(int idArbol) {
	this.idArbol = idArbol;
}
public int getIdDepartamento() {
	return idDepartamento;
}
public void setIdDepartamento(int idDepartamento) {
	this.idDepartamento = idDepartamento;
}
public String getDescIndicador() {
	return descIndicador;
}
public void setDescIndicador(String descIndicador) {
	this.descIndicador = descIndicador;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}
public String getNbIndicador() {
	return nbIndicador;
}
public void setNbIndicador(String nbIndicador) {
	this.nbIndicador = nbIndicador;
}
public String getNodosAsociados() {
	return nodosAsociados;
}
public void setNodosAsociados(String nodosAsociados) {
	this.nodosAsociados = nodosAsociados;
}
public int getNuNodoArbol() {
	return nuNodoArbol;
}
public void setNuNodoArbol(int nuNodoArbol) {
	this.nuNodoArbol = nuNodoArbol;
}
public int getNuNodoPadre() {
	return nuNodoPadre;
}
public void setNuNodoPadre(int nuNodoPadre) {
	this.nuNodoPadre = nuNodoPadre;
}


 
 
 
}