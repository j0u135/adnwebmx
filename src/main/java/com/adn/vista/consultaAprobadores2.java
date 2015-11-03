package com.adn.vista;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * Servlet implementation class consultaAprobadores2
 */
@WebServlet("/consultaAprobadores2")
public class consultaAprobadores2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public consultaAprobadores2() {
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
		
		String mes=request.getParameter("mesre2");
		String nombre=request.getParameter("usSel");		
		//System.out.println("Nombres"+nombre+mes);
		String usure2=request.getParameter("usure2");
		
		System.out.println("Nombres1"+usure2);
		
		if(mes=="" || mes==null){
			mes="";
		}
	
		if(nombre=="" || nombre==null){
			nombre=usure2;
		}
		
		String nomUsuSel="";
		Usuario datosUsu = ClaseUsuario.buscaUsuario(nombre);
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(nombre,mes);
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(nombre,mes);
		String apro11="", apro22="", apro33="", apro44="", mesA11="",usuario="",rapro1="", rapro2="", rapro3="", rapro4="",noap="",  nbApro1="", nbApro2="", nbApro3="", nbApro4="", estat ="", usuApro1="",usuApro2="",usuApro3="",usuApro4="";
		if(datosUsu!=null){
			nomUsuSel = datosUsu.getNombre();
		}
		if(arrHR!=null){
			for(int i=0; i<arrHR.size();i++){
				HojaRumbo hr = arrHR.get(i);
				nbApro1=hr.getNbApro1();
				nbApro2=hr.getNbApro2();
				nbApro3=hr.getNbApro3();
				nbApro4=hr.getNbApro4();
				apro11=(hr.getApro1()!=null?hr.getApro1():"");
				apro22=(hr.getApro2()!=null?hr.getApro2():"");
				apro33=(hr.getApro3()!=null?hr.getApro3():"");
				apro44=(hr.getApro4()!=null?hr.getApro4():"");
				mesA11=(hr.getMes()!=null?hr.getMes():"");
				usuario=(hr.getUsuario()!=null?hr.getUsuario():"");
				rapro1=(hr.getRapro1()!=null?hr.getRapro1():"estatusrojo");
				rapro2=(hr.getRapro2()!=null?hr.getRapro2():"estatusrojo");
				rapro3=(hr.getRapro3()!=null?hr.getRapro3():"estatusrojo");
				rapro4=(hr.getRapro4()!=null?hr.getRapro4():"estatusrojo");
				noap=(hr.getAprobadores()!=null?hr.getAprobadores():"estatusrojo");
				estat = hr.getEstatus();
				usuApro1=hr.getUsuApro1();
				usuApro2=hr.getUsuApro2();
				usuApro3=hr.getUsuApro3();
				usuApro4=hr.getUsuApro4();
			}
		}
		   request.setAttribute("comentarios", arrComents);
		   request.setAttribute("nbApro1", new String(nbApro1));
		   request.setAttribute("nbApro2", new String(nbApro2));
		   request.setAttribute("nbApro3", new String(nbApro3));
		   request.setAttribute("nbApro4", new String(nbApro4));
		   request.setAttribute("apro1", new String(apro11));
		   request.setAttribute("apro2", new String(apro22));
		   request.setAttribute("apro3", new String(apro33));
		   request.setAttribute("apro4", new String(apro44));
		   request.setAttribute("mesA1", new String(mesA11));
		   request.setAttribute("rapro1", new String(rapro1));
		   request.setAttribute("rapro2", new String(rapro2));
		   request.setAttribute("rapro3", new String(rapro3));
		   request.setAttribute("rapro4", new String(rapro4));
		   request.setAttribute("usuario", new String(usuario));
		   request.setAttribute("noap", new String(noap));
		   request.setAttribute("mesre2", new String(mes));
		   request.setAttribute("usuario", new String(usure2));
		   request.setAttribute("estApro", new String(estat));
		   request.setAttribute("nomUsuSel", new String(nomUsuSel));
		   request.setAttribute("UsuSel", new String(nombre));
		   request.setAttribute("usuApro1", new String(usuApro1));
		   request.setAttribute("usuApro2", new String(usuApro2));
		   request.setAttribute("usuApro3", new String(usuApro3));
		   request.setAttribute("usuApro4", new String(usuApro4));
		   
		  request.getRequestDispatcher("Aprobaciones2.jsp").forward(request, response);
	}
}
