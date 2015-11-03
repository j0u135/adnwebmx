package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

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
 * Servlet implementation class apruebaUsuario
 */
@WebServlet("/apruebaUsuario")
public class apruebaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public apruebaUsuario() {
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
	
		String mailAprobador=request.getParameter("mailAprobador");//nombre
		String nbAprobador = request.getParameter("nombreAprobador");
		String usuarioSesion = request.getParameter("usuarioSes");
		String comentario = request.getParameter("comentApro");
		String usuAprobado=request.getParameter("acAprobado");	//naprobador
		String mes=request.getParameter("mesApro");		//mes
		String numApro = request.getParameter("numApro");
		String nomUsuSel="";
		
		String idHojaRumbo = ClaseHojaRumbo.consultaIdHR(usuAprobado, mes);
		String estatus="";
		Usuario uAprobado = ClaseUsuario.buscaUsuario(usuAprobado);
		if(uAprobado!= null){
			nomUsuSel = uAprobado.getNombre();
			Email e1 = new Email("sistema_adn@10x.mx","SistemaADN2015",uAprobado.getCorreo(),"Solicitud aprobada","Este correo es generado por ADN \nEstimado "+uAprobado.getNombre()+"\nEl siguiente aprobador a aprobado la hoja de ruta\nUsuario: "+nbAprobador+"\n Comentarios: "+comentario+"\n Favor de revisar.");
			if (e1.sendMail()){
				System.out.print("si envia apro1");
			}else{
				System.out.print("no envia apro1");
			}
		}
		Comentarios chr = new Comentarios(usuAprobado,nbAprobador,comentario,mes,idHojaRumbo);
		boolean rs=claseComentarios.comentaApro(chr);
		Calendar fecha = Calendar.getInstance();
		Integer mesInt = fecha.get(Calendar.MONTH);
		Integer ano = fecha.get(Calendar.YEAR);
		Integer dia = fecha.get(Calendar.DAY_OF_MONTH);
		String fechaAct = dia.toString()+"/"+mesInt.toString()+"/"+ano.toString();
		//System.out.println(fechaAct);
		String raproNum ="rapro"+numApro;
		String numAprobadores ="";
		String aprobObtenidas ="";
		
		ArrayList<HojaRumbo> arrHR=ClaseHojaRumbo.consultaApro2(usuAprobado,mes);
		if(arrHR!=null){
			for(int i=0;i<arrHR.size();i++){
				HojaRumbo hr = arrHR.get(i);
				numAprobadores = hr.getAprobadores();
				aprobObtenidas = (hr.getAprobados()!=null?hr.getAprobados():"0");
				estatus = hr.getEstatus();
			}
		}
		int aproOb = Integer.parseInt(aprobObtenidas);
		aproOb = aproOb+1;
		aprobObtenidas = aproOb+"";
		if(numAprobadores.equals(aprobObtenidas)){
			estatus = "Aprobada";
		}
		
		//System.out.println("Aprobacion: "+raproNum+"-"+mes+"-"+fechaAct+"-"+usuAprobado+"-"+aproOb+"-"+estatus);
		HojaRumbo hr= new HojaRumbo();
		ClaseHojaRumbo.apruebaUsu(raproNum,mes,fechaAct,usuAprobado,aproOb,estatus);
		ArrayList<HojaRumbo> arrHoRu=ClaseHojaRumbo.consultaApro1(usuAprobado,mes);
		ArrayList<Comentarios> arrComents = claseComentarios.consultacomen(usuAprobado,mes);
		String apro11="", apro22="", apro33="", apro44="", mesA11="",usuario="",rapro1="", rapro2="", rapro3="", rapro4="",noap="",  nbApro1="", nbApro2="", nbApro3="", nbApro4="", estat ="", usuApro1="",usuApro2="",usuApro3="",usuApro4="";
		if(arrHoRu!=null){
			for(int i=0; i<arrHoRu.size();i++){
				HojaRumbo horu = arrHoRu.get(i);
				nbApro1=(horu.getNbApro1()!=null?horu.getNbApro1():"");
				nbApro2=(horu.getNbApro2()!=null?horu.getNbApro2():"");
				nbApro3=(horu.getNbApro3()!=null?horu.getNbApro3():"");
				nbApro4=(horu.getNbApro4()!=null?horu.getNbApro4():"");
				apro11=(horu.getApro1()!=null?horu.getApro1():"");
				apro22=(horu.getApro2()!=null?horu.getApro2():"");
				apro33=(horu.getApro3()!=null?horu.getApro3():"");
				apro44=(horu.getApro4()!=null?horu.getApro4():"");
				mesA11=(horu.getMes()!=null?horu.getMes():"");
				usuario=(horu.getUsuario()!=null?horu.getUsuario():"");
				rapro1=(horu.getRapro1()!=null?horu.getRapro1():"estatusrojo");
				rapro2=(horu.getRapro2()!=null?horu.getRapro2():"estatusrojo");
				rapro3=(horu.getRapro3()!=null?horu.getRapro3():"estatusrojo");
				rapro4=(horu.getRapro4()!=null?horu.getRapro4():"estatusrojo");
				noap=(horu.getAprobadores()!=null?horu.getAprobadores():"estatusrojo");
				estat = (horu.getEstatus()!=null?horu.getEstatus():"");
				usuApro1=(horu.getUsuApro1()!=null?horu.getUsuApro1():"");
				usuApro2=(horu.getUsuApro2()!=null?horu.getUsuApro2():"");
				usuApro3=(horu.getUsuApro3()!=null?horu.getUsuApro3():"");
				usuApro4=(horu.getUsuApro4()!=null?horu.getUsuApro4():"");
			}
		}
		   request.setAttribute("comentarios", arrComents);
		   request.setAttribute("nbApro1", new String(nbApro1));
		   request.setAttribute("nbApro2", new String(nbApro2));
		   request.setAttribute("nbApro3", new String(nbApro3));
		   request.setAttribute("nbApro4", new String(nbApro4));
		   request.setAttribute("apro1", new String(apro11));
		   request.setAttribute("apro2", new String(apro22));
		   request.setAttribute("apro3", new String(apro33));
		   request.setAttribute("apro4", new String(apro44));
		   request.setAttribute("mesA1", new String(mesA11));
		   request.setAttribute("rapro1", new String(rapro1));
		   request.setAttribute("rapro2", new String(rapro2));
		   request.setAttribute("rapro3", new String(rapro3));
		   request.setAttribute("rapro4", new String(rapro4));
		   request.setAttribute("usuario", new String(usuario));
		   request.setAttribute("noap", new String(noap));
		   request.setAttribute("mesre2", new String(mes));
		   request.setAttribute("usuario", new String(usuarioSesion));
		   request.setAttribute("estApro", new String(estat));
		   request.setAttribute("nomUsuSel", new String(nomUsuSel));
		   request.setAttribute("UsuSel", new String(usuAprobado));
		   request.setAttribute("usuApro1", new String(usuApro1));
		   request.setAttribute("usuApro2", new String(usuApro2));
		   request.setAttribute("usuApro3", new String(usuApro3));
		   request.setAttribute("usuApro4", new String(usuApro4));
		   request.setAttribute("mensajeSolicitud", new String("Su hoja de rumbo a sido aprobada."));
		   request.getRequestDispatcher("Aprobaciones2.jsp").forward(request, response);
	}

}
