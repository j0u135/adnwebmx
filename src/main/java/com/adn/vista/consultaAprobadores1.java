package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseUsuario;
import com.adn.conexion.claseComentarios;
import com.adn.controlador.Comentarios;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class consultaAprobadores1
 */
@WebServlet("/consultaAprobadores1")
public class consultaAprobadores1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public consultaAprobadores1() {
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
		String mes=request.getParameter("meshidA1");
		String usuario=request.getParameter("usuariohidenA1");
		//System.out.println("Nombres"+usuario+mes);
		String mesre=request.getParameter("mesre");
		String usure=request.getParameter("usure");
		//System.out.println("Nombres"+mesre+usure);
		
		if(mes=="" || mes==null){
			mes=mesre;
		}
	
		if(usuario=="" || usuario==null){
			usuario=usure;
		}
		
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(usuario,mes);
		ArrayList<Usuario> arrJefes =ClaseUsuario.consultaJefes();
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(usuario,mes);
		
		String apro1="", apro2="", apro3="", apro4="", mesA1="",rapro1="", rapro2="", rapro3="", rapro4="", nbApro1="", nbApro2="", nbApro3="", nbApro4="", estat ="", numApro ="";
			if(arrHR!=null){
				HojaRumbo hr = arrHR.get(0);
				if(hr!=null){
					nbApro1=hr.getNbApro1();
					nbApro2=hr.getNbApro2();
					nbApro3=hr.getNbApro3();
					nbApro4=hr.getNbApro4();
					apro1 = hr.getApro1();
					apro2 = hr.getApro2();
					apro3 = hr.getApro3();
					apro4 = hr.getApro4();
					mesA1 = hr.getMes();
					rapro1 = hr.getRapro1();
					rapro2 = hr.getRapro2();
					rapro3 = hr.getRapro3();
					rapro4 = hr.getRapro4();
					estat = hr.getEstatus();
					numApro = hr.getAprobadores();
				}
			}
		   request.setAttribute("jefes", arrJefes);
		   request.setAttribute("comentarios", arrComents);
		   request.setAttribute("nbApro1", new String(nbApro1));
		   request.setAttribute("nbApro2", new String(nbApro2));
		   request.setAttribute("nbApro3", new String(nbApro3));
		   request.setAttribute("nbApro4", new String(nbApro4));
		   request.setAttribute("apro1", new String(apro1));
		   request.setAttribute("apro2", new String(apro2));
		   request.setAttribute("apro3", new String(apro3));
		   request.setAttribute("apro4", new String(apro4));
		   request.setAttribute("mesA1", new String(mesA1));
		   request.setAttribute("rapro1", new String(rapro1));
		   request.setAttribute("rapro2", new String(rapro2));
		   request.setAttribute("rapro3", new String(rapro3));
		   request.setAttribute("rapro4", new String(rapro4));
		   request.setAttribute("mesre", new String(mes));
		   request.setAttribute("usure", new String(usuario));
		   request.setAttribute("estApro", new String(estat));
		   request.setAttribute("numApro", new String(numApro));
		   
		   request.getRequestDispatcher("Aprobaciones.jsp").forward(request, response);
	}
}