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
 * Servlet implementation class GuardaAprobadores
 */
@WebServlet("/GuardaAprobadores")
public class GuardaAprobadores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardaAprobadores() {
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

		String mes=request.getParameter("mesauno");
		String usuario=request.getParameter("usuarioaa1");
		String nuevoApro=request.getParameter("nuevoApro");
		String mesre=request.getParameter("mesre");
		String usure=request.getParameter("usure");
	
		String estatus="Pendiente";
		ArrayList<HojaRumbo> arrHR1 =ClaseHojaRumbo.consultaApro2(usuario,mes);
		if(arrHR1!=null){
			HojaRumbo hojaRum = arrHR1.get(0);
			if(hojaRum!=null){
				String aprobadores = hojaRum.getAprobadores();
				String estat = hojaRum.getEstatus();
				int con=0;
				String apro="";
				String rapro="", estilo="estatusblanco";
				if(estat.equals("Pendiente")){
					estatus="Pendiente";
				}else{
					estatus=estat;
				}
				
				if(aprobadores !=null && aprobadores != ""){
					int numApro = Integer.parseInt(aprobadores);
					con = numApro + 1;
					apro = "apro"+con;
					rapro = "rapro"+con;
				}else{
					con = 1;
					apro = "apro"+con;
					rapro = "rapro"+con;
				}
				if(con<5 && (estat.equals("Pendiente")|| estat.equals("Solicitada"))){
					ClaseHojaRumbo.agregaAprobadores(usuario,mes,apro,nuevoApro,rapro,estilo,con,estatus);
				}
			}
		}
		
		ArrayList<Usuario> arrJefes =ClaseUsuario.consultaJefes();
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(usuario,mes);
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(usuario,mes);
		
		String aprob1="", aprob2="", aprob3="", aprob4="", mesA1="",raprob1="", raprob2="", raprob3="", raprob4="", nbApro1="", nbApro2="", nbApro3="", nbApro4="", estat="";
			if(arrHR!=null){
				HojaRumbo hojaR = arrHR.get(0);
				if(hojaR!=null){
					nbApro1=hojaR.getNbApro1();
					nbApro2=hojaR.getNbApro2();
					nbApro3=hojaR.getNbApro3();
					nbApro4=hojaR.getNbApro4();
					aprob1 = hojaR.getApro1();
					aprob2 = hojaR.getApro2();
					aprob3 = hojaR.getApro3();
					aprob4 = hojaR.getApro4();
					mesA1 = hojaR.getMes();
					raprob1 = hojaR.getRapro1();
					raprob2 = hojaR.getRapro2();
					raprob3 = hojaR.getRapro3();
					raprob4 = hojaR.getRapro4();
					estat = hojaR.getEstatus();
				}
			}
			
		   request.setAttribute("jefes", arrJefes);
		   request.setAttribute("comentarios", arrComents);
		   request.setAttribute("nbApro1", new String(nbApro1));
		   request.setAttribute("nbApro2", new String(nbApro2));
		   request.setAttribute("nbApro3", new String(nbApro3));
		   request.setAttribute("nbApro4", new String(nbApro4));
		   request.setAttribute("apro1", new String(aprob1));
		   request.setAttribute("apro2", new String(aprob2));
		   request.setAttribute("apro3", new String(aprob3));
		   request.setAttribute("apro4", new String(aprob4));
		   request.setAttribute("mesA1", new String(mesA1));
		   request.setAttribute("rapro1", new String(raprob1));
		   request.setAttribute("rapro2", new String(raprob2));
		   request.setAttribute("rapro3", new String(raprob3));
		   request.setAttribute("rapro4", new String(raprob4));
		   request.setAttribute("mesre", new String(mesre));
		   request.setAttribute("usure", new String(usure));
		   request.setAttribute("estApro", new String(estat));
		request.getRequestDispatcher("Aprobaciones.jsp").forward(request, response);
	}

}