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
 * Servlet implementation class EliminaAprobador
 */
@WebServlet("/EliminaAprobador")
public class EliminaAprobador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaAprobador() {
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
		
		String usuario=request.getParameter("usuariohidenAE1");
		String aprobElim = request.getParameter("apElim");
		String mesre=request.getParameter("mesre");
		String usure=request.getParameter("usure");
		int con = 0;
		
		ArrayList<HojaRumbo> arrHR1=ClaseHojaRumbo.consultaApro2(usuario,mesre);
		if(arrHR1!=null){
			HojaRumbo hojR = arrHR1.get(0);
			if(hojR!=null && hojR.getEstatus()!=null && hojR.getEstatus().equals("Pendiente")){
				if(hojR.getAprobadores()!=null && hojR.getAprobadores()!=""){
					con = Integer.parseInt(hojR.getAprobadores());
					String ap="",ap1="",ap2="",ap3="";
					String apValor="",apValor1="",apValor2="",apValor3="";
					int valoresEnviados=0;
					switch(con){
					case 1:
						if(aprobElim.equals(hojR.getApro1())){
							con=0;
							ap="apro1";
							apValor = "";
							valoresEnviados=1;
						}
						break;
					case 2:
						if(aprobElim.equals(hojR.getApro1())){
							con = 1;
							ap="apro1";
							apValor = hojR.getApro2();
							ap1="apro2";
							apValor1="";
							valoresEnviados=2;
						}else if(aprobElim.equals(hojR.getApro2())){
							con = 1;
							ap="apro2";
							apValor = "";
							valoresEnviados=1;
						}
						break;
					case 3:
						if(aprobElim.equals(hojR.getApro1())){
							con = 2;
							ap="apro1";
							apValor = hojR.getApro2();
							ap1="apro2";
							apValor1 = hojR.getApro3();
							ap2="apro3";
							apValor2 = "";
							valoresEnviados=3;
						}else if(aprobElim.equals(hojR.getApro2())){
							con = 2;
							ap="apro1";
							apValor = hojR.getApro1();
							ap1="apro2";
							apValor1 = hojR.getApro3();
							ap2="apro3";
							apValor2 = "";
							valoresEnviados=3;
						}else if(aprobElim.equals(hojR.getApro3())){
							con = 2;
							ap="apro3";
							apValor = "";
							valoresEnviados=1;
						}
						break;
					case 4:
						if(aprobElim.equals(hojR.getApro1())){
							con = 3;
							ap="apro1";
							apValor = hojR.getApro2();
							ap1="apro2";
							apValor1 = hojR.getApro3();
							ap2="apro3";
							apValor2 = hojR.getApro4();
							ap3="apro4";
							apValor3="";
							valoresEnviados=4;
						}else if(aprobElim.equals(hojR.getApro2())){
							con = 3;
							ap="apro2";
							apValor = hojR.getApro3();
							ap1="apro3";
							apValor1 = hojR.getApro4();
							ap2="apro4";
							apValor2 = "";
							valoresEnviados=3;
						}else if(aprobElim.equals(hojR.getApro3())){
							con = 3;
							ap="apro3";
							apValor = hojR.getApro4();
							ap1="apro4";
							apValor1="";
							valoresEnviados=2;
						}else if(aprobElim.equals(hojR.getApro4())){
							con = 3;
							ap="apro4";
							apValor = "";
							valoresEnviados=1;
						}
						break;
					}
					//System.out.println("Usuario a eliminar: "+usuario+" mes: "+mesre+"mes:"+aprobElim);
					ClaseHojaRumbo.EliminaAprobador(usuario,mesre,ap,apValor,ap1,apValor1,ap2,apValor2,ap3,apValor3,valoresEnviados,con);
				}
			}
		}
		
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(usuario,mesre);
		ArrayList<Usuario> arrJefes =ClaseUsuario.consultaJefes();
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(usuario,mesre);
		String numApro="",aprob1="", aprob2="", aprob3="", aprob4="", mesA1="",raprob1="", raprob2="", raprob3="", raprob4="", nbApro1="", nbApro2="", nbApro3="", nbApro4="", estat="";
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
		   request.setAttribute("estApro", new String(estat));
		   request.setAttribute("numApro", new String(numApro));
		
		 request.setAttribute("mesre", new String(mesre));
		 request.setAttribute("usure", new String(usure));
		request.getRequestDispatcher("Aprobaciones.jsp").forward(request, response);
	}

}
