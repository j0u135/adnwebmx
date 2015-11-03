package com.mx.diezx.adn.model;

public class Usuario {

	private int idUsuario;
	private String Nombre;
	private String User;
	private int Puesto;
	private String nb_Puesto;
	private int tipo;
	private String tipo_desc;
	private int personal;
	private String area;
	private int departamento;
	
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombre() {
		return Nombre;
	}
	public String getUser() {
		return User;
	}
	public void setUser(String user) {
		User = user;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public int getPuesto() {
		return Puesto;
	}
	public void setPuesto(int puesto) {
		Puesto = puesto;
	}
	public String getNb_Puesto() {
		return nb_Puesto;
	}
	public void setNb_Puesto(String nb_Puesto) {
		this.nb_Puesto = nb_Puesto;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getTipo_desc() {
		return tipo_desc;
	}
	public void setTipo_desc(String tipo_desc) {
		this.tipo_desc = tipo_desc;
	}
	public int getPersonal() {
		return personal;
	}
	public void setPersonal(int personal) {
		this.personal = personal;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getDepartamento() {
		return departamento;
	}
	public void setDepartamento(int departamento) {
		this.departamento = departamento;
	}
	
}
