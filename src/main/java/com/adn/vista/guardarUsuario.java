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
 * Servlet implementation class guardarUsuario
 */
@WebServlet("/guardarUsuario")
public class guardarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guardarUsuario() {
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
		
		 int idarea=Integer.parseInt(request.getParameter("area"));
		 String password=request.getParameter("password");
		 String correo=request.getParameter("correo");
		 String jefeDirecto=request.getParameter("jefe");
		 String nombre=request.getParameter("nombre");
		 String idpuesto=request.getParameter("puesto");
		 String tipoUsuario=request.getParameter("tipoUsuario");
		 String user=request.getParameter("usuario");
		 String usrAct=request.getParameter("usrAct");
		 String dashboard=request.getParameter("");
		 String personalAcargo=request.getParameter("personal");
		 String autorizador = request.getParameter("autorizador");
		 String actualizar = request.getParameter("actualizar");
		 if(actualizar.equals("busco")){
			 user = usrAct;
		 }
		 if(tipoUsuario == null){
			 tipoUsuario = "3";
		 }
		 
		 String area = ClaseArea.consultarIdArea(idarea);
		 //String puesto = ClasePuestos.buscaNbPuesto(idpuesto);
		 
		// System.out.println(nombre+" "+correo+" "+user+" "+tipoUsuario+" "+area);
		  if(user != null && tipoUsuario!=null && !nombre.equalsIgnoreCase("") && !correo.equalsIgnoreCase("") && !user.equalsIgnoreCase("") && !tipoUsuario.equalsIgnoreCase("") && !area.equalsIgnoreCase("")){
		   Usuario nuevoUsuario=new Usuario(user,  password,  dashboard,  correo,  area,  jefeDirecto,  nombre, personalAcargo, idpuesto,  tipoUsuario);
		   nuevoUsuario.setAutorizador(autorizador);
		   //Usuario(String username, String password, String dashboard, String correo, String area, String jefeDirecto, String nombre, String personalCargo, String puesto, String tipoUsuario ) {
		   boolean repetido=ClaseUsuario.verificaRepetido(nuevoUsuario);
		  //repetido=true;
		   System.out.println("Repetido: "+repetido);
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
		   
		   if(repetido && actualizar.equals("busco")){
			   //Aviso de que el usuario esta repetido, se esta validando por correo electronico
			   boolean nuUsuario=ClaseUsuario.actualizarUsuario(nuevoUsuario);
			   if(nuUsuario){
				   	request.setAttribute("user", new String(""));
					request.setAttribute("nombre", new String(""));
					request.setAttribute("correo", new String(""));
					request.setAttribute("puesto", new String(""));
					request.setAttribute("area", new String(""));
					request.setAttribute("jefe", new String(""));
					request.setAttribute("tipo", new String(""));
					request.setAttribute("personal", new String(""));
					request.setAttribute("autorizador", new String(""));
				   request.setAttribute("variableEnviada", new String("Usuario actualizado correctamente"));   
			   }else{
				   request.setAttribute("variableEnviada", new String("No se pudo actualizar el usuario, intente nuevamente"));
			   }			   
			   request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
			   //System.out.print("repetido");
			   //Falta pasar los datos enviados
			   
		   }else{
			   if(!password.equalsIgnoreCase("")){
				   boolean nuUsuario=ClaseUsuario.agregarUsuario(nuevoUsuario);
				   if(nuUsuario){
					   System.out.println("si guarda");
					   	request.setAttribute("user", new String(""));
						request.setAttribute("nombre", new String(""));
						request.setAttribute("correo", new String(""));
						request.setAttribute("puesto", new String(""));
						request.setAttribute("area", new String(""));
						request.setAttribute("jefe", new String(""));
						request.setAttribute("tipo", new String(""));
						request.setAttribute("personal", new String(""));
						request.setAttribute("autorizador", new String(""));
					   request.setAttribute("variableEnviada", new String("El usuario se guardo correctamente"));
					   request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
				   }else{
					   System.out.println("no guardo");
				    //PrintWriter out=response.getWriter();
					   request.setAttribute("variableEnviada", new String("No se pudo guardar el usuario, intente nuevamente"));
					   request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
				    //out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud."+nombre+" "+definicion+" "+formula+" "+frecuencia+" "+tipo+" "+unidad+" "+q1+" ");
				   }
			   }
		   }
		   
		  }else{
			  request.setAttribute("variableEnviada", new String("Error al guardar, intente nuevamente"));
			  request.getRequestDispatcher("Conf-2.jsp").forward(request, response);
		  }
	}
}
