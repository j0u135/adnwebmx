package com.adn.controlador;

public class Empresa {

	int idEmpresa;
	String nbEmpresa;
	int numLicAdq;
	int numLicEnUso;
	String sistAlertas;
	String sistPenalizacion;
	String calendAproba;
	String versionADN;
	String fhVigInicio;
	String fhVigFin;
	String fhCreacion;
	String diasVigencia;
	String descEmpresa;
	String creadoPor;
	
	
	
	public Empresa() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Empresa(String nbEmpresa, int numLicAdq, int numLicEnUso,
			String sistAlertas, String sistPenalizacion, String calendAproba,
			String versionADN, String fhVigInicio, String fhVigFin,
			String fhCreacion, String diasVigencia, String descEmpresa,
			String creadoPor) {
		super();
		this.nbEmpresa = nbEmpresa;
		this.numLicAdq = numLicAdq;
		this.numLicEnUso = numLicEnUso;
		this.sistAlertas = sistAlertas;
		this.sistPenalizacion = sistPenalizacion;
		this.calendAproba = calendAproba;
		this.versionADN = versionADN;
		this.fhVigInicio = fhVigInicio;
		this.fhVigFin = fhVigFin;
		this.fhCreacion = fhCreacion;
		this.diasVigencia = diasVigencia;
		this.descEmpresa = descEmpresa;
		this.creadoPor = creadoPor;
	}
	public Empresa(int idEmpresa, String nbEmpresa, int numLicAdq,
			int numLicEnUso, String sistAlertas, String sistPenalizacion,
			String calendAproba, String versionADN, String fhVigInicio,
			String fhVigFin, String fhCreacion, String diasVigencia,
			String descEmpresa, String creadoPor) {
		super();
		this.idEmpresa = idEmpresa;
		this.nbEmpresa = nbEmpresa;
		this.numLicAdq = numLicAdq;
		this.numLicEnUso = numLicEnUso;
		this.sistAlertas = sistAlertas;
		this.sistPenalizacion = sistPenalizacion;
		this.calendAproba = calendAproba;
		this.versionADN = versionADN;
		this.fhVigInicio = fhVigInicio;
		this.fhVigFin = fhVigFin;
		this.fhCreacion = fhCreacion;
		this.diasVigencia = diasVigencia;
		this.descEmpresa = descEmpresa;
		this.creadoPor = creadoPor;
	}
	public int getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(int idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public String getNbEmpresa() {
		return nbEmpresa;
	}
	public void setNbEmpresa(String nbEmpresa) {
		this.nbEmpresa = nbEmpresa;
	}
	public int getNumLicAdq() {
		return numLicAdq;
	}
	public void setNumLicAdq(int numLicAdq) {
		this.numLicAdq = numLicAdq;
	}
	public int getNumLicEnUso() {
		return numLicEnUso;
	}
	public void setNumLicEnUso(int numLicEnUso) {
		this.numLicEnUso = numLicEnUso;
	}
	public String getSistAlertas() {
		return sistAlertas;
	}
	public void setSistAlertas(String sistAlertas) {
		this.sistAlertas = sistAlertas;
	}
	public String getSistPenalizacion() {
		return sistPenalizacion;
	}
	public void setSistPenalizacion(String sistPenalizacion) {
		this.sistPenalizacion = sistPenalizacion;
	}
	public String getCalendAproba() {
		return calendAproba;
	}
	public void setCalendAproba(String calendAproba) {
		this.calendAproba = calendAproba;
	}
	public String getVersionADN() {
		return versionADN;
	}
	public void setVersionADN(String versionADN) {
		this.versionADN = versionADN;
	}
	public String getFhVigInicio() {
		return fhVigInicio;
	}
	public void setFhVigInicio(String fhVigInicio) {
		this.fhVigInicio = fhVigInicio;
	}
	public String getFhVigFin() {
		return fhVigFin;
	}
	public void setFhVigFin(String fhVigFin) {
		this.fhVigFin = fhVigFin;
	}
	public String getFhCreacion() {
		return fhCreacion;
	}
	public void setFhCreacion(String fhCreacion) {
		this.fhCreacion = fhCreacion;
	}
	public String getDiasVigencia() {
		return diasVigencia;
	}
	public void setDiasVigencia(String diasVigencia) {
		this.diasVigencia = diasVigencia;
	}
	public String getDescEmpresa() {
		return descEmpresa;
	}
	public void setDescEmpresa(String descEmpresa) {
		this.descEmpresa = descEmpresa;
	}
	public String getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(String creadoPor) {
		this.creadoPor = creadoPor;
	}
	
	

}
