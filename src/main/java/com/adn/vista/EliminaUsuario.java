package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClaseRoles;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Area;
import com.adn.controlador.Rol;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class buscaUsuario
 */
@WebServlet("/eliminaUsuario")
public class EliminaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaUsuario() {
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
		
		 String user=request.getParameter("usuarioBusc");
		 System.out.println("Usuario a eliminar: "+user);
		  if(user!=null && !user.equalsIgnoreCase("")){
		  
		   Usuario usr=ClaseUsuario.buscaUsuario(user);
		   ArrayList<Area> areas = null;
           ArrayList<Rol> roles = null;
           ArrayList<Usuario> jefes = null;
           
           
		   //Busca areas
           areas = ClaseArea.consultar();
           jefes = ClaseUsuario.consultaJefes();
           roles = ClaseRoles.consultar();
		   if(areas!=null || jefes!=null || roles!=null){
			   request.setAttribute("areas", areas);
			   request.setAttribute("jefes", jefes);
			   request.setAttribute("roles", roles);
		   }else{
			   request.setAttribute("areas", "");
			   request.setAttribute("puestos", "");
			   request.setAttribute("roles", "");
		   }
		  //repetido=true;
		   if(usr!=null){
				boolean eliminado = ClaseUsuario.eliminaUsuario(usr.getUsername());
				if(eliminado){
					request.setAttribute("user", new String(""));
					request.setAttribute("actualizar",new String("busco"));
					request.setAttribute("mensaje",new String("Usuario eliminado correctamente"));
				}else{
					request.setAttribute("user", new String(user));
					request.setAttribute("actualizar",new String("busco"));
					request.setAttribute("mensaje",new String("Ocurrio un error al eliminar el usuario"));
				}
				request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
		   }else{
			    request.setAttribute("user", new String(""));
			    request.setAttribute("clave", new String(""));
			    request.setAttribute("nombre", new String(""));
			    request.setAttribute("correo", new String(""));
			    request.setAttribute("puesto", new String(""));
			    request.setAttribute("area", new String(""));
			    request.setAttribute("nombreJefe", new String(""));
			    request.setAttribute("tipo", new String(""));
			    request.setAttribute("actualizar",new String("busco"));
			    request.setAttribute("mensaje",new String("No se encontro el usuario a eliminar"));
			    request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
		   }
			   
		   }else{
			   request.setAttribute("user", new String(""));
			    request.setAttribute("clave", new String(""));
			    request.setAttribute("nombre", new String(""));
			    request.setAttribute("correo", new String(""));
			    request.setAttribute("puesto", new String(""));
			    request.setAttribute("area", new String(""));
			    request.setAttribute("nombreJefe", new String(""));
			    request.setAttribute("tipo", new String(""));
			    request.setAttribute("actualizar",new String("busco"));
			    request.setAttribute("mensaje",new String("No se encontro el usuario a eliminar"));
			    request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
		   }
	}

}
