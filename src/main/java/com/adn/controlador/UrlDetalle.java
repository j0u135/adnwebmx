/**
 * 
 */
package com.adn.controlador;

/**
 * @author TOSHIBA
 *
 */
public class UrlDetalle {

	private int idURLdetalle;
	private int idPrioridad;
	private String nbURL;
	private String url;
	private String estatus;
	/**
	 * 
	 */
	public UrlDetalle() {
		// TODO Auto-generated constructor stub
	}
	public int getIdURLdetalle() {
		return idURLdetalle;
	}
	public void setIdURLdetalle(int idURLdetalle) {
		this.idURLdetalle = idURLdetalle;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIdPrioridad() {
		return idPrioridad;
	}
	public void setIdPrioridad(int idPrioridad) {
		this.idPrioridad = idPrioridad;
	}
	public String getNbURL() {
		return nbURL;
	}
	public void setNbURL(String nbURL) {
		this.nbURL = nbURL;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

}
