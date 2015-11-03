package com.adn.controlador;

public class Tareas {

	private String usuario;
	private String nombre;
	private String tipo;
	private String origen;
	private String prioridad;
	private String periodoi;
	private String periodof;
	private String asignar;
	private String notas;
	private String id;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getOrigen() {
		return origen;
	}

	public void setOrigen(String origen) {
		this.origen = origen;
	}

	public String getPrioridad() {
		return prioridad;
	}

	public void setPrioridad(String prioridad) {
		this.prioridad = prioridad;
	}

	public String getPeriodoi() {
		return periodoi;
	}

	public void setPeriodoi(String periodoi) {
		this.periodoi = periodoi;
	}

	public String getPeriodof() {
		return periodof;
	}

	public void setPeriodof(String periodof) {
		this.periodof = periodof;
	}

	public String getAsignar() {
		return asignar;
	}

	public void setAsignar(String asignar) {
		this.asignar = asignar;
	}

	public String getNotas() {
		return notas;
	}

	public void setNotas(String notas) {
		this.notas = notas;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public Tareas(String nombre, String tipo, String origen, String prioridad,
			String periodoi, String periodof, String usuario, String asignar, String notas) {
		super();
		this.nombre = nombre;
		this.tipo = tipo;
		this.origen = origen;
		this.prioridad = prioridad;
		this.periodoi = periodoi;
		this.periodof = periodof;
		this.usuario = usuario;
		this.asignar = asignar;
		this.notas = notas;
	}

	public Tareas(String nombre, String tipo, String origen,
			String prioridad, String periodoi, String periodof, String asignar,
			String notas, String id, String usuario) {
		super();
		this.nombre = nombre;
		this.tipo = tipo;
		this.origen = origen;
		this.prioridad = prioridad;
		this.periodoi = periodoi;
		this.periodof = periodof;
		this.asignar = asignar;
		this.notas = notas;
		this.id = id;
		this.usuario = usuario;
	}

	public Tareas(String id) {
		super();
		this.id = id;
	}
	
	

}
