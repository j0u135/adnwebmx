package com.adn.vista;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.controlador.Area;

/**
 * Servlet implementation class GuardaArea
 */
@WebServlet("/GuardaArea")
public class GuardaArea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardaArea() {
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
		String area=request.getParameter("area");
		 // String descripcion=request.getParameter("");
		  System.out.println(area);
		  if(!area.equalsIgnoreCase("")){
			  Area a1 = new Area(area);
		   boolean in=ClaseArea.agregarArea(a1);
		   if(in){
		    //request.getRequestDispatcher("Mensaje.jsp").forward(request, response);
			   request.getRequestDispatcher("Areas.jsp").forward(request, response);
		   }else{
		    PrintWriter out=response.getWriter();
		    out.println("No se pudo dar de Alta");
		   }
		  }
	}

}
