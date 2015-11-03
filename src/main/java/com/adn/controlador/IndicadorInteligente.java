package com.adn.controlador;

public class IndicadorInteligente {
	//Tabla IndInte
	private String anio;
	private String estatus;
	private String frecuencia;
	private int idIndicador;
	private String nombre;
	private int idIndInte;
	private String mes;
	private String meta;
	private String peso;
	private String progQuin1;
	private String progQuin2;
	private String progSem1;
	private String progSem2;
	private String progSem3;
	private String progSem4;
	private String progSem5;
	private String rpond;
	private String resulQuin1;
	private String resulQuin2;
	private String resulSem1;
	private String resulSem2;
	private String resulSem3;
	private String resulSem4;
	private String resulSem5; 
	private String resultado;
	private String sentido;
	private String tipo;
	private String usuario;
	private String unidad;
	private String resEne;
	private String resFeb;
	private String resMar;
	private String resAbr;
	private String resMay;
	private String resJun;
	private String resJul;
	private String resAgo;
	private String resSep;
	private String resOct;
	private String resNov;
	private String resDic;
	private String metaEne;
	private String metaFeb;
	private String metaMar;
	private String metaAbr;
	private String metaMay;
	private String metaJun;
	private String metaJul;
	private String metaAgo;
	private String metaSep;
	private String metaOct;
	private String metaNov;
	private String metaDic;
	
	public IndicadorInteligente(String anio, String estatus, String frecuencia,
			int idIndicador, int idIndInte, String mes, String meta,
			String peso, String progQuin1, String progQuin2, String progSem1,
			String progSem2, String progSem3, String progSem4, String progSem5,
			String rpond, String resulQuin1, String resulQuin2,
			String resulSem1, String resulSem2, String resulSem3,
			String resulSem4, String resulSem5, String resultado,
			String sentido, String tipo, String usuario) {
		super();
		this.anio = anio;
		this.estatus = estatus;
		this.frecuencia = frecuencia;
		this.idIndicador = idIndicador;
		this.idIndInte = idIndInte;
		this.mes = mes;
		this.meta = meta;
		this.peso = peso;
		this.progQuin1 = progQuin1;
		this.progQuin2 = progQuin2;
		this.progSem1 = progSem1;
		this.progSem2 = progSem2;
		this.progSem3 = progSem3;
		this.progSem4 = progSem4;
		this.progSem5 = progSem5;
		this.rpond = rpond;
		this.resulQuin1 = resulQuin1;
		this.resulQuin2 = resulQuin2;
		this.resulSem1 = resulSem1;
		this.resulSem2 = resulSem2;
		this.resulSem3 = resulSem3;
		this.resulSem4 = resulSem4;
		this.resulSem5 = resulSem5;
		this.resultado = resultado;
		this.sentido = sentido;
		this.tipo = tipo;
		this.usuario = usuario;
	}
	
	
	public IndicadorInteligente() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public String getFrecuencia() {
		return frecuencia;
	}
	public void setFrecuencia(String frecuencia) {
		this.frecuencia = frecuencia;
	}
	public int getIdIndicador() {
		return idIndicador;
	}
	public void setIdIndicador(int idIndicador) {
		this.idIndicador = idIndicador;
	}
	public int getIdIndInte() {
		return idIndInte;
	}
	public void setIdIndInte(int idIndInte) {
		this.idIndInte = idIndInte;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public String getMeta() {
		return meta;
	}
	public void setMeta(String meta) {
		this.meta = meta;
	}
	public String getPeso() {
		return peso;
	}
	public void setPeso(String peso) {
		this.peso = peso;
	}
	public String getProgQuin1() {
		return progQuin1;
	}
	public void setProgQuin1(String progQuin1) {
		this.progQuin1 = progQuin1;
	}
	public String getProgQuin2() {
		return progQuin2;
	}
	public void setProgQuin2(String progQuin2) {
		this.progQuin2 = progQuin2;
	}
	public String getProgSem1() {
		return progSem1;
	}
	public void setProgSem1(String progSem1) {
		this.progSem1 = progSem1;
	}
	public String getProgSem2() {
		return progSem2;
	}
	public void setProgSem2(String progSem2) {
		this.progSem2 = progSem2;
	}
	public String getProgSem3() {
		return progSem3;
	}
	public void setProgSem3(String progSem3) {
		this.progSem3 = progSem3;
	}
	public String getProgSem4() {
		return progSem4;
	}
	public void setProgSem4(String progSem4) {
		this.progSem4 = progSem4;
	}
	public String getProgSem5() {
		return progSem5;
	}
	public void setProgSem5(String progSem5) {
		this.progSem5 = progSem5;
	}
	public String getRpond() {
		return rpond;
	}
	public void setRpond(String rpond) {
		this.rpond = rpond;
	}
	public String getResulQuin1() {
		return resulQuin1;
	}
	public void setResulQuin1(String resulQuin1) {
		this.resulQuin1 = resulQuin1;
	}
	public String getResulQuin2() {
		return resulQuin2;
	}
	public void setResulQuin2(String resulQuin2) {
		this.resulQuin2 = resulQuin2;
	}
	public String getResulSem1() {
		return resulSem1;
	}
	public void setResulSem1(String resulSem1) {
		this.resulSem1 = resulSem1;
	}
	public String getResulSem2() {
		return resulSem2;
	}
	public void setResulSem2(String resulSem2) {
		this.resulSem2 = resulSem2;
	}
	public String getResulSem3() {
		return resulSem3;
	}
	public void setResulSem3(String resulSem3) {
		this.resulSem3 = resulSem3;
	}
	public String getResulSem4() {
		return resulSem4;
	}
	public void setResulSem4(String resulSem4) {
		this.resulSem4 = resulSem4;
	}
	public String getResulSem5() {
		return resulSem5;
	}
	public void setResulSem5(String resulSem5) {
		this.resulSem5 = resulSem5;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	public String getSentido() {
		return sentido;
	}
	public void setSentido(String sentido) {
		this.sentido = sentido;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getUnidad() {
		return unidad;
	}


	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}


	public String getResEne() {
		return resEne;
	}


	public void setResEne(String resEne) {
		this.resEne = resEne;
	}


	public String getResFeb() {
		return resFeb;
	}


	public void setResFeb(String resFeb) {
		this.resFeb = resFeb;
	}


	public String getResMar() {
		return resMar;
	}


	public void setResMar(String resMar) {
		this.resMar = resMar;
	}


	public String getResAbr() {
		return resAbr;
	}


	public void setResAbr(String resAbr) {
		this.resAbr = resAbr;
	}


	public String getResMay() {
		return resMay;
	}


	public void setResMay(String resMay) {
		this.resMay = resMay;
	}


	public String getResJun() {
		return resJun;
	}


	public void setResJun(String resJun) {
		this.resJun = resJun;
	}


	public String getResJul() {
		return resJul;
	}


	public void setResJul(String resJul) {
		this.resJul = resJul;
	}


	public String getResAgo() {
		return resAgo;
	}


	public void setResAgo(String resAgo) {
		this.resAgo = resAgo;
	}


	public String getResSep() {
		return resSep;
	}


	public void setResSep(String resSep) {
		this.resSep = resSep;
	}


	public String getResOct() {
		return resOct;
	}


	public void setResOct(String resOct) {
		this.resOct = resOct;
	}


	public String getResNov() {
		return resNov;
	}


	public void setResNov(String resNov) {
		this.resNov = resNov;
	}


	public String getResDic() {
		return resDic;
	}


	public void setResDic(String resDic) {
		this.resDic = resDic;
	}


	public String getMetaEne() {
		return metaEne;
	}


	public void setMetaEne(String metaEne) {
		this.metaEne = metaEne;
	}


	public String getMetaFeb() {
		return metaFeb;
	}


	public void setMetaFeb(String metaFeb) {
		this.metaFeb = metaFeb;
	}


	public String getMetaMar() {
		return metaMar;
	}


	public void setMetaMar(String metaMar) {
		this.metaMar = metaMar;
	}


	public String getMetaAbr() {
		return metaAbr;
	}


	public void setMetaAbr(String metaAbr) {
		this.metaAbr = metaAbr;
	}


	public String getMetaMay() {
		return metaMay;
	}


	public void setMetaMay(String metaMay) {
		this.metaMay = metaMay;
	}


	public String getMetaJun() {
		return metaJun;
	}


	public void setMetaJun(String metaJun) {
		this.metaJun = metaJun;
	}


	public String getMetaJul() {
		return metaJul;
	}


	public void setMetaJul(String metaJul) {
		this.metaJul = metaJul;
	}


	public String getMetaAgo() {
		return metaAgo;
	}


	public void setMetaAgo(String metaAgo) {
		this.metaAgo = metaAgo;
	}


	public String getMetaSep() {
		return metaSep;
	}


	public void setMetaSep(String metaSep) {
		this.metaSep = metaSep;
	}


	public String getMetaOct() {
		return metaOct;
	}


	public void setMetaOct(String metaOct) {
		this.metaOct = metaOct;
	}


	public String getMetaNov() {
		return metaNov;
	}


	public void setMetaNov(String metaNov) {
		this.metaNov = metaNov;
	}


	public String getMetaDic() {
		return metaDic;
	}


	public void setMetaDic(String metaDic) {
		this.metaDic = metaDic;
	}
	
	

	
}
