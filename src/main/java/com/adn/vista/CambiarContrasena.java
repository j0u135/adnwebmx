package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class guardarUsuario
 */
@WebServlet("/cambiarContrasena")
public class CambiarContrasena extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiarContrasena() {
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
		
		 String user=request.getParameter("user");
		 String userAct=request.getParameter("usrAct");
		 String password=request.getParameter("password");
		 String psswNew=request.getParameter("conpassword");
		 String psswNew1 = request.getParameter("conpassword1");
		 String paso = request.getParameter("paso");
		 // System.out.println(userAct +" - "+password+" - " +psswNew+" - " + psswNew1);
		 String clave="";
		 String valido = "";
	
		 if(paso!=""){
			 if(paso.equals("validar")){
				 Usuario usr=ClaseUsuario.buscaUsuario(user);
				  //repetido=true;  
				   if(usr != null){
					   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
					   clave = usr.getPassword();
					   if(password.equals(clave)){
						   valido = "Ok";
					   }else{
						   valido = "No";
					   }
				   }
					 request.setAttribute("user", new String(user));
					 request.setAttribute("clave", new String(clave));
					 request.setAttribute("valido", new String(valido));
					 request.getRequestDispatcher("Conf-1.jsp").forward(request, response);
				 
			 }else if(paso.equals("guardar")){
				 if(userAct!=null && psswNew!=null && !userAct.equalsIgnoreCase("") && !psswNew.equalsIgnoreCase("")){
					   Usuario nuevoUsuario=new Usuario();
					   boolean actualizo;
					   nuevoUsuario.setUsername(userAct);
					   nuevoUsuario.setPassword(psswNew);
					   actualizo = ClaseUsuario.actualizaPss(nuevoUsuario);
					   System.out.println("Actualizo: "+ actualizo);
					   request.setAttribute("user", new String(userAct));
					   request.setAttribute("clave", new String(psswNew));
					   request.setAttribute("actualizo", new Boolean(actualizo));
					   request.getRequestDispatcher("Conf-1.jsp").forward(request, response);
				 }else{
					   request.setAttribute("actualizo", new Boolean(false));
					   request.getRequestDispatcher("Conf-1.jsp").forward(request, response);
				 }
			 }
		 }
	}
}
