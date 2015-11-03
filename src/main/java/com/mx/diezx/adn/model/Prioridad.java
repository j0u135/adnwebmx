package com.mx.diezx.adn.model;

import java.util.ArrayList;
import java.util.Date;

public class Prioridad {

	private int idPrioridades;
	private int idIndicador;
	private String Nombre;
	private String fhInicio_s;
	private String fhFin_s;
	private Date fhInicio;
	private Date fhFin;
	private ArrayList<Mes> meses;
	private float ultimoMesPlaneado;
	private float ultimoMesReal;

	public float getUltimoMesPlaneado() {
		return ultimoMesPlaneado;
	}

	public void setUltimoMesPlaneado(float ultimoMesPlaneado) {
		this.ultimoMesPlaneado = ultimoMesPlaneado;
	}

	public float getUltimoMesReal() {
		return ultimoMesReal;
	}

	public void setUltimoMesReal(float ultimoMesReal) {
		this.ultimoMesReal = ultimoMesReal;
	}

	public Prioridad() {
		super();
		this.meses = new ArrayList<Mes>();
	}

	public int getIdPrioridades() {
		return idPrioridades;
	}

	public void setIdPrioridades(int idPrioridades) {
		this.idPrioridades = idPrioridades;
	}

	public int getIdIndicador() {
		return idIndicador;
	}

	public void setIdIndicador(int idIndicador) {
		this.idIndicador = idIndicador;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getFhInicio_s() {
		return fhInicio_s;
	}

	public void setFhInicio_s(String fhInicio_s) {
		this.fhInicio_s = fhInicio_s;
	}

	public String getFhFin_s() {
		return fhFin_s;
	}

	public void setFhFin_s(String fhFin_s) {
		this.fhFin_s = fhFin_s;
	}

	public Date getFhInicio() {
		return fhInicio;
	}

	public void setFhInicio(Date fhInicio) {
		this.fhInicio = fhInicio;
	}

	public Date getFhFin() {
		return fhFin;
	}

	public void setFhFin(Date fhFin) {
		this.fhFin = fhFin;
	}

	public ArrayList<Mes> getMeses() {
		return meses;
	}
	
	public void calculaUltimoMes(){
		int ultimo = -1;
		float planeado = 0;
		float real = 0;
		for (int i = 0; i < this.meses.size(); i++){
			if ((this.meses.get(i).getAvanceProgramdo()) != 0 || this.meses.get(i).getAvanceReal() != 0){
				if(ultimo < this.meses.get(i).getMes_numerico()){
					ultimo = this.meses.get(i).getMes_numerico();
					planeado = this.meses.get(i).getAvanceProgramdo();
					real = this.meses.get(i).getAvanceReal();
				}
			}
		}
		this.setUltimoMesPlaneado(planeado);
		this.setUltimoMesReal(real);
	}
		
	public void setMesEnMeses(int idPrioridadesMes, String estatus, int anio, String mes,
			int mes_numerico, float avance_programado, float avance_real){
			Mes obj_mes = new Mes(mes_numerico, mes, mes_numerico, mes, mes_numerico, avance_programado, avance_real);
			this.meses.add(obj_mes);
	}


	public class Mes{
		
		public Mes(	int idPrioridadesMes, String estatus, int anio, String mes,
					int mes_numerico, float avance_programado, float avance_real){
			this.setIdPrioridadesMes(idPrioridadesMes);
			this.setEstatus(estatus);
			this.setAnio(anio);
			this.setMes(mes);
			this.setMes_numerico(mes_numerico);
			this.setAvanceProgramdo(avance_programado);
			this.setAvanceReal(avance_real);
		}
		
		public int getIdPrioridadesMes() {
			return idPrioridadesMes;
		}
		public void setIdPrioridadesMes(int idPrioridadesMes) {
			this.idPrioridadesMes = idPrioridadesMes;
		}
		public String getEstatus() {
			return estatus;
		}
		public void setEstatus(String estatus) {
			this.estatus = estatus;
		}
		public int getAnio() {
			return anio;
		}
		public void setAnio(int anio) {
			this.anio = anio;
		}
		public String getMes() {
			return mes;
		}
		public void setMes(String mes) {
			this.mes = mes;
		}
		public int getMes_numerico() {
			return mes_numerico;
		}
		public void setMes_numerico(int mes_numerico) {
			this.mes_numerico = mes_numerico;
		}
		public float getAvanceProgramdo() {
			return avance_programdo;
		}
		public void setAvanceProgramdo(float avance_programdo) {
			this.avance_programdo = avance_programdo;
		}
		public float getAvanceReal() {
			return avance_real;
		}
		public void setAvanceReal(float avance_real) {
			this.avance_real = avance_real;
		}
		private int idPrioridadesMes;
		private String estatus;
		private int anio;
		private String mes;
		private int mes_numerico;
		private float avance_programdo;
		private float avance_real;
	}

}
