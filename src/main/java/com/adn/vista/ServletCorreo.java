package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.Email;


/**
 * Servlet implementation class ServletCorreo
 */
@WebServlet("/ServletCorreo")
public class ServletCorreo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCorreo() {
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
		  
			String numero=request.getParameter("graficaConfigurada");
			String contenido=request.getParameter("valoresAlertas"+numero);
			String usuarioCorreo=request.getParameter("usuarioCorreo");
			
			System.out.print("graficaconfigurada "+numero+" contenido "+contenido+" usuario "+usuarioCorreo);
			Email e = new Email("cuentacorreo@correo.com","contraseñaCorreo",usuarioCorreo,"Este correo es generado por ADN \nEl Indicador NombreIndicador tiene las siguientes alertas:\n"+contenido);
	        if (e.sendMail()){
	         
	        	System.out.print("si envia");
	        	//Con esta linea el servlet refrescara la pagina, con lo cual se perderan las graficas.
	        	//Se debe realizar el guardado del dashboard tal como esta, despues ejecutar el envio de mail y regresar
	        	//request.getRequestDispatcher("DashBoardADN.jsp").forward(request, response);
	        
	        }else{
	          
	        	System.out.print("no envia");
	        }

	 }
}
