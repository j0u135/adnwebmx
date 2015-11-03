package com.adn.vista;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseDashboard;
import com.adn.conexion.ClaseIndicador;
import com.adn.controlador.Dashboard;
import com.adn.controlador.Indicador;

/**
 * Servlet implementation class guardarDashboard
 */
@WebServlet("/guardarDashboard")
public class guardarDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guardarDashboard() {
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
		// TODO Auto-generated method stub
		
		 String nombre=request.getParameter("nombreDashboard");
		 String contenido=request.getParameter("dashboardGuardar");
		 String indicadorDash=request.getParameter("indicadorDash");
		 String usuario=request.getParameter("usuarioLogueado");
		 String activo="true";
		
		 
		 System.out.println(nombre);
		 System.out.println(contenido);
		 System.out.println(indicadorDash);
		 
		
		 
		  if(!nombre.equalsIgnoreCase("") && !contenido.equalsIgnoreCase("")){
		   
			   Dashboard nuDashboard=new Dashboard(nombre, contenido, activo);
			   //boolean desactiva=ClaseDashboard.setDashboard("false");
			   boolean existe=ClaseDashboard.revisaExistente(indicadorDash, usuario);
			   if(existe){
				   //Update
				   boolean in=ClaseDashboard.updateDashboard(nuDashboard, indicadorDash, usuario);
				   if(in){
					   System.out.println("si guarda Dash");
					   request.getRequestDispatcher("DashBoardADN.jsp").forward(request, response);
				   }else{
					   System.out.println("no guarda Dash");
					   request.getRequestDispatcher("DashBoardADN.jsp").forward(request, response);
				   }
				   
				   
			   }else{
				   
				   boolean in=ClaseDashboard.agregarDashboard(nuDashboard,indicadorDash,usuario);
				   if(in){
					   System.out.println("si guarda Dash");
					   request.getRequestDispatcher("DashBoardADN.jsp").forward(request, response);
				   }else{
					   System.out.println("no guarda Dash");
					   request.getRequestDispatcher("DashBoardADN.jsp").forward(request, response);
				   }
				   
			   }
		  
		  }
		
	}

}
