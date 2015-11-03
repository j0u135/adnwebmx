package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;

/**
 * Servlet implementation class eliminaIndicadorInteligente
 */
@WebServlet("/eliminaIndicadorInteligente")
public class eliminaIndicadorInteligente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public eliminaIndicadorInteligente() {
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
		String claveIndInte=request.getParameter("hiddenRedireccion");
		String usuario=request.getParameter("usuarioRedireccion");
		String mesEnviado=request.getParameter("mesEnviado");
		String mesNum=request.getParameter("mesNumerico");
		String anioSel=request.getParameter("anioSel");
		String mesA=obtenMesInt(mesEnviado);
		boolean borrar=false;
		boolean in=false;
				
		 if(claveIndInte!= null && !claveIndInte.equalsIgnoreCase("") && mesEnviado!=null && !mesEnviado.equals("")  && anioSel!=null && !anioSel.equals("")){  
			 HojaRumbo hr = ClaseHojaRumbo.consultaHR(usuario, mesA, anioSel);
			 if(hr==null){
				 borrar=true;
			 }else{
				 if(hr.getEstatus()!=null && hr.getEstatus().equals("Pendiente")){
					 borrar=true;
				 }
			 }
			 if(borrar){
				 int idIndInte = Integer.parseInt(claveIndInte);
				 String estatus = "Inactivo";
				 //int idIndInte, String usuario, String mes, int anio
				 in=ClaseIndicadoresInteligentes.updateEstadoIndInte(idIndInte, usuario, mesEnviado, anioSel, estatus);
			 }
			 ArrayList<IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mesEnviado,anioSel);
			 arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
			 ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(usuario,mesNum,anioSel);
			 ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario,mesEnviado, mesNum,anioSel);
			 arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mesEnviado);
			 int mesNumInt = Integer.parseInt(mesNum)-1;
				request.setAttribute("indicadores", arrIndInte);
				request.setAttribute("porcentajes", resulsetProcentaje);
				request.setAttribute("proyectosPrio", arrProyectosP);
				request.setAttribute("usuarioEnviado", usuario);
				request.setAttribute("mesEnviado", mesEnviado);
				request.setAttribute("mesNumerico", mesNumInt+"");
				request.setAttribute("anio", anioSel);
				request.setAttribute("origen", new String("Otro"));
  				if(in){
  					request.setAttribute("variableEnviada", new String("El indicador se elimino correctamente"));
  					request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
  				}else{
  					request.setAttribute("variableEnviada", new String("No se pudo eliminar"));
  					request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
  					}
  			}
		}

	private String obtenMesInt(String mesEnviado) {
		String mes="";
		if(mesEnviado!=null && !mesEnviado.equals("")){
			if(mesEnviado.equals("Enero")){
				mes="0";
			}else if(mesEnviado.equals("Febrero")){
				mes="1";
			}else if(mesEnviado.equals("Marzo")){
				mes="2";
			}else if(mesEnviado.equals("Abril")){
				mes="3";
			}else if(mesEnviado.equals("Mayo")){
				mes="4";
			}else if(mesEnviado.equals("Junio")){
				mes="5";
			}else if(mesEnviado.equals("Julio")){
				mes="6";
			}else if(mesEnviado.equals("Agosto")){
				mes="7";
			}else if(mesEnviado.equals("Septiembre")){
				mes="8";
			}else if(mesEnviado.equals("Octubre")){
				mes="9";
			}else if(mesEnviado.equals("Noviembre")){
				mes="10";
			}else if(mesEnviado.equals("Diciembre")){
				mes="11";
			}
		}
		return mes;
	}
}
