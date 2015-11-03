package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseActividad;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.conexion.ClaseUrlDetalle;
import com.adn.controlador.Actividad;
import com.adn.controlador.AvanceActividades;
import com.adn.controlador.Prioridad;
import com.adn.controlador.PrioridadMes;
import com.adn.controlador.UrlDetalle;

/**
 * Servlet implementation class actualizaActividades
 */
@WebServlet("/borrarURL")
public class BorrarURL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarURL() {
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
		
		String usuarioHR=request.getParameter("usuarioHR1");
		String pesoTotal=request.getParameter("pesoTotal2"); 
		String desMensual=request.getParameter("desMensual1");
		String mesBarra=request.getParameter("mesBarra1");
		String anio = request.getParameter("anioSel1");
		String mesNum = request.getParameter("mesNumerico1");
		String clavePrio=request.getParameter("clavePrio1");
		String urlBorrar=request.getParameter("urlBorrar");
		
		String nombreP="", unidadP="", fechaP="", inicialP="", programadoP="", realP="", pesoP="", fechaI="";
			
//		String contComent=request.getParameter("contURL");
		int idPrioridad = Integer.parseInt(clavePrio);
		
		if(clavePrio!=null && !clavePrio.equals("")){
			   
			   Prioridad prio=ClaseProyectosPrioritarios.consultarXclave(usuarioHR,idPrioridad,anio);
			   PrioridadMes prioMes = ClasePrioridesPorMes.consultarMes(prio, mesBarra);
			   ArrayList<Actividad> arrActividad = ClaseActividad.consultarActividades(prio.getIdPrioridad());
			   ArrayList<Actividad> arrActi=null;
			   if(arrActividad!=null && arrActividad.size()>0){
				   arrActi = new ArrayList<Actividad>();
				   for(int i=0; i<arrActividad.size(); i++){
					   Actividad act = arrActividad.get(i);
					   ArrayList<AvanceActividades> arrAvAct = ClaseActividad.consultarAvanceAct(act.getIdActividad());
					   if(arrAvAct!=null && arrAvAct.size()>0){
						   for(int j=0; j<arrAvAct.size() ; j++){
							   AvanceActividades avAct = arrAvAct.get(j);
							   String mesAct = avAct.getMes();
							   if(mesAct!=null && mesAct!=""){
								   if(mesAct.equals("Enero")){
									   act.setProgEne(avAct.getProgramado());
									   act.setResuEne(avAct.getReal());
								   }else if(mesAct.equals("Febrero")){
									   act.setProgFeb(avAct.getProgramado());
									   act.setResuFeb(avAct.getReal());
								   }else if(mesAct.equals("Marzo")){
									   act.setProgMar(avAct.getProgramado());
									   act.setResuMar(avAct.getReal());
								   }else if(mesAct.equals("Abril")){
									   act.setProgAbr(avAct.getProgramado());
									   act.setResuAbr(avAct.getReal());
								   }else if(mesAct.equals("Mayo")){
									   act.setProgMay(avAct.getProgramado());
									   act.setResuMay(avAct.getReal());
								   }else if(mesAct.equals("Junio")){
									   act.setProgJun(avAct.getProgramado());
									   act.setResuJun(avAct.getReal());
								   }else if(mesAct.equals("Julio")){
									   act.setProgJul(avAct.getProgramado());
									   act.setResuJul(avAct.getReal());
								   }else if(mesAct.equals("Agosto")){
									   act.setProgAgo(avAct.getProgramado());
									   act.setResuAgo(avAct.getReal());
								   }else if(mesAct.equals("Septiembre")){
									   act.setProgSep(avAct.getProgramado());
									   act.setResuSep(avAct.getReal());
								   }else if(mesAct.equals("Octubre")){
									   act.setProgOct(avAct.getProgramado());
									   act.setResuOct(avAct.getReal());
								   }else if(mesAct.equals("Noviembre")){
									   act.setProgNov(avAct.getProgramado());
									   act.setResuNov(avAct.getReal());
								   }else if(mesAct.equals("Diciembre")){
									   act.setProgDic(avAct.getProgramado());
									   act.setResuDic(avAct.getReal());
								   }
							   }
						   }
						   arrActi.add(act);
					   }
				   }
			   }
		
				if(urlBorrar!=null && !urlBorrar.equals("")){
					int urlBor = Integer.parseInt(urlBorrar);
					UrlDetalle urlDet = ClaseUrlDetalle.consultarURLxIdDetalle(urlBor);
					if(urlDet!=null){
						ClaseUrlDetalle.actualizaEstatusUrlt(urlDet);
					}
				}
			    ArrayList<UrlDetalle> arrUrl = ClaseUrlDetalle.consultarURLs(prio.getIdPrioridad());
			   
				nombreP=prio.getNombre();
				unidadP=prio.getUnidad();
				fechaP=prio.getFhFin();
				fechaI=prio.getFhInicio();
				
				if(prioMes!=null){
					programadoP=prioMes.getAvanceProgramado();
					realP=prioMes.getAvanceReal();
					pesoP=prioMes.getPeso();
				}
			   
			   if(pesoTotal==null){
				   pesoTotal="";
			   }
			   if(desMensual==null){
				   desMensual="";
			   }
			   if(mesBarra==null){
				   mesBarra="";
			   }
			   
			   request.setAttribute("arrUrl", arrUrl);
			   request.setAttribute("arrActividad", arrActi);
			   request.setAttribute("proyectoEnviado", new String("Update"));
			   request.setAttribute("nombreP", new String(nombreP));
			   request.setAttribute("unidadP", new String(unidadP));
			   request.setAttribute("fechaP", new String(fechaP));
			   request.setAttribute("fechaI",new String(fechaI));
			   request.setAttribute("inicialP", new String(inicialP));
			   request.setAttribute("programadoP", new String(programadoP));
			   request.setAttribute("realP", new String(realP));
			   request.setAttribute("pesoP", new String(pesoP));
			   request.setAttribute("mesBarra", new String(mesBarra));
			   request.setAttribute("pesoTotal", new String(pesoTotal));
			   request.setAttribute("desMensual", new String(desMensual));
			   request.setAttribute("idPrioridad", prio.getIdPrioridad()+"");
			   request.setAttribute("usuarioHR", usuarioHR);
			   request.setAttribute("anioSel", anio);
			   request.setAttribute("mesNum", mesNum);
		
		request.getRequestDispatcher("ConsultaProyectos.jsp").forward(request, response);
		
		}
	}
}












