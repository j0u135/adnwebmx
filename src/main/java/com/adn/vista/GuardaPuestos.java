package com.adn.vista;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClasePuestos;
import com.adn.controlador.Puesto;

/**
 * Servlet implementation class GuardaArea
 */
@WebServlet("/GuardaPuestos")
public class GuardaPuestos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardaPuestos() {
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
		String puesto=request.getParameter("puesto");
		boolean in=true;
		 // String descripcion=request.getParameter("");
		  System.out.println(puesto);
		  if(!puesto.equalsIgnoreCase("")){
			//  Puesto p1 = new Puesto(puesto);
		   //boolean in=ClasePuestos.agregarPuesto(p1);
		   if(in){
		    //request.getRequestDispatcher("Mensaje.jsp").forward(request, response);
			   request.getRequestDispatcher("Puestos.jsp").forward(request, response);
		   }else{
		    PrintWriter out=response.getWriter();
		    out.println("No se pudo dar de Alta");
		   }
		  }
	}

}
