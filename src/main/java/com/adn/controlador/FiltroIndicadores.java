package com.adn.controlador;

public class FiltroIndicadores {

	int idFiltroInd;
	int idIndicador;
	String objetivo;
	String respNombre;
	String respPuesto;
	String sentido;
	String tpCarga;
	String unidadMedida;
	String fuenteDatos;
	String frecEmision;
	String formula;
	String fhCorte;
	String distribucion;
	
	public FiltroIndicadores(int idFiltroInd, int idIndicador, String objetivo,
			String respNombre, String respPuesto, String sentido,
			String tpCarga, String unidadMedida, String fuenteDatos,
			String frecEmision, String formula, String fhCorte,
			String distribucion) {
		super();
		this.idFiltroInd = idFiltroInd;
		this.idIndicador = idIndicador;
		this.objetivo = objetivo;
		this.respNombre = respNombre;
		this.respPuesto = respPuesto;
		this.sentido = sentido;
		this.tpCarga = tpCarga;
		this.unidadMedida = unidadMedida;
		this.fuenteDatos = fuenteDatos;
		this.frecEmision = frecEmision;
		this.formula = formula;
		this.fhCorte = fhCorte;
		this.distribucion = distribucion;
	}

	public int getIdFiltroInd() {
		return idFiltroInd;
	}

	public void setIdFiltroInd(int idFiltroInd) {
		this.idFiltroInd = idFiltroInd;
	}

	public int getIdIndicador() {
		return idIndicador;
	}

	public void setIdIndicador(int idIndicador) {
		this.idIndicador = idIndicador;
	}

	public String getObjetivo() {
		return objetivo;
	}

	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}

	public String getRespNombre() {
		return respNombre;
	}

	public void setRespNombre(String respNombre) {
		this.respNombre = respNombre;
	}

	public String getRespPuesto() {
		return respPuesto;
	}

	public void setRespPuesto(String respPuesto) {
		this.respPuesto = respPuesto;
	}

	public String getSentido() {
		return sentido;
	}

	public void setSentido(String sentido) {
		this.sentido = sentido;
	}

	public String getTpCarga() {
		return tpCarga;
	}

	public void setTpCarga(String tpCarga) {
		this.tpCarga = tpCarga;
	}

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public String getFuenteDatos() {
		return fuenteDatos;
	}

	public void setFuenteDatos(String fuenteDatos) {
		this.fuenteDatos = fuenteDatos;
	}

	public String getFrecEmision() {
		return frecEmision;
	}

	public void setFrecEmision(String frecEmision) {
		this.frecEmision = frecEmision;
	}

	public String getFormula() {
		return formula;
	}

	public void setFormula(String formula) {
		this.formula = formula;
	}

	public String getFhCorte() {
		return fhCorte;
	}

	public void setFhCorte(String fhCorte) {
		this.fhCorte = fhCorte;
	}

	public String getDistribucion() {
		return distribucion;
	}

	public void setDistribucion(String distribucion) {
		this.distribucion = distribucion;
	}

	public FiltroIndicadores() {
		// TODO Auto-generated constructor stub
	}

}
