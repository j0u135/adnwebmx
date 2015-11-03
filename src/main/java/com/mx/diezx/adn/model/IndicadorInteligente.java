package com.mx.diezx.adn.model;

import java.util.ArrayList;

public class IndicadorInteligente {

	public IndicadorInteligente() {
		super();
		this.meses = new ArrayList<Mes>();
	}

	private String mes;
	private float resultado;
	private String estatus;
	private String usuario;
	private int anio;
	private String nb_indicador;
	private ArrayList<Mes> meses;
	private int idIndicador;
	private String unidad_medida;	
	
	public void setMesenMeses(int mes, float resultado, int idIndInte){
		Mes mes_obj = new Mes(mes, resultado, idIndInte);
		boolean mes_existente = false;
		int meses_size = this.meses.size();
		
		for(int i = 0; meses_size < 0 ; i++){
			if(meses.get(i).getMes() == mes){
				float resultado_parcial = meses.get(i).getResultado();
				meses.get(i).setResultado((resultado + resultado_parcial) / 2);
				mes_existente = true;
			}
		}
		if(!mes_existente){
			this.meses.add(mes_obj);
		}
	}
	
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public float getResultado() {
		return resultado;
	}
	public void setResultado(float resultado) {
		this.resultado = resultado;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public String getNb_indicador() {
		return nb_indicador;
	}
	public void setNb_indicador(String nb_indicador) {
		this.nb_indicador = nb_indicador;
	}

	public int getIdIndicador() {
		return idIndicador;
	}
	public void setIdIndicador(int idIndicador) {
		this.idIndicador = idIndicador;
	}

	public String getUnidad_medida() {
		return unidad_medida;
	}
	public void setUnidad_medida(String unidad_medida) {
		this.unidad_medida = unidad_medida;
	}

	public class Mes{
		
		private int mes;
		private float resultado;
		private int idIndInte;
		
		public Mes(int mes2, float resultado2, int idIndInte) {
			this.setMes(mes2);
			this.setResultado(resultado2);
			this.setIdIndInte(idIndInte);
		}

		public int getMes() {
			return mes;
		}
		public void setMes(int mes) {
			this.mes = mes;
		}
		public float getResultado() {
			return resultado;
		}
		public void setResultado(float resultado) {
			this.resultado = resultado;
		}
		public int getIdIndInte() {
			return idIndInte;
		}
		public void setIdIndInte(int idIndInte) {
			this.idIndInte = idIndInte;
		}
	}
	
}
