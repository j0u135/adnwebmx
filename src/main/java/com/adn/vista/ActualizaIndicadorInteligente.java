package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseComentIndInte;
import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.controlador.ComentarioIndInte;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;

/**
 * Servlet implementation class actualizaIndicadorInteligente
 */
@WebServlet("/actualizaIndInte")
public class ActualizaIndicadorInteligente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizaIndicadorInteligente() {
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
		// TODO Auto-generated method stub
		
		String nombre=request.getParameter("nombre");
		String usuario=request.getParameter("usuarioEnviado");
		String cveIndInte = request.getParameter("claveIndInte");
		String mesNum=request.getParameter("mesNum");
		String anio=request.getParameter("anio");
		String unidad=request.getParameter("unidad");
		String meta=request.getParameter("hidmeta");
		String resultado=request.getParameter("hidresultado");
		String peso=request.getParameter("peso");
		String frecuencia=request.getParameter("frecuencia");
		String tipo=request.getParameter("tipo");
		String rpond=request.getParameter("rpond");
		String usuario1=request.getParameter("usuSes");
		String progSem1=request.getParameter("progSem1");
		String realSem1=request.getParameter("realSem1");
		String progSem2=request.getParameter("progSem2");
		String realSem2=request.getParameter("realSem2");
		String progSem3=request.getParameter("progSem3");
		String realSem3=request.getParameter("realSem3");
		String progSem4=request.getParameter("progSem4");
		String realSem4=request.getParameter("realSem4");
		String progSem5=request.getParameter("progSem5");
		String realSem5=request.getParameter("realSem5");
		String progQuin1=request.getParameter("progQuin1");
		String realQuin1=request.getParameter("realQuin1");
		String progQuin2=request.getParameter("progQuin2");
		String realQuin2=request.getParameter("realQuin2");
		String progMes=request.getParameter("progMes");
		String realMes=request.getParameter("realMes");
		String mes = request.getParameter("mesHR");
		String contComent=request.getParameter("contComent");
		int idIndInte = Integer.parseInt(cveIndInte);
		
		if(contComent!=null && !contComent.equals("") && !contComent.equals("0")){
			int cantComentarios = Integer.parseInt(contComent);
			if(cantComentarios>0){
				for(int f=1; f<=cantComentarios; f++){
					String fhComen=request.getParameter("fhComen"+f);
					String usuComen=request.getParameter("usuComen"+f);
					String textComen=request.getParameter("textComen"+f);
					ComentarioIndInte coment = new ComentarioIndInte();
					coment.setFhComentario(fhComen);
					coment.setUsuario(usuComen);
					coment.setTxComentario(textComen);
					coment.setIdIndInte(idIndInte);
					ClaseComentIndInte.agregarComent(coment);
				}
			}
		}
		
			IndicadorInteligente ii = new IndicadorInteligente();
			  ii.setIdIndInte(idIndInte);
			  ii.setFrecuencia(frecuencia);
			  ii.setMeta(meta);
			  ii.setResultado(resultado);
			  ii.setPeso(peso);
			  ii.setTipo(tipo);
			  ii.setRpond(rpond);
			  ii.setProgSem1(progSem1);
			  ii.setResulSem1(realSem1);
			  ii.setProgSem2(progSem2);
			  ii.setResulSem2(realSem2);
			  ii.setProgSem3(progSem3);
			  ii.setResulSem3(realSem3);
			  ii.setProgSem4(progSem4);
			  ii.setResulSem4(realSem4);
			  ii.setProgSem5(progSem5);
			  ii.setResulSem5(realSem5);
			  ii.setProgQuin1(progQuin1);
			  ii.setResulQuin1(realQuin1);
			  ii.setProgQuin2(progQuin2);
			  ii.setResulQuin2(realQuin2);
			  ii.setRpond(rpond);
	  			boolean in=ClaseIndicadoresInteligentes.update(ii, usuario,mes);
  				if(in){
  					request.setAttribute("variableEnviada", new String("El indicador se actualizo correctamente"));
  				}else{
  					request.setAttribute("variableEnviada", new String("No se pudo actualizar"));
  				}
  				
  				int mesNumReal=Integer.parseInt(mesNum)+1;
  				
  				ArrayList<IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mes,anio);
  				arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
  				ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuario,mesNum,anio);
  				ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario,mes, mesNumReal + "",anio);
  				arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
  				
  				request.setAttribute("indicadores", arrIndInte);
  				request.setAttribute("porcentajes", resulsetProcentaje);
  				request.setAttribute("proyectosPrio", arrProyectosP);
  				request.setAttribute("usuarioEnviado", usuario);
  				request.setAttribute("mesEnviado", mes);
  				request.setAttribute("mesNumerico", mesNum);
  				request.setAttribute("anio", anio);
  				request.setAttribute("origen", "Otro");
  				request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);	
	  	}
}
