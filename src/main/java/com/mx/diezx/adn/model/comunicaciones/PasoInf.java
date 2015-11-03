package com.mx.diezx.adn.model.comunicaciones;
import com.mx.diezx.adn.model.Usuario;

	public class PasoInf {
		
		private Usuario usuario;
		private int year;
		private int id_departamento;
		private int area;
		private int idIndicador;
		
		public int getArea() {
			return area;
		}

		public void setArea(int area) {
			this.area = area;
		}

		public int getId_departamento() {
			return id_departamento;
		}

		public void setId_departamento(int id_departamento) {
			this.id_departamento = id_departamento;
		}

		public PasoInf() {
			super();
			this.usuario = new Usuario();
		}
		
		public Usuario getUsuario() {
			return usuario;
		}
		public void setUsuario(Usuario usuario) {
			this.usuario = usuario;
		}
		public int getYear() {
			return year;
		}
		public void setYear(int year) {
			this.year = year;
		}

		public int getIdIndicador() {
			return idIndicador;
		}

		public void setIdIndicador(int idIndicador) {
			this.idIndicador = idIndicador;
		}	
	}
