package com.adn.controlador;

public class HojaRumbo {

	private String anio;
	private String usuario;
	private String mes;
	private String solicitud;
	private String liberacion;
	private String resultado;
	private String estatus;
	private String aprobadores;
	private String aprobados;
	private String nbApro1;
	private String nbApro2;
	private String nbApro3;
	private String nbApro4;
	private String apro1;
	private String apro2;
	private String apro3;
	private String apro4;
	private String rapro1;
	private String rapro2;
	private String rapro3;
	private String rapro4;
	private String usuApro1;
	private String usuApro2;
	private String usuApro3;
	private String usuApro4;
	
	public String getUsuApro1() {
		return usuApro1;
	}
	public void setUsuApro1(String usuApro1) {
		this.usuApro1 = usuApro1;
	}
	public String getUsuApro2() {
		return usuApro2;
	}
	public void setUsuApro2(String usuApro2) {
		this.usuApro2 = usuApro2;
	}
	public String getUsuApro3() {
		return usuApro3;
	}
	public void setUsuApro3(String usuApro3) {
		this.usuApro3 = usuApro3;
	}
	public String getUsuApro4() {
		return usuApro4;
	}
	public void setUsuApro4(String usuApro4) {
		this.usuApro4 = usuApro4;
	}
	/**
	 * @return the nbApro1
	 */
	public String getNbApro1() {
		return nbApro1;
	}
	/**
	 * @param nbApro1 the nbApro1 to set
	 */
	public void setNbApro1(String nbApro1) {
		this.nbApro1 = nbApro1;
	}
	/**
	 * @return the nbApro2
	 */
	public String getNbApro2() {
		return nbApro2;
	}
	/**
	 * @param nbApro2 the nbApro2 to set
	 */
	public void setNbApro2(String nbApro2) {
		this.nbApro2 = nbApro2;
	}
	/**
	 * @return the nbApro3
	 */
	public String getNbApro3() {
		return nbApro3;
	}
	/**
	 * @param nbApro3 the nbApro3 to set
	 */
	public void setNbApro3(String nbApro3) {
		this.nbApro3 = nbApro3;
	}
	/**
	 * @return the nbApro4
	 */
	public String getNbApro4() {
		return nbApro4;
	}
	/**
	 * @param nbApro4 the nbApro4 to set
	 */
	public void setNbApro4(String nbApro4) {
		this.nbApro4 = nbApro4;
	}	
	/**
	 * @return the anio
	 */
	public String getAnio() {
		return anio;
	}
	/**
	 * @param anio the anio to set
	 */
	public void setAnio(String anio) {
		this.anio = anio;
	}
	/**
	 * @return the rapro1
	 */
	public String getRapro1() {
		return rapro1;
	}
	/**
	 * @param rapro1 the rapro1 to set
	 */
	public void setRapro1(String rapro1) {
		this.rapro1 = rapro1;
	}
	/**
	 * @return the rapro2
	 */
	public String getRapro2() {
		return rapro2;
	}
	/**
	 * @param rapro2 the rapro2 to set
	 */
	public void setRapro2(String rapro2) {
		this.rapro2 = rapro2;
	}
	/**
	 * @return the rapro3
	 */
	public String getRapro3() {
		return rapro3;
	}
	/**
	 * @param rapro3 the rapro3 to set
	 */
	public void setRapro3(String rapro3) {
		this.rapro3 = rapro3;
	}
	/**
	 * @return the rapro4
	 */
	public String getRapro4() {
		return rapro4;
	}
	/**
	 * @param rapro4 the rapro4 to set
	 */
	public void setRapro4(String rapro4) {
		this.rapro4 = rapro4;
	}
	public String getApro1() {
		return apro1;
	}
	public void setApro1(String apro1) {
		this.apro1 = apro1;
	}
	public String getApro2() {
		return apro2;
	}
	public void setApro2(String apro2) {
		this.apro2 = apro2;
	}
	public String getApro3() {
		return apro3;
	}
	public void setApro3(String apro3) {
		this.apro3 = apro3;
	}
	public String getApro4() {
		return apro4;
	}
	public void setApro4(String apro4) {
		this.apro4 = apro4;
	}
	public HojaRumbo(String apro1, String apro2,
			String apro3, String apro4, String mes, String usuario) {
		super();
		this.apro1 = apro1;
		this.apro2 = apro2;
		this.apro3 = apro3;
		this.apro4 = apro4;
		this.mes = mes;
		this.usuario = usuario;
		
	}
	public HojaRumbo(String usuario, String mes, String aprobadores) {
		super();
		this.usuario = usuario;
		this.mes = mes;
		this.aprobadores = aprobadores;
	}
	public HojaRumbo(String aprobados, String resultado, String solicitud,
			String liberacion, String estatus,
			String mes, String usuario) {
		super();
		this.aprobados = aprobados;
		this.resultado = resultado;
		this.solicitud = solicitud;
		this.liberacion = liberacion;
		this.estatus = estatus;
		this.mes = mes;
		this.usuario = usuario;
	}
	public HojaRumbo() {
		super();
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public String getSolicitud() {
		return solicitud;
	}
	public void setSolicitud(String solicitud) {
		this.solicitud = solicitud;
	}
	public String getLiberacion() {
		return liberacion;
	}
	public void setLiberacion(String liberacion) {
		this.liberacion = liberacion;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public String getAprobadores() {
		return aprobadores;
	}
	public void setAprobadores(String aprobadores) {
		this.aprobadores = aprobadores;
	}
	public String getAprobados() {
		return aprobados;
	}
	public void setAprobados(String aprobados) {
		this.aprobados = aprobados;
	}
	
	
	public HojaRumbo(String usuario, String solicitud, String mes,String resultado) {
		  super();
		  this.usuario = usuario;
		  this.solicitud = solicitud;
		  this.mes = mes;
		  this.resultado = resultado;
		  
		 }
	
	
	
}
