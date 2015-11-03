package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseUsuario;
import com.adn.conexion.claseFecha;
import com.adn.controlador.CalendarioAprobacion;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class buscaUsuario y buscaIndicadores 
 */
@WebServlet("/ControlAprobaciones")
public class ControlAprobaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlAprobaciones() {
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
			String usuario = request.getParameter("usuHojaRumbo");
			
			Calendar fecha = Calendar.getInstance();
			Integer anio = fecha.get(Calendar.YEAR);
			int mesa = fecha.get(Calendar.MONTH);
			String mesB="";
			System.out.println("año "+anio);
			
			if(mesa==0)mesB="enef";
			if(mesa==1)mesB="febf";
			if(mesa==2)mesB="marf";
			if(mesa==3)mesB="abrf";
			if(mesa==4)mesB="mayf";
			if(mesa==5)mesB="junf";
			if(mesa==6)mesB="julf";
			if(mesa==7)mesB="agof";
			if(mesa==8)mesB="sepf";
			if(mesa==9)mesB="octf";
			if(mesa==10)mesB="novf";
			if(mesa==11)mesB="dicf";
			
			claseFecha cft= new claseFecha();
			CalendarioAprobacion calendario= cft.consultaFechaT(anio.toString());
			String fechaFin = cft.consultaFecha(mesB);
			ClaseHojaRumbo chr= new ClaseHojaRumbo();
			ArrayList<HojaRumbo> arrHR = chr.consultar(usuario);
			ArrayList<HojaRumbo> hojaRumboArr = chr.consultar3(usuario);
			Usuario usu = ClaseUsuario.buscaUsuario(usuario);
			String esJefe="NO";
			if(usu!=null){
				esJefe = usu.getPersonalCargo()!=null?usu.getPersonalCargo():"NO";
			}
			System.out.println("Es jefe"+esJefe);
			request.setAttribute("esJefe", esJefe);
			request.setAttribute("hojasRuta", arrHR);
			request.setAttribute("hojasEquipo", hojaRumboArr);
			request.setAttribute("calendarioAprob", calendario);
			request.setAttribute("fechaFin", fechaFin);
     	   	request.getRequestDispatcher("Interfaz7.jsp").forward(request, response);
	}

}
