package com.adn.vista;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.Operaciones;

/**
 * Servlet implementation class pruebaServlet
 */
@WebServlet("/pruebaServlet")
public class pruebaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pruebaServlet() {
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
		 String dato=request.getParameter("usuariologin");
		 String busqueda="";
		 
		 Operaciones obj=new Operaciones();
		 busqueda="Update usuarios set Visitas= Visitas+1 where User='"+dato+"'";
		 boolean algo=obj.insertar(busqueda);
		 
		 if(algo){
			 
			 System.out.print("Contador agregado");
			 
			 request.setAttribute("dato", new String("Contador incrementado"));
			 request.getRequestDispatcher("Index.jsp").forward(request, response);
			 
		 }
		 
		
	}

}
