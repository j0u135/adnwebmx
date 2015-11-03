package com.mx.diezx.adn.model;

import java.util.ArrayList;

public class ReporteDepartamentosHojaRuta {
	
	private Departamento departamento;
	private float promedio_anual;
	private int meses_aprobados;
	private int meses_evaluados;
	private float porcentaje_aprobado;
	
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
	public float getPromedio_anual() {
		return promedio_anual;
	}
	public void setPromedio_anual(float promedio_anual) {
		this.promedio_anual = promedio_anual;
	}
	
	public void calculaPromedio(ArrayList<ReporteUsuariosHojaRuta> reportes_departamento) {
		float promedio = 0;
		
		if (reportes_departamento.size() > 0){
			int i = 0;
			for( i = 0; i < reportes_departamento.size(); i++){
				ReporteUsuariosHojaRuta reporte_usuario = reportes_departamento.get(i);
				promedio = promedio + reporte_usuario.getPromedio_anual();
			}
			promedio = promedio / (i);
		}
		this.setPromedio_anual(promedio);
	}
	
	public void calcularPorcentajeAprobados(ArrayList<ReporteUsuariosHojaRuta> reportes_departamento) {
		float sumatoria_porcentajes = 0;
		int sumatoria_meses_aprobados = 0;
		int sumatoria_meses_evaluados = 0;
		float porcentaje = 0;
		int size = reportes_departamento.size();
		
		if (size > 0){
			int i = 0;
			for( i = 0; i < size; i++){
				ReporteUsuariosHojaRuta reporte_usuario = reportes_departamento.get(i);
				sumatoria_porcentajes = sumatoria_porcentajes + reporte_usuario.getPorcentaje_aprobado();
				sumatoria_meses_aprobados = sumatoria_meses_aprobados + reporte_usuario.getMeses_aprobados();
				sumatoria_meses_evaluados = sumatoria_meses_evaluados + reporte_usuario.getMeses_evaluados();
			}
			porcentaje = ( sumatoria_porcentajes / size ) * 100;
		}
		this.setPorcentaje_aprobado(porcentaje);
		this.setMeses_aprobados(sumatoria_meses_aprobados);
		this.setMeses_evaluados(sumatoria_meses_evaluados);
	}
	public Departamento getDepartamento() {
		return departamento;
	}
	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

}
