package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.controlador.HojaRumbo;

/**
 * Servlet implementation class GuardaAprobadores2
 */
@WebServlet("/GuardaAprobadores2")
public class GuardaAprobadores2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardaAprobadores2() {
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
		
		String mes=request.getParameter("mesauno1");
//		String cnt=request.getParameter("conta2");
		String usuario=request.getParameter("nombreeq1");
		String apro1=request.getParameter("aproauno1");
		String apro2=request.getParameter("aproados1");
		String apro3=request.getParameter("aproatres1");
		String apro4=request.getParameter("aproacua1");
		String div1=request.getParameter("dv1");
		String div2=request.getParameter("dv2");
		String div3=request.getParameter("dv3");
		String div4=request.getParameter("dv4");
		String mesre2=request.getParameter("mesre2");
		String usure2=request.getParameter("usure2");
		String estatus="";
		System.out.println("--"+div1+div2+div3+div4);
		System.out.println("-|-"+apro1+apro2+apro3+apro4);
		int con1=0;
		int con2=0;
		int con3=0;
		int con4=0;
		int cont=0;
		int con=0;
		int res=0;
		if(!apro1.equals(""))con=con+1;
		if(!apro2.equals(""))con=con+1;
		if(!apro3.equals(""))con=con+1;
		if(!apro4.equals(""))con=con+1;
		System.out.println("-"+con);
		res=100/con;
		System.out.println("res"+res);
		if(div1.equals("estatusverde")){con1=res;}else{con1=0;};
		if(div2.equals("estatusverde")){con2=res;}else{con2=0;};
		if(div3.equals("estatusverde")){con3=res;}else{con3=0;};
		if(div4.equals("estatusverde")){con4=res;}else{con4=0;};
		System.out.println("cont"+cont);		
		cont=(con1+con2+con3+con4);
		if(cont==100){
			estatus="Aprobada";
		}else{
			estatus="Pendiente";
		}
		
		System.out.println(apro1+apro2+apro3+apro4+mes+usuario);
		HojaRumbo hr= new HojaRumbo();
		ClaseHojaRumbo.agregaAprobadores2(apro1,apro2,apro3,apro4,con,cont,mes,usuario,estatus);
			request.setAttribute("mesre2", new String(mesre2));
		 request.setAttribute("usure2", new String(usure2));
		 request.setAttribute("variableAlta", new String("Dandoalta2"));
		request.getRequestDispatcher("Interfaz7.jsp").forward(request, response);
	}

}