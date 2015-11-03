package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Usuario;
import com.mx.diezx.adn.model.dao.IUsuarioDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;


/**
 * Servlet implementation class autenticUser
 */
@WebServlet("/autenticUser")
public class autenticUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public autenticUser() {
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
		
		 		
		 String usuario=request.getParameter("usuario");
		 String clave=request.getParameter("password");
		 String nombre="";
		 String puesto="";
		 String tipo="", correo="",autorizador="";
		 //System.out.println(usuario+ " " +clave);
		 if(!usuario.equalsIgnoreCase("") && !clave.equalsIgnoreCase("")){
		   Usuario user=new Usuario(usuario, clave);
		   
		   boolean in=ClaseUsuario.verifica(user); 
		  // System.out.println(in);
		   if(in){
			   Usuario usr = ClaseUsuario.buscaUsuario(usuario);
			   if(usr != null){
		   			usr.setUsername(usuario);
					nombre=usr.getNombre();
					correo=usr.getCorreo();
					puesto=usr.getPuesto();
					//area=rs.getString(5);
					tipo=usr.getTipoUsuario();
					autorizador=usr.getAutorizador();
					//nombreJefe=rs.getString(6);
					ClaseUsuario.incrementaVisita(usr);
			   }
			   DAOFactory factory = DAOFactory.getFactory(0);
			   IUsuarioDAO usuario_dao = factory.getUsuarioDAO();
			   com.mx.diezx.adn.model.Usuario usuario_nuevo_modelo = usuario_dao.getUsuarioByUserName(usuario);
			   
			   System.out.println(nombre);
			   System.out.println(puesto);
			   HttpSession sesionOk = request.getSession();
			   sesionOk.setAttribute("usuario",usuario);
			   sesionOk.setAttribute("nombre", new String(nombre));
			   sesionOk.setAttribute("puesto", new String(puesto));
			   sesionOk.setAttribute("tipo", new String(tipo));
			   sesionOk.setAttribute("correo", new String(correo));
			   sesionOk.setAttribute("autorizador", new String(autorizador));
			   sesionOk.setAttribute("usuario_sesion", usuario_nuevo_modelo);
			   //response.sendRedirect("/ADN/inicio");
			   //request.getRequestDispatcher("ADN/inicio").forward(request, response);
			   request.getRequestDispatcher("Index.jsp").forward(request, response);
			  
		   }else{
			   request.setAttribute("mensajeLogin", new String("Usuario Invalido"));
			   request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
		   }
		  }
	}
}	
