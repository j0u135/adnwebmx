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
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;

/**
 * Servlet implementation class guardarHojaRumbo
 */
@WebServlet("/guardarHojaRumbo")
public class guardarHojaRumbo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guardarHojaRumbo() {
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
		String nombre=request.getParameter("usuarioHojaRumbo");
		String solicitud=request.getParameter("solicitudHR");
		String mesEnviado = request.getParameter("mesEnviado1");
		String mesNum = request.getParameter("mesHR");
		String resultado=request.getParameter("resultadoHR");
		String anio=request.getParameter("anioHR");
		String porcentajeInd=request.getParameter("porInd");
		String porcentajeProy=request.getParameter("porProy");
		
		System.out.println("Mes hoja Rumbo: "+mesNum+" "+mesEnviado + " Anio: "+ anio);
		
		HojaRumbo nuevaHoja=new HojaRumbo(nombre, solicitud, mesNum, resultado);
		boolean estado=ClaseHojaRumbo.verificaEstado(nuevaHoja, anio);
		
		if(estado){
  			//Aviso de que el usuario esta repetido, se esta validando por correo electronico
  			request.setAttribute("variableEnviada", new String("La solicitud para este mes ya fue aprobada"));
  		}else{
  			
  			boolean repetido=ClaseHojaRumbo.verificaRepetido(nuevaHoja, anio);
		  	
	  		if(repetido){

	  			//Funcion que hace update y agregar mensajes para recargar
	  			boolean updateHR=ClaseHojaRumbo.updateHojaRumbo(nuevaHoja, anio, porcentajeInd, porcentajeProy);  			
  				if(updateHR){
  					actualizaAprobador(nombre,mesNum);
  					request.setAttribute("variableEnviada", new String("La calificacion del mes se actualizo correctamente"));
  				}else{
  					request.setAttribute("variableEnviada", new String("No se pudo actualizar la hoja de rumbo"));
  					}
	  			
	  		}else{
	  			boolean in=ClaseHojaRumbo.agregarHojaRumbo(nuevaHoja, anio, porcentajeInd, porcentajeProy);
	  				if(in){
	  					actualizaAprobador(nombre,mesNum);
	  					request.setAttribute("variableEnviada", new String("La calificacion del mes se agrego correctamente"));
	  				}else{
	  					request.setAttribute("variableEnviada", new String("No se pudo dar de alta la hoja de rumbo"));
	  					}
	  			}	
  		}
		ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(nombre,mesEnviado,anio);
		arrIndInte= (ArrayList <IndicadorInteligente>)ClaseIndicadoresInteligentes.consultaResultados(arrIndInte);
		ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(nombre,mesNum,anio);
		int mesNumReal=Integer.parseInt(mesNum)+1;
		ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(nombre,mesEnviado, mesNumReal+"",anio);
		arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mesEnviado);
		
		//System.out.println("Proyectos "+arrProyectosP.size());
		request.setAttribute("indicadores", arrIndInte);
		request.setAttribute("porcentajes", resulsetProcentaje);
		request.setAttribute("proyectosPrio", arrProyectosP);
		request.setAttribute("usuarioEnviado", nombre);
		request.setAttribute("mesEnviado", mesEnviado);
		request.setAttribute("mesNumerico", mesNum);
		request.setAttribute("anio", anio);
		request.setAttribute("origen", new String("Otro"));
		request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
	}
	
	/**
	 * actualizaAprobador, actualiza la hoja rumbo con su aprobador en caso de no tener
	 * @param usuario
	 * @param mes
	 */
	protected void actualizaAprobador(String usuario, String mes) {
		int numAprob = 0;
		if(usuario != null && usuario != "" && mes != null && mes != ""){
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(usuario,mes);
			if(arrHR!=null){
				HojaRumbo hr = arrHR.get(0);
				if(hr!=null){
					if(hr.getApro1()!=null && hr.getApro1()!=""){
						numAprob = numAprob + 1;
					}else if(hr.getApro2()!=null && hr.getApro2()!=""){
						numAprob = numAprob + 1;
					}else if(hr.getApro3()!=null && hr.getApro3()!=""){
						numAprob = numAprob + 1;
					}else if(hr.getApro4()!=null && hr.getApro4()!=""){
						numAprob = numAprob + 1;
					}
					String correoJefe = ClaseUsuario.consultaJefeDirecto(usuario);
					if(correoJefe!=null && correoJefe != ""){
						if(numAprob == 0){
							ClaseHojaRumbo.agregaAprobadores(usuario,mes,"apro1",correoJefe,"rapro1","estatusblanco",1,"Pendiente");
						}
					}
				}
			}
		}
	}

}
