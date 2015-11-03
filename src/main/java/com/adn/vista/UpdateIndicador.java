package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateIndicador
 */
@WebServlet("/UpdateIndicador")
public class UpdateIndicador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateIndicador() {
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
		
		  String nombre=request.getParameter("nombre");
		  String definicion=request.getParameter("definicion");
		  String formula=request.getParameter("formula");
		  String frecuencia=request.getParameter("frecuencia");
		  String tipo=request.getParameter("tipo");
		  String unidad=request.getParameter("unidad");
		  String q1=request.getParameter("q1");
		  String q2=request.getParameter("q2");
		  String q3=request.getParameter("q3");
		  String q4=request.getParameter("q4");
		  String ene=request.getParameter("ene");
		  String feb=request.getParameter("feb");
		  String mar=request.getParameter("mar");
		  String abr=request.getParameter("abr");
		  String may=request.getParameter("may");
		  String jun=request.getParameter("jun");
		  String jul=request.getParameter("jul");
		  String ago=request.getParameter("ago");
		  String sep=request.getParameter("sep");
		  String oct=request.getParameter("oct");
		  String nov=request.getParameter("nov");
		  String dic=request.getParameter("dic");
		  String semana=request.getParameter("semana");
		  String rolVisible=request.getParameter("rolVisible");
		  //Nuevos
		  String fuenteDatos=request.getParameter("fuenteDatos");
		  String respEmision=request.getParameter("responsableEmision");
		  String distribucion=request.getParameter("distribucion");
		  
		  if(!nombre.equalsIgnoreCase("") && !definicion.equalsIgnoreCase("") && !formula.equalsIgnoreCase("") && !frecuencia.equalsIgnoreCase("") && !tipo.equalsIgnoreCase("") && !unidad.equalsIgnoreCase("")){
//			  Indicador nuIndicador=new Indicador(nombre, definicion, formula, frecuencia, tipo, unidad,q1 ,q2 ,q3 ,q4, semana, ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic, rolVisible, fuenteDatos,distribucion,respEmision);
		   boolean in=true;
		   //=ClaseIndicador.update(nuIndicador, nombre);
		   if(in){
		    request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
			   //PrintWriter out=response.getWriter();
			  // out.println("si funciona");
		   }else{
			   request.setAttribute("variableEnviada", new String("Ocurrio un error, por favor verificar la traza"));
			   request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
		   }
		  }

		
	
	}

}
