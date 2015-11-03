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
 * Servlet implementation class EliminaAprobadores2
 */
@WebServlet("/EliminaAprobadores2")
public class EliminaAprobadores2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaAprobadores2() {
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
		String aproe1
		=request.getParameter("nombreea1");
		String mesea2=request.getParameter("mesea2");
		String apro=request.getParameter("aproe1");
		
		String div1=request.getParameter("div121");
		String div2=request.getParameter("div122");
		String div3=request.getParameter("div123");
		String div4=request.getParameter("div124");
		String ap1=request.getParameter("aproaa1");
		String ap2=request.getParameter("aproaa2");
		String ap3=request.getParameter("aproaa3");
		String ap4=request.getParameter("aproaa4");
		String mesre2=request.getParameter("mesre2");
		String usure2=request.getParameter("usure2");
		String estatus="";
		System.out.println("--"+div1+div2+div3+div4);
		System.out.println("-|-"+ap1+ap2+ap3+ap4);
		int con1=0;
		int con2=0;
		int con3=0;
		int con4=0;
		int cont=0;
		int con=0;
		int res=0;
		if(!ap1.equals(""))con=con+1;
		if(!ap2.equals(""))con=con+1;
		if(!ap3.equals(""))con=con+1;
		if(!ap4.equals(""))con=con+1;
		System.out.println("-"+con);
		cont=100/con;
		System.out.println("res"+res);
		if(div1.equals("estatusverde")){con1=res;}else{con1=0;};
		if(div2.equals("estatusverde")){con2=res;}else{con2=0;};
		if(div3.equals("estatusverde")){con3=res;}else{con3=0;};
		if(div4.equals("estatusverde")){con4=res;}else{con4=0;};
		System.out.println("cont"+cont);		
//		cont=(con1+con2+con3+con4);
		System.out.println("doble cont"+cont);
		if(cont==100){
			estatus="Aprobada";
		}else{
			estatus="Pendiente";
		}
		
		System.out.println("-a"+apro+aproe1+mesea2);
		HojaRumbo hr= new HojaRumbo();
		ClaseHojaRumbo.EliminaAprobadores2(div1,div2,div3,div4,apro,mesea2,aproe1,cont,con,estatus);
		request.setAttribute("mesre2", new String(mesre2));
		 request.setAttribute("usure2", new String(usure2));
		 request.setAttribute("variableAlta", new String("Dandobaja2"));
		request.getRequestDispatcher("Interfaz7.jsp").forward(request, response);
	}

}
