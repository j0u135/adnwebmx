package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseUsuario;
import com.adn.conexion.Email;
import com.adn.conexion.claseComentarios;
import com.adn.controlador.Comentarios;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class solicitarApro
 */
@WebServlet("/solicitarApro")
public class solicitarApro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solicitarApro() {
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
		
		String usuario=request.getParameter("usap");
		String aproba1=request.getParameter("usap1");
		String aproba2=request.getParameter("usap2");
		String aproba3=request.getParameter("usap3");
		String aproba4=request.getParameter("usap4");
		String comentario = request.getParameter("comentSolicita");
		String mes=request.getParameter("usumes");
		String fecha=request.getParameter("fch20");
		String estatus="Solicitada";
		String valorRapro = "estatusazul";
		System.out.println("todos-"+usuario+" "+aproba1+" "+aproba2+" "+aproba3+" "+aproba4+" "+mes+" "+fecha);
		String idHojaRumbo = ClaseHojaRumbo.consultaIdHR(usuario, mes);
		if(aproba1!=""){
			Email e1 = new Email("sistema_adn@10x.mx","SistemaADN2015",aproba1,"Solicitud de aprobación","Este correo es generado por ADN \nEstimado "+aproba1+"\nEl siguiente colaborador ha solicitado la aprobacion de su hoja de ruta\nUsuario: "+usuario+"\n Comentarios: "+comentario+"\nPor favor aprueba o rechace antes del cierre.");
			if (e1.sendMail()){
  				System.out.print("si envia apro1");
  				Comentarios chr = new Comentarios(usuario,aproba1,comentario,mes,idHojaRumbo);
  				ClaseHojaRumbo.solicitudApro(estatus,fecha,mes,usuario,"rapro1",valorRapro);
  				boolean rs=claseComentarios.comentaApro(chr);
			}else{
				System.out.print("no envia apro1");
			}
		}
		if(aproba2!=""){
			Email e2 = new Email("sistema_adn@10x.mx","SistemaADN2015",aproba2,"Solicitud de aprobación","Este correo es generado por ADN \nEstimado "+aproba2+"\nEl siguiente colaborador ha solicitado la aprobacion de su hoja de ruta\nUsuario: "+usuario+"\n Comentarios: "+comentario+"\nPor favor aprueba o rechace antes del cierre.");
			if (e2.sendMail()){
	        	System.out.print("si envia apro2");
	        	Comentarios chr2 = new Comentarios(usuario,aproba1,comentario,mes,idHojaRumbo);
	        	ClaseHojaRumbo.solicitudApro(estatus,fecha,mes,usuario,"rapro2",valorRapro);
	        	boolean rs=claseComentarios.comentaApro(chr2);
	        }else{
	        	System.out.print("no envia apro2");
	        }
		}
		
		if(aproba3!=""){
			Email e3 = new Email("sistema_adn@10x.mx","SistemaADN2015",aproba3,"Solicitud de aprobación","Este correo es generado por ADN \nEstimado "+aproba3+"\nEl siguiente colaborador ha solicitado la aprobacion de su hoja de ruta\nUsuario: "+usuario+"\n Comentarios: "+comentario+"\nPor favor aprueba o rechace antes del cierre.");
			if (e3.sendMail()){
	        	System.out.print("si envia apro3");
	        	Comentarios chr3 = new Comentarios(usuario,aproba1,comentario,mes,idHojaRumbo);
	        	ClaseHojaRumbo.solicitudApro(estatus,fecha,mes,usuario,"rapro3",valorRapro);
	        	boolean rs=claseComentarios.comentaApro(chr3);
	        }else{
	        	System.out.print("no envia apro3");
	        }
		}
		if(aproba4!=""){
				Email e4 = new Email("sistema_adn@10x.mx","SistemaADN2015",aproba4,"Solicitud de aprobación","Este correo es generado por ADN \nEstimado "+aproba4+"\nEl siguiente colaborador ha solicitado la aprobacion de su hoja de ruta\nUsuario: "+usuario+"\n Comentarios: "+comentario+"\nPor favor aprueba o rechace antes del cierre.");
				if (e4.sendMail()){
		        	System.out.print("si envia apro4");
		        	Comentarios chr4 = new Comentarios(usuario,aproba1,comentario,mes,idHojaRumbo);
		        	ClaseHojaRumbo.solicitudApro(estatus,fecha,mes,usuario,"rapro4",valorRapro);
		        	boolean rs=claseComentarios.comentaApro(chr4);
		        }else{
		        	System.out.print("no envia apro4");
		        }		
		}
	
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro1(usuario,mes);
		ArrayList<Usuario> arrJefes =ClaseUsuario.consultaJefes();
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(usuario,mes);
		
		String numApro="",apro1="", apro2="", apro3="", apro4="", mesA1="",rapro1="", rapro2="", rapro3="", rapro4="", nbApro1="", nbApro2="", nbApro3="", nbApro4="",estat ="";
			if(arrHR!=null){
				HojaRumbo hr = arrHR.get(0);
				if(hr!=null){
					nbApro1=hr.getNbApro1();
					nbApro2=hr.getNbApro2();
					nbApro3=hr.getNbApro3();
					nbApro4=hr.getNbApro4();
					apro1 = hr.getApro1();
					apro2 = hr.getApro2();
					apro3 = hr.getApro3();
					apro4 = hr.getApro4();
					mesA1 = hr.getMes();
					rapro1 = hr.getRapro1();
					rapro2 = hr.getRapro2();
					rapro3 = hr.getRapro3();
					rapro4 = hr.getRapro4();
					estat = hr.getEstatus();
					numApro = hr.getAprobadores();
				}
			}
		   request.setAttribute("jefes", arrJefes);
		   request.setAttribute("comentarios", arrComents);
		   request.setAttribute("nbApro1", new String(nbApro1));
		   request.setAttribute("nbApro2", new String(nbApro2));
		   request.setAttribute("nbApro3", new String(nbApro3));
		   request.setAttribute("nbApro4", new String(nbApro4));
		   request.setAttribute("apro1", new String(apro1));
		   request.setAttribute("apro2", new String(apro2));
		   request.setAttribute("apro3", new String(apro3));
		   request.setAttribute("apro4", new String(apro4));
		   request.setAttribute("mesA1", new String(mesA1));
		   request.setAttribute("rapro1", new String(rapro1));
		   request.setAttribute("rapro2", new String(rapro2));
		   request.setAttribute("rapro3", new String(rapro3));
		   request.setAttribute("rapro4", new String(rapro4));
		   request.setAttribute("mesre", new String(mes));
		   request.setAttribute("usure", new String(usuario));
		   request.setAttribute("estApro", new String(estat));
		   request.setAttribute("numApro", new String(numApro));
		   
		   request.getRequestDispatcher("Aprobaciones.jsp").forward(request, response);
	}

}
