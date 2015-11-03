package com.adn.controlador;

public class Usuario {
	 
	 private String username;
	 private String password;
	 private String dashboard;
	 private String correo;
	 private String area;
	 private String jefeDirecto;
	 private String nombre;
	 private String personalCargo;
	 private String puesto;
	 private String tipoUsuario;
	 private String visitas;
	 private String autorizador;
	 private int idUsuario;
	 




	public int getIdUsuario() {
		return idUsuario;
	}



	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}



	public String getAutorizador() {
		return autorizador;
	}



	public void setAutorizador(String autorizador) {
		this.autorizador = autorizador;
	}



	/**
	 * @return the visitas
	 */
	public String getVisitas() {
		return visitas;
	}



	/**
	 * @param visitas the visitas to set
	 */
	public void setVisitas(String visitas) {
		this.visitas = visitas;
	}



	public String getCorreo() {
			return correo;
		}



		public void setCorreo(String correo) {
			this.correo = correo;
		}



		public String getArea() {
			return area;
		}



		public void setArea(String area) {
			this.area = area;
		}



		public String getJefeDirecto() {
			return jefeDirecto;
		}



		public void setJefeDirecto(String jefeDirecto) {
			this.jefeDirecto = jefeDirecto;
		}



		public String getNombre() {
			return nombre;
		}



		public void setNombre(String nombre) {
			this.nombre = nombre;
		}



		public String getPersonalCargo() {
			return personalCargo;
		}



		public void setPersonalCargo(String personalCargo) {
			this.personalCargo = personalCargo;
		}



		public String getPuesto() {
			return puesto;
		}



		public void setPuesto(String puesto) {
			this.puesto = puesto;
		}



		public String getTipoUsuario() {
			return tipoUsuario;
		}



		public void setTipoUsuario(String tipoUsuario) {
			this.tipoUsuario = tipoUsuario;
		}

	 
		 public String getDashboard() {
			return dashboard;
		}
	
	
	
		public void setDashboard(String dashboard) {
			this.dashboard = dashboard;
		}
	
		
		 
		 public String getUsername() {
			return username;
		}
	
	
	
		public void setUsername(String username) {
			this.username = username;
		}
	
	
	
		public String getPassword() {
			return password;
		}
	
	
	
		public void setPassword(String password) {
			this.password = password;
		}

		public Usuario() {
		}
		
	 public Usuario(String username) {
		  super();
		  this.username = username;
		
		  
		 }	
		
	 public Usuario(String username, String password) {
	  super();
	  this.username = username;
	  this.password = password;
	  
	 }
	 
	 public Usuario(String username, String password, String dashboard, String correo, String area, String jefeDirecto, String nombre, String personalCargo, String puesto, String tipoUsuario ) {
		  super();
		  this.username = username;
		  this.password = password;
		  this.dashboard=dashboard;
		  this.correo=correo;
		  this.area=area;
		  this.jefeDirecto=jefeDirecto;
		  this.nombre=nombre;
		  this.personalCargo=personalCargo;
		  this.puesto=puesto;
		  this.tipoUsuario=tipoUsuario;
		 
		  
		 }

public Usuario(String username, String password, String dashboard, String correo, String area, String jefeDirecto, String nombre, String puesto, String tipoUsuario ) {
	  super();
	  this.username = username;
	  this.password = password;
	  this.dashboard=dashboard;
	  this.correo=correo;
	  this.area=area;
	  this.jefeDirecto=jefeDirecto;
	  this.nombre=nombre;
	  this.puesto=puesto;
	  this.tipoUsuario=tipoUsuario;
	 
	  
	 }
}

