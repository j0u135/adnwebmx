package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClaseDepartamento;
import com.adn.conexion.ClasePuestos;
import com.adn.conexion.ClaseRoles;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Area;
import com.adn.controlador.Departamento;
import com.adn.controlador.Puesto;
import com.adn.controlador.Rol;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class buscaUsuario
 */
@WebServlet("/buscaUsuario")
public class buscaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buscaUsuario() {
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
		
		 String user=request.getParameter("usuarioBuscado");
		  if(!user.equalsIgnoreCase("")){
		  
		   Usuario usr=ClaseUsuario.buscaUsuario(user);
		   ArrayList<Area> areas = null;
           ArrayList<Rol> roles = null;
           ArrayList<Usuario> jefes = null;
           ArrayList<Departamento> deptos = null;
           ArrayList<Puesto> puestos = null;
           Departamento depto = null;
           
		   //Busca areas
           areas = ClaseArea.consultar();
           jefes = ClaseUsuario.consultaJefes();
           roles = ClaseRoles.consultar();

           request.setAttribute("areas", areas);
		   request.setAttribute("jefes", jefes);
		   request.setAttribute("roles", roles);
		   
		  //repetido=true;
		   if(usr!=null){
			   	request.setAttribute("user", new String(user));
				request.setAttribute("clave", new String(usr.getPassword()));
				request.setAttribute("nombre", new String(usr.getNombre()));
				request.setAttribute("correo", new String(usr.getCorreo()));
				if(usr.getArea()!= null && !usr.getArea().equals("")){
					int idArea = ClaseArea.consultarIdArea(usr.getArea());
					int idPuesto = Integer.parseInt(ClasePuestos.buscaIdPuesto(usr.getPuesto()));
					deptos = ClaseDepartamento.buscaDepartamento(idArea);
					depto = ClaseDepartamento.buscaDeptoXpuesto(usr.getPuesto(), idArea);
					puestos = ClasePuestos.buscaPuestos(idArea, depto.getIdDepto());
					String strIdArea = idArea+"";
					String strIdPuesto = idPuesto+"";
					String strIdDepto = depto.getIdDepto()+"";
					request.setAttribute("area", strIdArea);
					request.setAttribute("puesto", strIdPuesto);
					request.setAttribute("depto", strIdDepto);
				}
				request.setAttribute("jefe", new String(usr.getJefeDirecto()));
				request.setAttribute("tipo", new String(usr.getTipoUsuario()));
				request.setAttribute("perAcargo", new String(usr.getPersonalCargo()));
				request.setAttribute("autorizador", new String(usr.getAutorizador()));
				request.setAttribute("deptos", deptos);
		        request.setAttribute("puestos", puestos);
				request.setAttribute("actualizar",new String("busco"));
				request.setAttribute("mensaje",new String("Ok"));
				request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
		   }else{
			    request.setAttribute("user", new String(""));
			    request.setAttribute("depto", 0);
			    request.setAttribute("clave", new String(""));
			    request.setAttribute("nombre", new String(""));
			    request.setAttribute("correo", new String(""));
			    request.setAttribute("puesto", new String(""));
			    request.setAttribute("area", new String(""));
			    request.setAttribute("jefe", new String(""));
			    request.setAttribute("tipo", new String(""));
			    request.setAttribute("perAcargo", new String(""));
			    request.setAttribute("autorizador", new String(""));
			    request.setAttribute("deptos", deptos);
		        request.setAttribute("puestos", puestos);
			    request.setAttribute("actualizar",new String("busco"));
			    request.setAttribute("mensaje",new String("No se encontro el usuario"));
			    request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
		   }
			   
		   }
	}

}
