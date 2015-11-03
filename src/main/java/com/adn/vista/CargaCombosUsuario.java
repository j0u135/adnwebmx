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
@WebServlet("/cargaCombo")
public class CargaCombosUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaCombosUsuario() {
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
		
		 String user=request.getParameter("usuBusc");
		 String nombre=request.getParameter("nbUsu");
		 String correo=request.getParameter("correoUsu");
		 String persCargo = request.getParameter("persCargoUsu");
		 String autorizador = request.getParameter("autoUsu");
		 String area=request.getParameter("areaUsu");
		 String depto =request.getParameter("deptoUsu");
		 String puesto=request.getParameter("puestoUsu");
		 String tipo=request.getParameter("tipoUsu");
		 String jefe=request.getParameter("jefeUsu");
		 String opCombo =request.getParameter("opUsu");
		 String password=request.getParameter("pssUsu");
		 System.out.println(password);
		 ArrayList<Area> areas = null;
         ArrayList<Rol> roles = null;
         ArrayList<Usuario> jefes = null;
         ArrayList<Departamento> deptos = null;
         ArrayList<Puesto> puestos = null;
		 
			 if(!opCombo.equals("") && opCombo.equals("Deptos")){
				 if(area!= null && !area.equals("")){
					 int idArea = Integer.parseInt(area);
					 deptos = ClaseDepartamento.buscaDepartamento(idArea);
				 }
			 }else if(opCombo.equals("Puestos")){
				 if(area!= null && !area.equals("") && depto!=null && !depto.equals("")){
					 int idArea = Integer.parseInt(area);
					 int idDepto = Integer.parseInt(depto);
					 deptos = ClaseDepartamento.buscaDepartamento(idArea);
					 puestos = ClasePuestos.buscaPuestos(idArea, idDepto);
				 }
			 }
			 request.setAttribute("deptos", deptos);
			 request.setAttribute("puestos", puestos);
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
		   
		   if(!user.equalsIgnoreCase("")){
			   	request.setAttribute("user", new String(user));
				request.setAttribute("clave", new String(password));
				request.setAttribute("nombre", new String(nombre));
				request.setAttribute("correo", new String(correo));
				request.setAttribute("puesto", new String(puesto));
				request.setAttribute("depto", new String(depto));
				request.setAttribute("area", new String(area));
				request.setAttribute("jefe", new String(jefe));
				request.setAttribute("tipo", new String(tipo));
				request.setAttribute("perAcargo", new String(persCargo));
				request.setAttribute("autorizador", new String(autorizador));
				request.setAttribute("actualizar",new String("busco"));
				request.setAttribute("password", password);
				request.setAttribute("mensaje",new String("Ok"));
			
			    request.getRequestDispatcher("Conf-2.jsp").forward(request, response);   
		   }else{
			   request.setAttribute("deptos", deptos);
				 request.setAttribute("puestos", puestos);
			    request.setAttribute("areas", areas);
			    request.setAttribute("jefes", jefes);
			    request.setAttribute("roles", roles);
			    request.setAttribute("user", new String(user));
				request.setAttribute("clave", new String(password));
				request.setAttribute("nombre", new String(nombre));
				request.setAttribute("correo", new String(correo));
				request.setAttribute("puesto", new String(puesto));
				request.setAttribute("depto", new String(depto));
				request.setAttribute("area", new String(area));
				request.setAttribute("jefe", new String(jefe));
				request.setAttribute("tipo", new String(tipo));
				request.setAttribute("perAcargo", new String(persCargo));
				request.setAttribute("autorizador", new String(autorizador));
				request.setAttribute("actualizar",new String("busco"));
				request.setAttribute("password", password);
				request.setAttribute("mensaje",new String("Ok"));
			
			    request.getRequestDispatcher("Conf-2.jsp").forward(request, response); 
		   }
	}

}
