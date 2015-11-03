package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClaseDepartamento;
import com.adn.controlador.Area;
import com.adn.controlador.Departamento;

/**
 * Servlet implementation class RegistroRol
 */
@WebServlet("/RegistroRol")
public class RegistroRol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroRol() {
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
		  String descPuesto=request.getParameter("desc");
		  String cdArea=request.getParameter("cbArea");
		  String area=request.getParameter("area");
		  String descArea=request.getParameter("descArea");
		  String usuario = request.getParameter("usuSes");
		  ArrayList<Area> areas = null;
		  
		  if(area!=null && !area.equalsIgnoreCase("")){
			  Area nuevaArea=new Area(area,descArea);
			  boolean in=ClaseArea.agregarArea(nuevaArea); 
			   if(in){
				   //Busca areas
		            areas = ClaseArea.consultar();
				   if(areas!=null){
					   request.setAttribute("areas", areas);
				   }else{
					   request.setAttribute("areas", "");
				   }
				   request.getRequestDispatcher("Conf-4.jsp").forward(request, response);
			   }else{
				   areas = ClaseArea.consultar();
				   if(areas!=null){
					   request.setAttribute("areas", areas);
				   }else{
					   request.setAttribute("areas", "");
				   }
			    request.getRequestDispatcher("Conf-4.jsp").forward(request, response);
			   }
		  }else if(cdArea!="" && nombre!=""){
			  int idArea = Integer.parseInt(cdArea);
			  Calendar fechaA = Calendar.getInstance();
			  int mesInt = fechaA.get(Calendar.MONTH)+1;
			  int ano = fechaA.get(Calendar.YEAR);
			  int dia = fechaA.get(Calendar.DATE);
			  String fechaAlta= dia+"/"+mesInt+"/"+ano;
			  Departamento nuevoDepto = new Departamento(idArea, nombre, descPuesto,fechaAlta,usuario);
			  boolean agrego=ClaseDepartamento.agregarDepto(nuevoDepto);
			  if(agrego){
				   //Busca areas
		            areas = ClaseArea.consultar();
				   if(areas!=null){
					   request.setAttribute("areas", areas);
				   }else{
					   request.setAttribute("areas", "");
				   }
				   request.getRequestDispatcher("Conf-4.jsp").forward(request, response);
			   }else{
				   areas = ClaseArea.consultar();
				   if(areas!=null){
					   request.setAttribute("areas", areas);
				   }else{
					   request.setAttribute("areas", "");
				   }
			    request.getRequestDispatcher("Conf-4.jsp").forward(request, response);
			   }
		  }
		
	}

}
