package com.mx.diezx.adn.model;

import java.util.ArrayList;

public class ReporteUsuariosHojaRuta {
	
	Usuario usuario;
	float promedio_anual;
	int meses_aprobados;
	int meses_evaluados;
	float porcentaje_aprobado;
	
	public int getMeses_aprobados() {
		return meses_aprobados;
	}
	public void setMeses_aprobados(int meses_aprobados) {
		this.meses_aprobados = meses_aprobados;
	}
	public int getMeses_evaluados() {
		return meses_evaluados;
	}
	public void setMeses_evaluados(int meses_evaluados) {
		this.meses_evaluados = meses_evaluados;
	}
	public float getPorcentaje_aprobado() {
		return porcentaje_aprobado;
	}
	public void setPorcentaje_aprobado(float porcentaje_aprobado) {
		this.porcentaje_aprobado = porcentaje_aprobado;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public float getPromedio_anual() {
		return promedio_anual;
	}
	public void setPromedio_anual(float promedio_anual) {
		this.promedio_anual = promedio_anual;
	}
	
	public void calcularPromedioResultadoPorUsuarios(ArrayList<HojaRuta> lista_hojas) {
		float promedio = 0;
		
		if (lista_hojas.size() > 0){
			int i = 0;
			for( i = 0; i < lista_hojas.size(); i++){
				HojaRuta hoja = lista_hojas.get(i);
				promedio = promedio + hoja.getResultado();				
			}
			promedio = promedio / (i);
		}
		this.setPromedio_anual(promedio);
	}
	
	public void calcularPorcentajeAprobadosPorUsuarios(ArrayList<HojaRuta> lista_hojas) {
		int total_aprobaciones = 0;
		int aprobaciones_completadas = 0;
		float porcentaje = 0;
		
		if (lista_hojas.size() > 0){
			int i = 0;
			for( i = 0; i < lista_hojas.size(); i++){
				HojaRuta hoja = lista_hojas.get(i);
				System.out.println(hoja.getEstatus());
				if(!hoja.getEstatus().equals("Pendiente")){
					total_aprobaciones = total_aprobaciones + 1;
					if(!hoja.getEstatus().equals("Solicitada")){
						aprobaciones_completadas = aprobaciones_completadas + 1;
					}
				}
			}
			if( total_aprobaciones > 0){
				porcentaje = ( aprobaciones_completadas / total_aprobaciones ) * 100;
			}
		}
		this.setPorcentaje_aprobado(porcentaje);
		this.setMeses_aprobados(aprobaciones_completadas);
		this.setMeses_evaluados(total_aprobaciones);
	}
	
}
