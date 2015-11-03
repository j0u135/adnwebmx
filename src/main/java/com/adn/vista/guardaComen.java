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
 * Servlet implementation class guardaComen
 */
@WebServlet("/guardaComen")
public class guardaComen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guardaComen() {
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
		
		String usu=request.getParameter("usuarioACm");
		String aprocomen=request.getParameter("aprocomen");
		String comen=request.getParameter("comentario");
		String mes=request.getParameter("mesre");
		String orig = request.getParameter("origen");
		System.out.println(usu+"-"+aprocomen);
		String userToApro ="";
		String usSes="";
		Comentarios chr = null;
		if(orig!=null && orig.equals("1")){
							//  usuario,aprobador
			//chr= new Comentarios(usu,aprocomen,comen,mes);
			userToApro=usu;
			usSes=usu;
		}else if(orig!=null && orig.equals("2")){
			userToApro=usu;
			usSes=aprocomen;
			//chr= new Comentarios(aprocomen,usu,comen,mes);
		}
	
		boolean rs=claseComentarios.comentaApro(chr);
		String nomUsuSel="";
		Usuario usuSelect = ClaseUsuario.buscaUsuario(userToApro);
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(usu,mes);
		ArrayList<Usuario> arrJefes =ClaseUsuario.consultaJefes();
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(usu,mes);
		String numApro="", aprob1="", aprob2="", aprob3="", aprob4="", mesA1="",raprob1="", raprob2="", raprob3="", raprob4="", nbApro1="", nbApro2="", nbApro3="", nbApro4="", estat ="", usuApro1="",usuApro2="",usuApro3="",usuApro4="";
		if(usuSelect!=null){
			nomUsuSel = usuSelect.getNombre();
		}
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
					numApro = hojaR.getAprobadores();
					usuApro1=hojaR.getUsuApro1();
					usuApro2=hojaR.getUsuApro2();
					usuApro3=hojaR.getUsuApro3();
					usuApro4=hojaR.getUsuApro4();
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
		   request.setAttribute("mesre2", new String(mes));
		   request.setAttribute("rapro1", new String(raprob1));
		   request.setAttribute("rapro2", new String(raprob2));
		   request.setAttribute("rapro3", new String(raprob3));
		   request.setAttribute("rapro4", new String(raprob4));
		   request.setAttribute("estApro", new String(estat));
		   request.setAttribute("nomUsuSel", new String(nomUsuSel));
		   request.setAttribute("numApro", new String(numApro));
		   request.setAttribute("usuApro1", new String(usuApro1));
		   request.setAttribute("usuApro2", new String(usuApro2));
		   request.setAttribute("usuApro3", new String(usuApro3));
		   request.setAttribute("usuApro4", new String(usuApro4));
		   request.setAttribute("usuario", new String(usSes));
		   request.setAttribute("noap", new String(numApro));
		   request.setAttribute("UsuSel", new String(usu));
		   
		   request.setAttribute("mesre", new String(mes));
		   request.setAttribute("usure", new String(usu));
		 
		 if(orig!=null && orig.equals("1")){
			 request.getRequestDispatcher("Aprobaciones.jsp").forward(request, response);
		 }else if(orig!=null && orig.equals("2")){
			 request.getRequestDispatcher("Aprobaciones2.jsp").forward(request, response);
		 }
		
	}

}
