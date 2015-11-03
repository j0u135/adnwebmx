package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseActividad;
import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.conexion.ClaseUrlDetalle;
import com.adn.controlador.Actividad;
import com.adn.controlador.AvanceActividades;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;
import com.adn.controlador.PrioridadMes;
import com.adn.controlador.UrlDetalle;

/**
 * Servlet implementation class actualizaActividades
 */
@WebServlet("/actualizaActividades")
public class ActualizaActividades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizaActividades() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mes=request.getParameter("mesBarra");
		String clavePrio=request.getParameter("clavePrio");
		String usuario=request.getParameter("usuarioHR");
		String anio=request.getParameter("anioSel");
		String mesNum=request.getParameter("mesNum");
		
		String nombreupdate=request.getParameter("nombre1");//Nombre prioridad
		String unidad1=request.getParameter("unidad1");//Unidad prioridad
		String fecha1=request.getParameter("datepicker100");//Fecha fin
		String fechaIni=request.getParameter("datepicker101");//Fecha inicio
		String peso1=request.getParameter("peso");//Peso
		String avProg=request.getParameter("avProg");//Avance Programado
		String avReal=request.getParameter("avReal");//Avance Real
		String avInicial=request.getParameter("avInicial");//Avance Inicial
		//System.out.println(avProg+" - "+avReal);
		
		String contComent=request.getParameter("contURL");
		int idPrioridad = Integer.parseInt(clavePrio); 
		
		if(contComent!=null && !contComent.equals("") && !contComent.equals("0")){
			int cantURL = Integer.parseInt(contComent);
			for(int j=1; j<=cantURL; j++){
				UrlDetalle urlDet = new UrlDetalle();
				String nbURL = request.getParameter("nbURL"+j);
				String desURL = request.getParameter("desURL"+j);
				urlDet.setIdPrioridad(idPrioridad);
				urlDet.setNbURL(nbURL);
				urlDet.setUrl(desURL);
				urlDet.setEstatus("Activo");
				ClaseUrlDetalle.agregarUrl(urlDet);
			}
		}
		
		Calendar fechaA = Calendar.getInstance();
		int mesInt = fechaA.get(Calendar.MONTH)+1;
		int ano = fechaA.get(Calendar.YEAR);
		int dia = fechaA.get(Calendar.DATE);
		String fechaAlta;
		if(fechaIni!=null && fechaIni!=""){
			fechaAlta = fechaIni;
		}else{
			fechaAlta = mesInt+"/"+dia+"/"+ano;
		}
		
		Prioridad ap = ClaseProyectosPrioritarios.consultarXclave(usuario, idPrioridad, anio);
		//nombreanterior
		ap.setNombre(nombreupdate);
		ap.setUnidad(unidad1); 
		ap.setFhFin(fecha1);      
		ap.setFhInicio(fechaAlta);
		
		boolean proyActualizado = ClaseProyectosPrioritarios.actualizaProyecto(ap);
		
		if(proyActualizado){
			String priofhIni = ap.getFhInicio();
			String priofhFin = ap.getFhFin();
			String[] arrfhIni = priofhIni.split("\\/");
			String[] arrfhFin = priofhFin.split("\\/");
			String mesIni = arrfhIni[0];
			String mesFin = arrfhFin[0];
			int intMesIni = Integer.parseInt(mesIni);
			int intMesFin = Integer.parseInt(mesFin);
			int diferencia = intMesFin - intMesIni;
			diferencia++;
			for(int i=0; i <diferencia; i++){
				String mesGuar = obtenMes(intMesIni+i);
				PrioridadMes prioMes = ClasePrioridesPorMes.consultarMes(ap, mesGuar);
				if(prioMes==null){
					prioMes = new PrioridadMes();
					prioMes.setAnio(anio);
					prioMes.setAvanceProgramado("0");
					prioMes.setAvanceReal("0");
					prioMes.setEstatus("Activo");
					prioMes.setIdPrioridad(idPrioridad);
					prioMes.setMes(mesGuar);
					prioMes.setPeso(peso1);
					ClasePrioridesPorMes.agregarPrioMes(prioMes);
				}
			}
			
			PrioridadMes prioMes = ClasePrioridesPorMes.consultarMes(ap, mes);
			prioMes.setPeso(peso1);
			prioMes.setMes(mes);
			prioMes.setAvanceProgramado(avProg);
			prioMes.setAvanceReal(avReal);
			prioMes.setAvanceInicial(avInicial);
			boolean prioMesActual = ClasePrioridesPorMes.actualizaPrioMes(prioMes, mes, anio);
			ArrayList<Actividad> arrActJsp = new ArrayList<Actividad>();
			for(int x=1;x<=20;x++){
				//Actividades
				Actividad acti = new Actividad();
				String nombre=request.getParameter("act"+x);
				String fecha=request.getParameter("hidenfecha"+x);
				String porcentaje=request.getParameter("por"+x);
				if(nombre!=null && !nombre.equals("")){
					acti.setFhFin(fecha);
					acti.setNbActividad(nombre);
					acti.setPeso(porcentaje);
					acti.setIdPrioridad(idPrioridad);
					acti.setStatus("Activo");
					//Avances
					String lape=request.getParameter("pe"+x);
					String lare=request.getParameter("re"+x);
					acti.setProgEne(lape);
					acti.setResuEne(lare);
					String lapf=request.getParameter("pf"+x);
					String larf=request.getParameter("rf"+x);
					acti.setProgFeb(lapf);
					acti.setResuFeb(larf);
					String lapm=request.getParameter("pm"+x);
					String larm=request.getParameter("rm"+x);
					acti.setProgMar(lapm);
					acti.setResuMar(larm);
					String lapa=request.getParameter("pa"+x);
					String lara=request.getParameter("ra"+x);
					acti.setProgAbr(lapa);
					acti.setResuAbr(lara);
					String lapma=request.getParameter("pma"+x);
					String larma=request.getParameter("rma"+x);
					acti.setProgMay(lapma);
					acti.setResuMay(larma);
					String lapjn=request.getParameter("pjn"+x);
					String larjn=request.getParameter("rjn"+x);
					acti.setProgJun(lapjn);
					acti.setResuJun(larjn);
					String lapjl=request.getParameter("pjl"+x);
					String larjl=request.getParameter("rjl"+x);
					acti.setProgJul(lapjl);
					acti.setResuJul(larjl);
					String lapag=request.getParameter("pag"+x);
					String larag=request.getParameter("rag"+x);
					acti.setProgAgo(lapag);
					acti.setResuAgo(larag);
					String laps=request.getParameter("ps"+x);
					String lars=request.getParameter("rs"+x);
					acti.setProgSep(laps);
					acti.setResuSep(lars);
					String lapo=request.getParameter("po"+x);
					String laro=request.getParameter("ro"+x);
					acti.setProgOct(lapo);
					acti.setResuOct(laro);
					String lapn=request.getParameter("pn"+x);
					String larn=request.getParameter("rn"+x);
					acti.setProgNov(lapn);
					acti.setResuNov(larn);
					String lapd=request.getParameter("pd"+x);
					String lard=request.getParameter("rd"+x);
					acti.setProgDic(lapd);
					acti.setResuDic(lard);
					arrActJsp.add(acti);
				}
			}
			if(prioMesActual){
				ArrayList<Actividad> arrActividades = ClaseActividad.consultarActividades(idPrioridad);
				if(arrActividades!=null && arrActividades.size()>0 && arrActJsp.size()>0){
					int numActjsp = arrActJsp.size(); //Número de acividades en pantalla
					int numActAnt = arrActividades.size(); //Número de actividades en bd
					if(numActjsp == numActAnt){ //Son el mismo número de actividades
						for(int j=0; j<numActAnt;j++){
							Actividad actJSP = arrActJsp.get(j);
							Actividad act = arrActividades.get(j);
							act.setNbActividad(actJSP.getNbActividad());
							act.setFhFin(actJSP.getFhFin());
							act.setPeso(actJSP.getPeso());
							boolean actua = ClaseActividad.actualizaAct(act);
							if(actua){
								actualizaAvances(actJSP, act.getIdActividad());
							}
						}
					}else if(numActjsp > numActAnt){//Se agregaron actividades, hay que agregar
						boolean exist=false;
						for(int y=0; y<numActjsp;y++){
							Actividad act = arrActJsp.get(y);
							exist = validaExisteAct(act, arrActividades);
							if(exist){
								for(int g=0;g<numActAnt;g++){
									Actividad actExis = arrActividades.get(g);
									if(actExis.getNbActividad().equals(act.getNbActividad())){
										actExis.setFhFin(act.getFhFin());
										actExis.setPeso(act.getPeso());
										boolean actua = ClaseActividad.actualizaAct(actExis);
										if(actua){
											actualizaAvances(act, actExis.getIdActividad());
										}
									}
								}
							}else{
								boolean insAct = ClaseActividad.agregarActividad(act);
								if(insAct){
									agregaAvances(act,idPrioridad);
								}
							}
						}
					}else if(numActjsp < numActAnt){//Se borraron actividades, hay que borrar
						boolean exist=false;
						for(int o=0; o<numActAnt;o++){
							Actividad actAnt = arrActividades.get(o);
							exist=validaExisteAct(actAnt, arrActJsp);
							if(exist){
								for(int g=0;g<numActjsp;g++){
									Actividad actExis = arrActJsp.get(g);
									if(actExis.getNbActividad().equals(actAnt.getNbActividad())){
										actAnt.setFhFin(actExis.getFhFin());
										actAnt.setPeso(actExis.getPeso());
										boolean actua = ClaseActividad.actualizaAct(actAnt);
										if(actua){
											actualizaAvances(actExis, actAnt.getIdActividad());
										}
									}
								}
							}else{
								ClaseActividad.eliminaAct(actAnt);
							}
						}
					}
				}else{
					if(arrActJsp!=null && arrActJsp.size()>0){
						for(int i=0; i<arrActJsp.size();i++){
							Actividad actNew = arrActJsp.get(i);
							boolean insAct = ClaseActividad.agregarActividad(actNew);
							if(insAct){
								agregaAvances(actNew,idPrioridad);
							}
						}
					}
				}
			}
		}
					
		ArrayList<IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mes,anio);
		arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
		ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuario,mesNum,anio);
		ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario,mes, mesNum,anio);
		arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
		int mesNumInt = Integer.parseInt(mesNum)-1;
		
		request.setAttribute("avProg", avProg);
		request.setAttribute("avReal", avReal);
		request.setAttribute("indicadores", arrIndInte);
		request.setAttribute("porcentajes", resulsetProcentaje);
		request.setAttribute("proyectosPrio", arrProyectosP);
		request.setAttribute("usuarioEnviado", usuario);
		request.setAttribute("mesEnviado", mes);
		request.setAttribute("mesNumerico", mesNumInt+"");
		request.setAttribute("anio", anio);
		request.setAttribute("variableEnviada", new String("Las actividades se han actualizado correctamente"));
		request.setAttribute("origen", "Otro");
		request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
		
	}
	
	private boolean agregaAvances(Actividad actNew,int idPrioridad){
		boolean agregados=false;
		Actividad activi = ClaseActividad.consultaActividad(actNew.getNbActividad(), idPrioridad);
		AvanceActividades avAct = new AvanceActividades();
		if(activi!=null){
			avAct.setIdActividad(activi.getIdActividad());
			//Enero
			if(actNew.getProgEne()!=null && !actNew.getProgEne().equals("")){
				avAct.setMes("Enero");
				avAct.setProgramado(actNew.getProgEne());
				if(actNew.getResuEne()!=null && !actNew.getResuEne().equals("")){
					avAct.setReal(actNew.getResuEne());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Febrero
			if(actNew.getProgFeb()!=null && !actNew.getProgFeb().equals("")){
				avAct.setMes("Febrero");
				avAct.setProgramado(actNew.getProgFeb());
				if(actNew.getResuFeb()!=null && !actNew.getResuFeb().equals("")){
					avAct.setReal(actNew.getResuFeb());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Marzo
			if(actNew.getProgMar()!=null && !actNew.getProgMar().equals("")){
				avAct.setMes("Marzo");
				avAct.setProgramado(actNew.getProgMar());
				if(actNew.getResuMar()!=null && !actNew.getResuMar().equals("")){
					avAct.setReal(actNew.getResuMar());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Abril
			if(actNew.getProgAbr()!=null && !actNew.getProgAbr().equals("")){
				avAct.setMes("Abril");
				avAct.setProgramado(actNew.getProgAbr());
				if(actNew.getResuAbr()!=null && !actNew.getResuAbr().equals("")){
					avAct.setReal(actNew.getResuAbr());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Mayo
			if(actNew.getProgMay()!=null && !actNew.getProgMay().equals("")){
				avAct.setMes("Mayo");
				avAct.setProgramado(actNew.getProgMay());
				if(actNew.getResuMay()!=null && !actNew.getResuMay().equals("")){
					avAct.setReal(actNew.getResuMay());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Junio
			if(actNew.getProgJun()!=null && !actNew.getProgJun().equals("")){
				avAct.setMes("Junio");
				avAct.setProgramado(actNew.getProgJun());
				if(actNew.getResuJun()!=null && !actNew.getResuJun().equals("")){
					avAct.setReal(actNew.getResuJun());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Julio
			if(actNew.getProgJul()!=null && !actNew.getProgJul().equals("")){
				avAct.setMes("Julio");
				avAct.setProgramado(actNew.getProgJul());
				if(actNew.getResuJul()!=null && !actNew.getResuJul().equals("")){
					avAct.setReal(actNew.getResuJul());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Agosto
			if(actNew.getProgAgo()!=null && !actNew.getProgAgo().equals("")){
				avAct.setMes("Agosto");
				avAct.setProgramado(actNew.getProgAgo());
				if(actNew.getResuAgo()!=null && !actNew.getResuAgo().equals("")){
					avAct.setReal(actNew.getResuAgo());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Septiembre
			if(actNew.getProgSep()!=null && !actNew.getProgSep().equals("")){
				avAct.setMes("Septiembre");
				avAct.setProgramado(actNew.getProgSep());
				if(actNew.getResuSep()!=null && !actNew.getResuSep().equals("")){
					avAct.setReal(actNew.getResuSep());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Octubre
			if(actNew.getProgOct()!=null && !actNew.getProgOct().equals("")){
				avAct.setMes("Octubre");
				avAct.setProgramado(actNew.getProgOct());
				if(actNew.getResuOct()!=null && !actNew.getResuOct().equals("")){
					avAct.setReal(actNew.getResuOct());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Noviembre
			if(actNew.getProgNov()!=null && !actNew.getProgNov().equals("")){
				avAct.setMes("Noviembre");
				avAct.setProgramado(actNew.getProgNov());
				if(actNew.getResuNov()!=null && !actNew.getResuNov().equals("")){
					avAct.setReal(actNew.getResuNov());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
			//Diciembre
			if(actNew.getProgDic()!=null && !actNew.getProgDic().equals("")){
				avAct.setMes("Diciembre");
				avAct.setProgramado(actNew.getProgDic());
				if(actNew.getResuDic()!=null && !actNew.getResuDic().equals("")){
					avAct.setReal(actNew.getResuDic());
				}
				ClaseActividad.agregarAvanceActividad(avAct);
				agregados=true;
			}
		}
		return agregados;
	}

	private boolean validaExisteAvance(AvanceActividades avAct,
			ArrayList<AvanceActividades> arrAvActJSP) {
		boolean existe=false;
		if(avAct!=null){
			for(int i=0; i<arrAvActJSP.size();i++){
				AvanceActividades avActAnt = arrAvActJSP.get(i);
				if(avAct.getMes().equals(avActAnt.getMes())){
					existe=true;
				}
			}
		}
		return existe;
	}

	private boolean validaExisteAct(Actividad avAct,
			ArrayList<Actividad> arrAct) {
		boolean existe=false;
		if(avAct!=null){
			for(int i=0; i<arrAct.size();i++){
				Actividad act = arrAct.get(i);
				if(avAct.getNbActividad().equals(act.getNbActividad())){
					existe=true;
				}
			}
		}
		return existe;
	}
	
	private boolean actualizaAvances(Actividad actJSP, int idActividad){
		boolean actOk=false;
		ArrayList<AvanceActividades> arrAvAct = ClaseActividad.consultarAvanceAct(idActividad);
		ArrayList<AvanceActividades> arrAvActJSP = obtenAvances(actJSP,idActividad);
		int tamAcAct = arrAvAct.size();
		int tamAvActJSP = arrAvActJSP.size();
		boolean existe=false;
		if(tamAcAct == tamAvActJSP){ //Son el mismo números de avances
			for(int i=0; i<arrAvAct.size(); i++){
				AvanceActividades avAct = arrAvAct.get(i);
				AvanceActividades avActJSP = null;
				String mesAc = avAct.getMes();
				boolean exist=false;
				for(int j=0; j<arrAvActJSP.size(); j++){
					avActJSP = arrAvActJSP.get(j);
					if(mesAc.equals(avActJSP.getMes())){
						avAct.setMes(avActJSP.getMes());
						avAct.setProgramado(avActJSP.getProgramado());
						avAct.setReal(avActJSP.getReal());
						exist = true;
					}
				}
				if(exist){
					ClaseActividad.actualizaAvAct(avAct);
				}else{
					ClaseActividad.agregarAvanceActividad(avAct);
				}
			}
		}else if(tamAcAct > tamAvActJSP){ // Se eliminaron avances
			for(int i=0; i<tamAvActJSP; i++){
				AvanceActividades avAct = arrAvAct.get(i);
				existe = validaExisteAvance(avAct, arrAvActJSP);
				if(existe){
					//actualiza
					for(int x=0; x<arrAvActJSP.size();x++){
						AvanceActividades avActJSP = arrAvActJSP.get(i);
						if(avActJSP.getMes().equals(avAct.getMes())){
							avAct.setMes(avActJSP.getMes());
							avAct.setProgramado(avActJSP.getProgramado());
							avAct.setReal(avActJSP.getReal());
							ClaseActividad.actualizaAvAct(avAct);
						}
					}
				}else{
					//elimina
					ClaseActividad.eliminaAvAct(avAct);
				}
			}
		}else if(tamAcAct < tamAvActJSP){ // Se agregaron avances
			for(int h=0; h<tamAvActJSP;h++){
				AvanceActividades avActJSP = arrAvActJSP.get(h);
				existe = validaExisteAvance(avActJSP, arrAvAct);
				if(existe){
					//actualiza
					for(int x=0; x<arrAvAct.size();x++){
						AvanceActividades avAct = arrAvAct.get(x);
						if(avActJSP.getMes().equals(avAct.getMes())){
							avAct.setMes(avActJSP.getMes());
							avAct.setProgramado(avActJSP.getProgramado());
							avAct.setReal(avActJSP.getReal());
							ClaseActividad.actualizaAvAct(avAct);
						}
					}
				}else{
					//agrega
					ClaseActividad.agregarAvanceActividad(avActJSP);
				}
			}
		}
		return actOk;
	}
	
	
	private ArrayList<AvanceActividades> obtenAvances(Actividad actNew, int idActividad) {
		ArrayList<AvanceActividades> arrAvAct = null;
		if(actNew!=null){
			arrAvAct = new ArrayList<AvanceActividades>();
			//Enero
			if(actNew.getProgEne()!=null && !actNew.getProgEne().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Enero");
				avAct.setProgramado(actNew.getProgEne());
				if(actNew.getResuEne()!=null && !actNew.getResuEne().equals("")){
					avAct.setReal(actNew.getResuEne());
				}
				arrAvAct.add(avAct);
			}
			//Febrero
			if(actNew.getProgFeb()!=null && !actNew.getProgFeb().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Febrero");
				avAct.setProgramado(actNew.getProgFeb());
				if(actNew.getResuFeb()!=null && !actNew.getResuFeb().equals("")){
					avAct.setReal(actNew.getResuFeb());
				}
				arrAvAct.add(avAct);
			}
			//Marzo
			if(actNew.getProgMar()!=null && !actNew.getProgMar().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Marzo");
				avAct.setProgramado(actNew.getProgMar());
				if(actNew.getResuMar()!=null && !actNew.getResuMar().equals("")){
					avAct.setReal(actNew.getResuMar());
				}
				arrAvAct.add(avAct);
			}
			//Abril
			if(actNew.getProgAbr()!=null && !actNew.getProgAbr().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Abril");
				avAct.setProgramado(actNew.getProgAbr());
				if(actNew.getResuAbr()!=null && !actNew.getResuAbr().equals("")){
					avAct.setReal(actNew.getResuAbr());
				}
				arrAvAct.add(avAct);
			}
			//Mayo
			if(actNew.getProgMay()!=null && !actNew.getProgMay().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Mayo");
				avAct.setProgramado(actNew.getProgMay());
				if(actNew.getResuMay()!=null && !actNew.getResuMay().equals("")){
					avAct.setReal(actNew.getResuMay());
				}
				arrAvAct.add(avAct);
			}
			//Junio
			if(actNew.getProgJun()!=null && !actNew.getProgJun().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Junio");
				avAct.setProgramado(actNew.getProgJun());
				if(actNew.getResuJun()!=null && !actNew.getResuJun().equals("")){
					avAct.setReal(actNew.getResuJun());
				}
				arrAvAct.add(avAct);
			}
			//Julio
			if(actNew.getProgJul()!=null && !actNew.getProgJul().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Julio");
				avAct.setProgramado(actNew.getProgJul());
				if(actNew.getResuJul()!=null && !actNew.getResuJul().equals("")){
					avAct.setReal(actNew.getResuJul());
				}
				arrAvAct.add(avAct);
			}
			//Agosto
			if(actNew.getProgAgo()!=null && !actNew.getProgAgo().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Agosto");
				avAct.setProgramado(actNew.getProgAgo());
				if(actNew.getResuAgo()!=null && !actNew.getResuAgo().equals("")){
					avAct.setReal(actNew.getResuAgo());
				}
				arrAvAct.add(avAct);
			}
			//Septiembre
			if(actNew.getProgSep()!=null && !actNew.getProgSep().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Septiembre");
				avAct.setProgramado(actNew.getProgSep());
				if(actNew.getResuSep()!=null && !actNew.getResuSep().equals("")){
					avAct.setReal(actNew.getResuSep());
				}
				arrAvAct.add(avAct);
			}
			//Octubre
			if(actNew.getProgOct()!=null && !actNew.getProgOct().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Octubre");
				avAct.setProgramado(actNew.getProgOct());
				if(actNew.getResuOct()!=null && !actNew.getResuOct().equals("")){
					avAct.setReal(actNew.getResuOct());
				}
				arrAvAct.add(avAct);
			}
			//Noviembre
			if(actNew.getProgNov()!=null && !actNew.getProgNov().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Noviembre");
				avAct.setProgramado(actNew.getProgNov());
				if(actNew.getResuNov()!=null && !actNew.getResuNov().equals("")){
					avAct.setReal(actNew.getResuNov());
				}
				arrAvAct.add(avAct);
			}
			//Diciembre
			if(actNew.getProgDic()!=null && !actNew.getProgDic().equals("")){
				AvanceActividades avAct = new AvanceActividades();
				avAct.setIdActividad(idActividad);
				avAct.setMes("Diciembre");
				avAct.setProgramado(actNew.getProgDic());
				if(actNew.getResuDic()!=null && !actNew.getResuDic().equals("")){
					avAct.setReal(actNew.getResuDic());
				}
				arrAvAct.add(avAct);
			}
		}
		return arrAvAct;
	}
	
	private String obtenMes(int mes){
		String mesN="";
		switch (mes) {
			case 1:
				mesN = "Enero";
				break;
			case 2:
				mesN = "Febrero";
				break;
			case 3:
				mesN = "Marzo";
				break;
			case 4:
				mesN = "Abril";
				break;
			case 5:
				mesN = "Mayo";
				break;
			case 6:
				mesN = "Junio";
				break;
			case 7:
				mesN = "Julio";
				break;
			case 8:
				mesN = "Agosto";
				break;
			case 9:
				mesN = "Septiembre";
				break;
			case 10:
				mesN = "Octubre";
				break;
			case 11:
				mesN = "Noviembre";
				break;
			case 12:
				mesN = "Diciembre";
				break;
			}
		return mesN;
	}
	
	
}












