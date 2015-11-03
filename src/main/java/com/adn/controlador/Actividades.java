package com.adn.controlador;

public class Actividades {

	private String id;
	private String nombre;
	private String fecha;
	private String peso;
	private String pe;
	private String re;
	private String pf;
	private String rf;
	private String map;
	private String mar;
	private String ap;
	private String ar;
	private String myp;
	private String myr;
	private String jnp;
	private String jnr;
	private String jlp;
	private String jlr;
	private String agp;
	private String agr;
	private String sp;
	private String sr;
	private String op;
	private String or;
	private String np;
	private String nr;
	private String dp;
	private String dr;
	private String lpe;
	private String lre;
	private String lpf;
	private String lrf;
	private String lmap;
	private String lmar;
	private String lap;
	private String lar;
	private String lmyp;
	private String lmyr;
	private String ljnp;
	private String ljnr;
	private String ljlp;
	private String ljlr;
	private String lagp;
	private String lagr;
	private String lsp;
	private String lsr;
	private String lop;
	private String lor;
	private String lnp;
	private String lnr;
	private String ldp;
	private String ldr;
	private String usuario;
	private String proyecto;
	private String nombre1;
	private String unidad;
	private String fecha1;
	private String inicial;
	private String programado;
	private String real;
	private String peso1;

	public String getLpe() {
		return lpe;
	}

	public void setLpe(String lpe) {
		this.lpe = lpe;
	}

	public String getLre() {
		return lre;
	}

	public void setLre(String lre) {
		this.lre = lre;
	}

	public String getLpf() {
		return lpf;
	}

	public void setLpf(String lpf) {
		this.lpf = lpf;
	}

	public String getLrf() {
		return lrf;
	}

	public void setLrf(String lrf) {
		this.lrf = lrf;
	}

	public String getLmap() {
		return lmap;
	}

	public void setLmap(String lmap) {
		this.lmap = lmap;
	}

	public String getLmar() {
		return lmar;
	}

	public void setLmar(String lmar) {
		this.lmar = lmar;
	}

	public String getLap() {
		return lap;
	}

	public void setLap(String lap) {
		this.lap = lap;
	}

	public String getLar() {
		return lar;
	}

	public void setLar(String lar) {
		this.lar = lar;
	}

	public String getLmyp() {
		return lmyp;
	}

	public void setLmyp(String lmyp) {
		this.lmyp = lmyp;
	}

	public String getLmyr() {
		return lmyr;
	}

	public void setLmyr(String lmyr) {
		this.lmyr = lmyr;
	}

	public String getLjnp() {
		return ljnp;
	}

	public void setLjnp(String ljnp) {
		this.ljnp = ljnp;
	}

	public String getLjnr() {
		return ljnr;
	}

	public void setLjnr(String ljnr) {
		this.ljnr = ljnr;
	}

	public String getLjlp() {
		return ljlp;
	}

	public void setLjlp(String ljlp) {
		this.ljlp = ljlp;
	}

	public String getLjlr() {
		return ljlr;
	}

	public void setLjlr(String ljlr) {
		this.ljlr = ljlr;
	}

	public String getLagp() {
		return lagp;
	}

	public void setLagp(String lagp) {
		this.lagp = lagp;
	}

	public String getLagr() {
		return lagr;
	}

	public void setLagr(String lagr) {
		this.lagr = lagr;
	}

	public String getLsp() {
		return lsp;
	}

	public void setLsp(String lsp) {
		this.lsp = lsp;
	}

	public String getLsr() {
		return lsr;
	}

	public void setLsr(String lsr) {
		this.lsr = lsr;
	}

	public String getLop() {
		return lop;
	}

	public void setLop(String lop) {
		this.lop = lop;
	}

	public String getLor() {
		return lor;
	}

	public void setLor(String lor) {
		this.lor = lor;
	}

	public String getLnp() {
		return lnp;
	}

	public void setLnp(String lnp) {
		this.lnp = lnp;
	}

	public String getLnr() {
		return lnr;
	}

	public void setLnr(String lnr) {
		this.lnr = lnr;
	}

	public String getLdp() {
		return ldp;
	}

	public void setLdp(String ldp) {
		this.ldp = ldp;
	}

	public String getLdr() {
		return ldr;
	}

	public void setLdr(String ldr) {
		this.ldr = ldr;
	}

	public String getNombre1() {
		return nombre1;
	}

	public void setNombre1(String nombre1) {
		this.nombre1 = nombre1;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public String getFecha1() {
		return fecha1;
	}

	public void setFecha1(String fecha1) {
		this.fecha1 = fecha1;
	}

	public String getInicial() {
		return inicial;
	}

	public void setInicial(String inicial) {
		this.inicial = inicial;
	}

	public String getProgramado() {
		return programado;
	}

	public void setProgramado(String programado) {
		this.programado = programado;
	}

	public String getReal() {
		return real;
	}

	public void setReal(String real) {
		this.real = real;
	}

	public String getPeso1() {
		return peso1;
	}

	public void setPeso1(String peso1) {
		this.peso1 = peso1;
	}
	
	public Actividades(String usuario, String nombre1, String unidad,
			String fecha1, String inicial, String programado, String real,
			String peso1) {
		super();
		this.usuario = usuario;
		this.nombre1 = nombre1;
		this.unidad = unidad;
		this.fecha1 = fecha1;
		this.inicial = inicial;
		this.programado = programado;
		this.real = real;
		this.peso1 = peso1;
	}

	public Actividades(String nombre, String fecha, String peso, String pe,
			String re, String pf, String rf, String map, String mar, String ap,
			String ar, String myp, String myr, String jnp, String jnr,
			String jlp, String jlr, String agp, String agr, String sp,
			String sr, String op, String or, String np, String nr, String dp,
			String dr, String usuario, String proyecto) {
		super();
		this.nombre = nombre;
		this.fecha = fecha;
		this.peso = peso;
		this.pe = pe;
		this.re = re;
		this.pf = pf;
		this.rf = rf;
		this.map = map;
		this.mar = mar;
		this.ap = ap;
		this.ar = ar;
		this.myp = myp;
		this.myr = myr;
		this.jnp = jnp;
		this.jnr = jnr;
		this.jlp = jlp;
		this.jlr = jlr;
		this.agp = agp;
		this.agr = agr;
		this.sp = sp;
		this.sr = sr;
		this.op = op;
		this.or = or;
		this.np = np;
		this.nr = nr;
		this.dp = dp;
		this.dr = dr;
		this.proyecto = proyecto;
		this.usuario = usuario;
	}

	public Actividades() {
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getPe() {
		return pe;
	}

	public void setPe(String pe) {
		this.pe = pe;
	}

	public String getRe() {
		return re;
	}

	public void setRe(String re) {
		this.re = re;
	}

	public String getPf() {
		return pf;
	}

	public void setPf(String pf) {
		this.pf = pf;
	}

	public String getRf() {
		return rf;
	}

	public void setRf(String rf) {
		this.rf = rf;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public String getMar() {
		return mar;
	}

	public void setMar(String mar) {
		this.mar = mar;
	}

	public String getAp() {
		return ap;
	}

	public void setAp(String ap) {
		this.ap = ap;
	}

	public String getAr() {
		return ar;
	}

	public void setAr(String ar) {
		this.ar = ar;
	}

	public String getMyp() {
		return myp;
	}

	public void setMyp(String myp) {
		this.myp = myp;
	}

	public String getMyr() {
		return myr;
	}

	public void setMyr(String myr) {
		this.myr = myr;
	}

	public String getJnp() {
		return jnp;
	}

	public void setJnp(String jnp) {
		this.jnp = jnp;
	}

	public String getJnr() {
		return jnr;
	}

	public void setJnr(String jnr) {
		this.jnr = jnr;
	}

	public String getJlp() {
		return jlp;
	}

	public void setJlp(String jlp) {
		this.jlp = jlp;
	}

	public String getJlr() {
		return jlr;
	}

	public void setJlr(String jlr) {
		this.jlr = jlr;
	}

	public String getAgp() {
		return agp;
	}

	public void setAgp(String agp) {
		this.agp = agp;
	}

	public String getAgr() {
		return agr;
	}

	public void setAgr(String agr) {
		this.agr = agr;
	}

	public String getSp() {
		return sp;
	}

	public void setSp(String sp) {
		this.sp = sp;
	}

	public String getSr() {
		return sr;
	}

	public void setSr(String sr) {
		this.sr = sr;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getOr() {
		return or;
	}

	public void setOr(String or) {
		this.or = or;
	}

	public String getNp() {
		return np;
	}

	public void setNp(String np) {
		this.np = np;
	}

	public String getNr() {
		return nr;
	}

	public void setNr(String nr) {
		this.nr = nr;
	}

	public String getDp() {
		return dp;
	}

	public void setDp(String dp) {
		this.dp = dp;
	}

	public String getDr() {
		return dr;
	}

	public void setDr(String dr) {
		this.dr = dr;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getProyecto() {
		return proyecto;
	}

	public void setProyecto(String proyecto) {
		this.proyecto = proyecto;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Actividades(String id) {
		super();
		this.id = id;
	}
	
	public Actividades(String nombre, String usuario, String proyecto) {
		super();
		this.nombre = nombre;
		this.usuario = usuario;
		this.proyecto = proyecto;
	}
	
	
	public Actividades(String nombre, String fecha, String peso, String pe,
			String re, String pf, String rf, String map, String mar, String ap,
			String ar, String myp, String myr, String jnp, String jnr,
			String jlp, String jlr, String agp, String agr, String sp,
			String sr, String op, String or, String np, String nr, String dp,
			String dr) {
		super();
		this.nombre = nombre;
		this.fecha = fecha;
		this.peso = peso;
		this.pe = pe;
		this.re = re;
		this.pf = pf;
		this.rf = rf;
		this.map = map;
		this.mar = mar;
		this.ap = ap;
		this.ar = ar;
		this.myp = myp;
		this.myr = myr;
		this.jnp = jnp;
		this.jnr = jnr;
		this.jlp = jlp;
		this.jlr = jlr;
		this.agp = agp;
		this.agr = agr;
		this.sp = sp;
		this.sr = sr;
		this.op = op;
		this.or = or;
		this.np = np;
		this.nr = nr;
		this.dp = dp;
		this.dr = dr;
	}
	
	public Actividades(String id, String nombre, String fecha, String peso,
			String pe, String re, String pf, String rf, String map, String mar,
			String ap, String ar, String myp, String myr, String jnp,
			String jnr, String jlp, String jlr, String agp, String agr,
			String sp, String sr, String op, String or, String np, String nr,
			String dp, String dr, String usuario, String proyecto,
			String nombre1, String unidad, String fecha1, String inicial,
			String programado, String real, String peso1) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.fecha = fecha;
		this.peso = peso;
		this.pe = pe;
		this.re = re;
		this.pf = pf;
		this.rf = rf;
		this.map = map;
		this.mar = mar;
		this.ap = ap;
		this.ar = ar;
		this.myp = myp;
		this.myr = myr;
		this.jnp = jnp;
		this.jnr = jnr;
		this.jlp = jlp;
		this.jlr = jlr;
		this.agp = agp;
		this.agr = agr;
		this.sp = sp;
		this.sr = sr;
		this.op = op;
		this.or = or;
		this.np = np;
		this.nr = nr;
		this.dp = dp;
		this.dr = dr;
		this.usuario = usuario;
		this.proyecto = proyecto;
		this.nombre1 = nombre1;
		this.unidad = unidad;
		this.fecha1 = fecha1;
		this.inicial = inicial;
		this.programado = programado;
		this.real = real;
		this.peso1 = peso1;
	}

}
