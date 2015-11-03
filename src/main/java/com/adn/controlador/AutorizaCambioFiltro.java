package com.adn.controlador;

public class AutorizaCambioFiltro {

	int idAutoCambioFiltro;
	int idFiltroIndicador;
	String nbCampo;
	String valorAnterior;
	String valorNuevo;
	String usrSolicita;
	String usrAutorizador;
	String stCambio;
	String fhCreacion;
	String nbIndicador;
	String campoBD;
	
	public int getIdAutoCambioFiltro() {
		return idAutoCambioFiltro;
	}


	public void setIdAutoCambioFiltro(int idAutoCambioFiltro) {
		this.idAutoCambioFiltro = idAutoCambioFiltro;
	}


	public int getIdFiltroIndicador() {
		return idFiltroIndicador;
	}


	public void setIdFiltroIndicador(int idFiltroIndicador) {
		this.idFiltroIndicador = idFiltroIndicador;
	}


	public String getNbCampo() {
		return nbCampo;
	}


	public void setNbCampo(String nbCampo) {
		this.nbCampo = nbCampo;
	}


	public String getValorAnterior() {
		return valorAnterior;
	}


	public void setValorAnterior(String valorAnterior) {
		this.valorAnterior = valorAnterior;
	}


	public String getValorNuevo() {
		return valorNuevo;
	}


	public void setValorNuevo(String valorNuevo) {
		this.valorNuevo = valorNuevo;
	}


	public String getUsrSolicita() {
		return usrSolicita;
	}


	public void setUsrSolicita(String usrSolicita) {
		this.usrSolicita = usrSolicita;
	}


	public String getUsrAutorizador() {
		return usrAutorizador;
	}


	public void setUsrAutorizador(String usrAutorizador) {
		this.usrAutorizador = usrAutorizador;
	}


	public String getStCambio() {
		return stCambio;
	}


	public void setStCambio(String stCambio) {
		this.stCambio = stCambio;
	}


	public String getFhCreacion() {
		return fhCreacion;
	}


	public void setFhCreacion(String fhCreacion) {
		this.fhCreacion = fhCreacion;
	}


	public AutorizaCambioFiltro(int idAutoCambioFiltro, int idFiltroIndicador,
			String nbCampo, String valorAnterior, String valorNuevo,
			String usrSolicita, String usrAutorizador, String stCambio) {
		super();
		this.idAutoCambioFiltro = idAutoCambioFiltro;
		this.idFiltroIndicador = idFiltroIndicador;
		this.nbCampo = nbCampo;
		this.valorAnterior = valorAnterior;
		this.valorNuevo = valorNuevo;
		this.usrSolicita = usrSolicita;
		this.usrAutorizador = usrAutorizador;
		this.stCambio = stCambio;
	}


	public AutorizaCambioFiltro() {
		// TODO Auto-generated constructor stub
	}


	public String getNbIndicador() {
		return nbIndicador;
	}


	public void setNbIndicador(String nbIndicador) {
		this.nbIndicador = nbIndicador;
	}


	public String getCampoBD() {
		return campoBD;
	}


	public void setCampoBD(String campoBD) {
		this.campoBD = campoBD;
	}

}
