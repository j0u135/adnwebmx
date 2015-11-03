package com.adn.controlador;

public class Comentarios {

	private String fecha;
	private String usuario;
	private String comentario;
	private String observador;
	private String idHojaRumbo;

	


	public String getIdHojaRumbo() {
		return idHojaRumbo;
	}

	public void setIdHojaRumbo(String idHojaRumbo) {
		this.idHojaRumbo = idHojaRumbo;
	}

	public String getObservador() {
		return observador;
	}

	public void setObservador(String observador) {
		this.observador = observador;
	}

	public Comentarios() {

	}

	public Comentarios(String usuario, String observador, String comentario, String fecha, String idHojaRumbo) {
		super();
		this.usuario = usuario;
		this.observador = observador;
		this.fecha = fecha;
		this.comentario = comentario;
		this.idHojaRumbo = idHojaRumbo;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}
