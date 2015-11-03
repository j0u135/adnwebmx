package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.Email;

/**
 * Servlet implementation class ServCorreo
 */
@WebServlet("/ServCorreo")
public class ServCorreo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServCorreo() {
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
		
		String usuario="rbahena@10x.mx";
		String destino1="bahdiz@gmail.com";
		String destino2="badiz_7@hotmail.com";
		String calificacion="Aprobado/Denegado";
		String comentarios="Comentarios";
		String mes="mes calificado";
		String resultado="80%";
		
		
		//Linea para las solicitudes, se debera repetir de acuerdo a los usuarios a los que se debe enviar el correo
		Email e = new Email("correo que enviara","contrasena",destino1,"Este correo es generado por ADN \nEstimado "+destino1+"\nEl siguiente colaborador ha solicitado la aprobacion de su hoja de ruta\nUsuario: "+usuario+"\nResultado: "+resultado+"\nPor favor aprueba o rechace antes del cierre.");
        
		
		//Linea para rechazar o aprobar, esta solo sera para el usuario que solicito la aprobacion
		//Email e = new Email("correo","contrasena",usuario,"Este correo es generado por ADN \nEstimado "+usuario+"\n"+destino1+" ha "+calificacion+" la hoja de ruta del mes "+mes+"\nResultado: "+resultado+"\nCommentarios: "+comentarios+"\nPor favor, realice sus ajustes");
		
		
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
